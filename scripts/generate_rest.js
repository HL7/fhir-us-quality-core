#!/usr/bin/env node

const path = require('node:path');

const {
  fhir,
  generated,
  labels,
  local,
  paths,
  rest,
  upstream
} = require('./generator.config');
const { configuredFhirDefinitions, parseFsh, sourceFshFiles, sushi } = require('./lib/sushi');
const { canonicalWithVersion } = require('./lib/text');
const {
  ensureDir,
  fs,
  readSearchCapabilities,
  readUscdiQualityDefinitions,
  write
} = require('./lib/io');
const { addAssignment, addCodeAssignment, generatedFshFile, ruleSetToFsh } = require('./lib/fsh-output');
const { profileMaps, profileResourceType, requireProfileDefinition } = require('./lib/profiles');
const {
  searchRequirementDocumentation,
  usCoreDocumentationContext
} = require('./lib/rest-documentation');
const { mappedProfilesByResource } = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const { Type } = sushi.utils;
const { Instance, RuleSet } = sushi.fshtypes;

const FSH_FILES = sourceFshFiles();

function kebabCase(value) {
  return String(value)
    .replace(/([a-z0-9])([A-Z])/g, '$1-$2')
    .replace(/_/g, '-')
    .toLowerCase();
}

function pascalCase(value) {
  return String(value)
    .replace(/^_/, '')
    .split(/[^A-Za-z0-9]+/)
    .filter(Boolean)
    .map(part => `${part[0].toUpperCase()}${part.slice(1)}`)
    .join('');
}

function add(ruleSet, pathValue, value) {
  addAssignment(ruleSet, pathValue, value);
}

function addCode(ruleSet, pathValue, code) {
  addCodeAssignment(ruleSet, pathValue, code);
}

function addExpectation(ruleSet, basePath, expectation) {
  add(ruleSet, `${basePath}.url`, fhir.capabilityExpectationExtensionUrl);
  addCode(ruleSet, `${basePath}.valueCode`, expectation);
}

function resourceHasLocalProfile(supportedProfiles, config) {
  const localProfileUrlPrefix = `${config.canonical.replace(/\/$/, '')}/StructureDefinition/`;
  return supportedProfiles.some(url => url.startsWith(localProfileUrlPrefix));
}

function localSearchParameterId(resource, code) {
  return `${local.searchParameterIdPrefix}${kebabCase(resource)}-${code
    .replace(/^_/, '')
    .replace(/_/g, '-')}`;
}

function localSearchParameterUrl(config, resource, code) {
  return `${config.canonical}/SearchParameter/${localSearchParameterId(resource, code)}`;
}

function localSearchParameterName(resource, code) {
  return `${local.searchParameterNamePrefix}${resource}${pascalCase(code)}`;
}

function localSearchParameterFile(resource, code) {
  return path.join(
    paths.generatedSearchParameterDir,
    `${localSearchParameterName(resource, code)}.fsh`
  );
}

function usCoreSearchParameter(resource, code, fhirDefs) {
  const id = `${upstream.usCore.searchParameterIdPrefix}${resource.toLowerCase()}-${code
    .replace(/^_/, '')
    .replace(/_/g, '-')}`;
  const url = `${upstream.usCore.searchParameterUrlPrefix}${id}`;
  const searchParameter = fhirDefs.fishForFHIR(url, Type.Instance);

  if (
    searchParameter?.resourceType !== 'SearchParameter' ||
    searchParameter.code !== code ||
    !searchParameter.base?.includes(resource)
  ) {
    throw new Error(`Unable to resolve US Core SearchParameter ${id} from configured SUSHI dependencies.`);
  }

  return searchParameter;
}

function primitiveExpectation(primitive) {
  return (primitive?.extension ?? [])
    .find(extension => extension.url === fhir.capabilityExpectationExtensionUrl)
    ?.valueCode ?? null;
}

function comparatorExpectations(searchParameter) {
  return Object.fromEntries(
    (searchParameter.comparator ?? []).map((comparator, index) => [
      comparator,
      primitiveExpectation(searchParameter._comparator?.[index])
    ])
  );
}

function assertUsCoreSearchBehavior(resource, code, configured, searchParameter) {
  for (const name of ['multipleOr', 'multipleAnd']) {
    const upstream = {
      value: searchParameter[name],
      expectation: primitiveExpectation(searchParameter[`_${name}`])
    };
    if (
      configured[name].value !== upstream.value ||
      configured[name].expectation !== upstream.expectation
    ) {
      throw new Error(
        `${resource}.${code}.${name} does not match US Core ${searchParameter.id}: ` +
        `${JSON.stringify(configured[name])} != ${JSON.stringify(upstream)}.`
      );
    }
  }

  const upstreamComparators = comparatorExpectations(searchParameter);
  if (JSON.stringify(configured.comparators ?? {}) !== JSON.stringify(upstreamComparators)) {
    throw new Error(
      `${resource}.${code}.comparators does not match US Core ${searchParameter.id}: ` +
      `${JSON.stringify(configured.comparators ?? {})} != ${JSON.stringify(upstreamComparators)}.`
    );
  }
}

function searchParameterDefinition(config, resource, supportedProfiles, code, searchParam, fhirDefs) {
  if (resourceHasLocalProfile(supportedProfiles, config)) {
    return localSearchParameterUrl(config, resource, code);
  }
  const searchParameter = usCoreSearchParameter(resource, code, fhirDefs);
  assertUsCoreSearchBehavior(resource, code, searchParam, searchParameter);
  return canonicalWithVersion(searchParameter);
}

function usCoreProfileReference(url, fhirDefs) {
  return canonicalWithVersion(requireProfileDefinition(url, fhirDefs, `US Core profile ${url}`));
}

function supportedProfileReference(url, fhirDefs) {
  return url.startsWith(upstream.usCore.profileUrlPrefix)
    ? usCoreProfileReference(url, fhirDefs)
    : url;
}

function addSearchCombination(ruleSet, basePath, combination) {
  addExpectation(ruleSet, `${basePath}.extension[0]`, combination.expectation);
  combination.params.forEach((param, index) => {
    add(ruleSet, `${basePath}.extension[${index + 1}].url`, 'required');
    add(ruleSet, `${basePath}.extension[${index + 1}].valueString`, param);
  });
  add(ruleSet, `${basePath}.url`, fhir.searchParameterCombinationExtensionUrl);
}

function addSupportedProfiles(ruleSet, resourcePath, profiles, fhirDefs) {
  profiles.map(url => supportedProfileReference(url, fhirDefs)).forEach((url, index) => {
    add(ruleSet, `${resourcePath}.supportedProfile[${index}]`, url);
  });
}

function addInteractions(ruleSet, resourcePath, interactions) {
  Object.entries(interactions ?? {}).forEach(([interaction, expectation], index) => {
    const interactionPath = `${resourcePath}.interaction[${index}]`;
    addExpectation(ruleSet, `${interactionPath}.extension[0]`, expectation);
    addCode(ruleSet, `${interactionPath}.code`, interaction);
  });
}

function addRevIncludes(ruleSet, resourcePath, revIncludes) {
  (revIncludes ?? []).forEach((revInclude, index) => {
    const revIncludePath = `${resourcePath}.searchRevInclude[${index}]`;
    add(ruleSet, revIncludePath, revInclude.value);
    addExpectation(ruleSet, `${revIncludePath}.extension[0]`, revInclude.expectation);
  });
}

function addComparators(instance, comparators) {
  Object.entries(comparators ?? {}).forEach(([comparator, expectation], index) => {
    const comparatorPath = `comparator[${index}]`;
    addCode(instance, comparatorPath, comparator);
    addExpectation(instance, `${comparatorPath}.extension[0]`, expectation);
  });
}

function assertExpectation(context, value) {
  if (!['SHALL', 'SHOULD', 'MAY'].includes(value)) {
    throw new Error(`${context} must be SHALL, SHOULD, or MAY.`);
  }
}

function assertMultiplicity(resource, code, searchParam, name) {
  const value = searchParam[name];
  if (value == null || typeof value !== 'object' || Array.isArray(value)) {
    throw new Error(`${resource}.${code}.${name} must be an object.`);
  }
  if (typeof value.value !== 'boolean') {
    throw new Error(`${resource}.${code}.${name}.value must be a boolean.`);
  }
  assertExpectation(`${resource}.${code}.${name}.expectation`, value.expectation);
}

function assertComparators(resource, code, searchParam) {
  const comparators = searchParam.comparators;
  if (searchParam.type !== 'date') {
    if (comparators != null) {
      throw new Error(`${resource}.${code}.comparators is only valid for date search parameters.`);
    }
    return;
  }
  if (comparators == null || typeof comparators !== 'object' || Array.isArray(comparators)) {
    throw new Error(`${resource}.${code}.comparators must be an object for a date search parameter.`);
  }
  const validComparators = new Set(['eq', 'ne', 'gt', 'ge', 'lt', 'le', 'sa', 'eb', 'ap']);
  for (const [comparator, expectation] of Object.entries(comparators)) {
    if (!validComparators.has(comparator)) {
      throw new Error(`${resource}.${code}.comparators contains unsupported comparator ${comparator}.`);
    }
    assertExpectation(`${resource}.${code}.comparators.${comparator}`, expectation);
  }
}

function assertSearchParamCanBeGenerated(resource, code, searchParam) {
  const missing = [
    'type',
    'documentation',
    'expectation',
    'expression',
    'exampleValue',
    'multipleOr',
    'multipleAnd'
  ]
    .filter(key => searchParam[key] == null);
  if (missing.length) {
    throw new Error(`${resource}.${code} is missing required search parameter key(s): ${missing.join(', ')}`);
  }
  if (typeof searchParam.exampleValue !== 'string' || searchParam.exampleValue.trim() === '') {
    throw new Error(`${resource}.${code}.exampleValue must be a non-empty string.`);
  }
  assertMultiplicity(resource, code, searchParam, 'multipleOr');
  assertMultiplicity(resource, code, searchParam, 'multipleAnd');
  assertComparators(resource, code, searchParam);
}

function addSearchParams(ruleSet, resourcePath, resource, resourceConfig, supportedProfiles, config, fhirDefs) {
  Object.entries(resourceConfig.searchParams ?? {}).forEach(([code, searchParam], index) => {
    assertSearchParamCanBeGenerated(resource, code, searchParam);
    const searchParamPath = `${resourcePath}.searchParam[${index}]`;
    addExpectation(ruleSet, `${searchParamPath}.extension[0]`, searchParam.expectation);
    add(ruleSet, `${searchParamPath}.name`, code);
    add(
      ruleSet,
      `${searchParamPath}.definition`,
      searchParameterDefinition(config, resource, supportedProfiles, code, searchParam, fhirDefs)
    );
    addCode(ruleSet, `${searchParamPath}.type`, searchParam.type);
    add(ruleSet, `${searchParamPath}.documentation`, searchParam.documentation);
  });
}

function addResource(
  ruleSet,
  resource,
  resourceConfig,
  supportedProfiles,
  index,
  config,
  fhirDefs,
  documentationContext,
  resourceExpectation
) {
  const resourcePath = `resource[${index}]`;
  addExpectation(ruleSet, `${resourcePath}.extension[0]`, resourceExpectation);
  (resourceConfig.searchCombinations ?? []).forEach((combination, combinationIndex) => {
    addSearchCombination(ruleSet, `${resourcePath}.extension[${combinationIndex + 1}]`, combination);
  });
  addCode(ruleSet, `${resourcePath}.type`, resource);
  addSupportedProfiles(ruleSet, resourcePath, supportedProfiles, fhirDefs);
  add(
    ruleSet,
    `${resourcePath}.documentation`,
    searchRequirementDocumentation(
      resource,
      resourceConfig,
      documentationContext,
      resourceExpectation
    )
  );
  addInteractions(ruleSet, resourcePath, resourceConfig.interactions);
  addCode(ruleSet, `${resourcePath}.referencePolicy[0]`, 'resolves');
  addRevIncludes(ruleSet, resourcePath, resourceConfig.revIncludes);
  addSearchParams(ruleSet, resourcePath, resource, resourceConfig, supportedProfiles, config, fhirDefs);
}

function addSystemInteractions(ruleSet) {
  Object.entries(rest.systemInteractions).forEach(([interaction, expectation], index) => {
    const interactionPath = `interaction[${index}]`;
    addExpectation(ruleSet, `${interactionPath}.extension[0]`, expectation);
    addCode(ruleSet, `${interactionPath}.code`, interaction);
  });
}

function generatedFsh(ruleSet) {
  return generatedFshFile({
    scriptName: 'generate_rest.js',
    inputPaths: [
      'definitions/capabilities.json',
      'definitions/uscdi_plus_quality.json'
    ],
    content: ruleSetToFsh(ruleSet)
  });
}

function generatedSearchParameterFsh(instance) {
  return generatedFshFile({
    scriptName: 'generate_rest.js',
    inputPaths: ['definitions/capabilities.json'],
    content: instance.toFSH()
  });
}

function searchParameterInstance(config, resource, code, searchParam) {
  const instance = new Instance(localSearchParameterId(resource, code));
  const contact =
    config.contact.find(item => item.name === local.preferredContactName) ??
    config.contact[0];
  instance.instanceOf = 'SearchParameter';
  instance.usage = 'Definition';

  add(instance, 'url', localSearchParameterUrl(config, resource, code));
  add(instance, 'version', config.version.replace(/-.*/, ''));
  add(instance, 'name', localSearchParameterName(resource, code));
  addCode(instance, 'status', 'active');
  add(instance, 'date', config.date);
  add(instance, 'publisher', config.publisher);
  add(instance, 'contact[0].name', contact.name);
  addCode(instance, 'contact[0].telecom[0].system', contact.telecom[0].system);
  add(instance, 'contact[0].telecom[0].value', contact.telecom[0].value);
  add(
    instance,
    'description',
    `${labels.implementationGuide} ${resource} ${code} Search Parameter`
  );
  addCode(instance, 'code', code);
  addCode(instance, 'base[0]', resource);
  addCode(instance, 'type', searchParam.type);
  add(instance, 'expression', searchParam.expression);
  addCode(instance, 'xpathUsage', 'normal');
  for (const name of ['multipleOr', 'multipleAnd']) {
    add(instance, name, searchParam[name].value);
    addExpectation(instance, `${name}.extension[0]`, searchParam[name].expectation);
  }
  addComparators(instance, searchParam.comparators);

  return instance;
}

function localSearchParameters(resources, supportedProfilesByResource, config) {
  return Object.entries(resources).flatMap(([resource, resourceConfig]) => {
    const supportedProfiles = supportedProfilesByResource.get(resource) ?? [];
    if (!resourceHasLocalProfile(supportedProfiles, config)) return [];

    return Object.entries(resourceConfig.searchParams ?? {}).map(([code, searchParam]) => {
      assertSearchParamCanBeGenerated(resource, code, searchParam);
      return { resource, code, searchParam };
    });
  });
}

function writeSearchParameters(entries, config) {
  ensureDir(paths.generatedSearchParameterDir);
  const expectedFiles = new Set(
    entries.map(({ resource, code, searchParam }) => {
      const file = localSearchParameterFile(resource, code);
      write(file, generatedSearchParameterFsh(searchParameterInstance(config, resource, code, searchParam)));
      return file;
    })
  );

  fs.readdirSync(paths.generatedSearchParameterDir)
    .filter(file => file.endsWith('.fsh'))
    .map(file => path.join(paths.generatedSearchParameterDir, file))
    .filter(file => !expectedFiles.has(file))
    .forEach(file => fs.unlinkSync(file));

  return expectedFiles.size;
}

function assertResourceCoverage(resources, supportedProfilesByResource) {
  const configuredResources = new Set(Object.keys(resources));
  const supportedResources = new Set(supportedProfilesByResource.keys());
  const missingConfigs = [...supportedResources].filter(resource => !configuredResources.has(resource)).sort();
  const unsupportedConfigs = [...configuredResources].filter(resource => !supportedResources.has(resource)).sort();

  if (missingConfigs.length) {
    throw new Error(
      `Supported profile resources are missing from definitions/capabilities.json:\n- ${missingConfigs.join(
        '\n- '
      )}`
    );
  }

  if (unsupportedConfigs.length) {
    throw new Error(
      `definitions/capabilities.json includes resources with no authored profiles or USCDI+ Quality profile mappings:\n- ${unsupportedConfigs.join(
        '\n- '
      )}`
    );
  }
}

async function main(log) {
  const { resources, dataElements, config } = await log.step('Reading JSON inputs and IG config', () => ({
    resources: readSearchCapabilities(),
    dataElements: readUscdiQualityDefinitions(),
    config: sushi.utils.readConfig(paths.igRoot)
  }));
  const fhirDefs = await log.step('Loading configured FHIR definitions', configuredFhirDefinitions);
  const documentationContext = await log.step('Indexing US Core search requirements', () =>
    usCoreDocumentationContext(config, fhirDefs)
  );
  const { byId: profilesById, byName: profilesByName } = await log.step('Parsing authored FSH profiles', () =>
    profileMaps(parseFsh(FSH_FILES))
  );
  const requiredProfilesByResource = await log.step('Inferring required profiles by REST resource', () =>
    mappedProfilesByResource(dataElements, profilesById, profilesByName, fhirDefs)
  );
  const supportedProfilesByResource = new Map(
    [...requiredProfilesByResource].map(([resource, urls]) => [resource, [...urls]])
  );
  // Authored profiles without USCDI+ Quality mappings are also available for optional support.
  for (const profile of profilesById.values()) {
    if (!profile.id?.startsWith(local.profileIdPrefix)) continue;
    const resource = profileResourceType(profile, profilesById, profilesByName, fhirDefs);
    const urls = supportedProfilesByResource.get(resource) ?? [];
    const url = `${config.canonical.replace(/\/$/, '')}/StructureDefinition/${profile.id}`;
    if (!urls.includes(url)) urls.push(url);
    supportedProfilesByResource.set(resource, urls);
  }
  const ruleSet = new RuleSet(generated.capabilityStatementRestRuleSetName);
  let searchParameterCount = 0;

  await log.step('Building CapabilityStatement rest RuleSet', () => {
    assertResourceCoverage(resources, supportedProfilesByResource);
    Object.entries(resources).forEach(([resource, resourceConfig], index) => {
      addResource(
        ruleSet,
        resource,
        resourceConfig,
        supportedProfilesByResource.get(resource),
        index,
        config,
        fhirDefs,
        documentationContext,
        requiredProfilesByResource.has(resource) ? 'SHALL' : 'MAY'
      );
    });
    addSystemInteractions(ruleSet);
  });

  await log.step('Writing generated SearchParameters', () => {
    searchParameterCount = writeSearchParameters(
      localSearchParameters(resources, supportedProfilesByResource, config),
      config
    );
  });

  await log.step('Writing generated CapabilityStatement rest RuleSet', () => {
    ensureDir(paths.generatedFshDir);
    write(paths.generatedCapabilityStatementRestFile, generatedFsh(ruleSet));
  });

  return [
    `Generated ${paths.generatedCapabilityStatementRestFile}`,
    `Generated ${searchParameterCount} SearchParameter definitions in ${paths.generatedSearchParameterDir}`,
    `CapabilityStatement rest resources: ${Object.keys(resources).length}`,
    `Supported profiles: ${[...supportedProfilesByResource.values()].reduce((sum, profiles) => sum + profiles.length, 0)}`
  ];
}

runGenerator('generate:rest', main);
