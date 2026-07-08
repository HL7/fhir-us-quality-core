#!/usr/bin/env node

const { GENERATED_DIR, GENERATED_SEARCH_PARAMETER_DIR, IG_ROOT, US_QUALITY_CORE_PROFILE_PREFIX, path } = require('./lib/paths');
const { configuredFhirDefinitions, parseFsh, sourceFshFiles, sushi } = require('./lib/sushi');
const { canonicalWithVersion } = require('./lib/text');
const { ensureDir, fs, readRestData, readUscdiQualityData, write } = require('./lib/io');
const { addAssignment, addCodeAssignment, generatedFshFile, ruleSetToFsh } = require('./lib/fsh-output');
const { profileMaps, requireProfileDefinition } = require('./lib/profiles');
const { mappedProfilesByResource } = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const { Type } = sushi.utils;
const { Instance, RuleSet } = sushi.fshtypes;

const GENERATED_PATH = path.join(GENERATED_DIR, 'USQualityCoreCapabilityStatementRest.fsh');
const SEARCH_PARAMETER_DIR = GENERATED_SEARCH_PARAMETER_DIR;
const RULESET_NAME = 'GeneratedUSQualityCoreCapabilityStatementRest';
const EXPECTATION_EXTENSION = 'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation';
const SEARCH_COMBINATION_EXTENSION =
  'http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination';
const FSH_FILES = sourceFshFiles();
const SYSTEM_INTERACTIONS = {
  transaction: 'MAY',
  batch: 'MAY',
  'search-system': 'MAY',
  'history-system': 'MAY'
};
const DATE_COMPARATORS = {
  eq: 'MAY',
  ne: 'MAY',
  gt: 'SHALL',
  ge: 'SHALL',
  lt: 'SHALL',
  le: 'SHALL',
  sa: 'MAY',
  eb: 'MAY',
  ap: 'MAY'
};

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
  add(ruleSet, `${basePath}.url`, EXPECTATION_EXTENSION);
  addCode(ruleSet, `${basePath}.valueCode`, expectation);
}

function resourceHasUsQualityCoreProfile(supportedProfiles) {
  return supportedProfiles.some(url => url.startsWith(US_QUALITY_CORE_PROFILE_PREFIX));
}

function localSearchParameterId(resource, code) {
  return `us-quality-core-${kebabCase(resource)}-${code.replace(/^_/, '').replace(/_/g, '-')}`;
}

function localSearchParameterUrl(config, resource, code) {
  return `${config.canonical}/SearchParameter/${localSearchParameterId(resource, code)}`;
}

function localSearchParameterName(resource, code) {
  return `USQualityCore${resource}${pascalCase(code)}`;
}

function localSearchParameterFile(resource, code) {
  return path.join(SEARCH_PARAMETER_DIR, `${localSearchParameterName(resource, code)}.fsh`);
}

function usCoreSearchParameter(resource, code, fhirDefs) {
  const id = `us-core-${resource.toLowerCase()}-${code.replace(/^_/, '').replace(/_/g, '-')}`;
  const url = `http://hl7.org/fhir/us/core/SearchParameter/${id}`;
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

function searchParameterDefinition(config, resource, supportedProfiles, code, fhirDefs) {
  if (resourceHasUsQualityCoreProfile(supportedProfiles)) return localSearchParameterUrl(config, resource, code);
  return canonicalWithVersion(usCoreSearchParameter(resource, code, fhirDefs));
}

function usCoreProfileReference(url, fhirDefs) {
  return canonicalWithVersion(requireProfileDefinition(url, fhirDefs, `US Core profile ${url}`));
}

function supportedProfileReference(url, fhirDefs) {
  return url.includes('/us/core/StructureDefinition/') ? usCoreProfileReference(url, fhirDefs) : url;
}

function addSearchCombination(ruleSet, basePath, combination) {
  addExpectation(ruleSet, `${basePath}.extension[0]`, combination.expectation);
  combination.params.forEach((param, index) => {
    add(ruleSet, `${basePath}.extension[${index + 1}].url`, 'required');
    add(ruleSet, `${basePath}.extension[${index + 1}].valueString`, param);
  });
  add(ruleSet, `${basePath}.url`, SEARCH_COMBINATION_EXTENSION);
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

function addDateComparators(instance) {
  Object.entries(DATE_COMPARATORS).forEach(([comparator, expectation], index) => {
    const comparatorPath = `comparator[${index}]`;
    addCode(instance, comparatorPath, comparator);
    addExpectation(instance, `${comparatorPath}.extension[0]`, expectation);
  });
}

function assertSearchParamCanBeGenerated(resource, code, searchParam) {
  const missing = ['type', 'documentation', 'expectation', 'expression'].filter(key => searchParam[key] == null);
  if (missing.length) {
    throw new Error(`${resource}.${code} is missing required search parameter key(s): ${missing.join(', ')}`);
  }
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
      searchParameterDefinition(config, resource, supportedProfiles, code, fhirDefs)
    );
    addCode(ruleSet, `${searchParamPath}.type`, searchParam.type);
    add(ruleSet, `${searchParamPath}.documentation`, searchParam.documentation);
  });
}

function addResource(ruleSet, resource, resourceConfig, supportedProfiles, index, config, fhirDefs) {
  const resourcePath = `resource[${index}]`;
  addExpectation(ruleSet, `${resourcePath}.extension[0]`, 'SHALL');
  (resourceConfig.searchCombinations ?? []).forEach((combination, combinationIndex) => {
    addSearchCombination(ruleSet, `${resourcePath}.extension[${combinationIndex + 1}]`, combination);
  });
  addCode(ruleSet, `${resourcePath}.type`, resource);
  addSupportedProfiles(ruleSet, resourcePath, supportedProfiles, fhirDefs);
  if (resourceConfig.documentation) add(ruleSet, `${resourcePath}.documentation`, resourceConfig.documentation);
  addInteractions(ruleSet, resourcePath, resourceConfig.interactions);
  addCode(ruleSet, `${resourcePath}.referencePolicy[0]`, 'resolves');
  addRevIncludes(ruleSet, resourcePath, resourceConfig.revIncludes);
  addSearchParams(ruleSet, resourcePath, resource, resourceConfig, supportedProfiles, config, fhirDefs);
}

function addSystemInteractions(ruleSet) {
  Object.entries(SYSTEM_INTERACTIONS).forEach(([interaction, expectation], index) => {
    const interactionPath = `interaction[${index}]`;
    addExpectation(ruleSet, `${interactionPath}.extension[0]`, expectation);
    addCode(ruleSet, `${interactionPath}.code`, interaction);
  });
}

function generatedFsh(ruleSet) {
  return generatedFshFile({
    scriptName: 'generate_rest.js',
    inputPaths: ['data/rest.json', 'data/uscdi_plus_quality.json'],
    content: ruleSetToFsh(ruleSet)
  });
}

function generatedSearchParameterFsh(instance) {
  return generatedFshFile({
    scriptName: 'generate_rest.js',
    inputPaths: ['data/rest.json'],
    content: instance.toFSH()
  });
}

function searchParameterInstance(config, resource, code, searchParam) {
  const instance = new Instance(localSearchParameterId(resource, code));
  const contact = config.contact.find(item => item.name === 'Clinical Quality Information WG') ?? config.contact[0];
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
  add(instance, 'description', `US Quality Core ${resource} ${code} Search Parameter`);
  addCode(instance, 'code', code);
  addCode(instance, 'base[0]', resource);
  addCode(instance, 'type', searchParam.type);
  add(instance, 'expression', searchParam.expression);
  addCode(instance, 'xpathUsage', 'normal');
  add(instance, 'multipleOr', true);
  add(instance, 'multipleAnd', true);
  if (searchParam.type === 'date') addDateComparators(instance);

  return instance;
}

function localSearchParameters(resources, supportedProfilesByResource) {
  return Object.entries(resources).flatMap(([resource, resourceConfig]) => {
    const supportedProfiles = supportedProfilesByResource.get(resource) ?? [];
    if (!resourceHasUsQualityCoreProfile(supportedProfiles)) return [];

    return Object.entries(resourceConfig.searchParams ?? {}).map(([code, searchParam]) => {
      assertSearchParamCanBeGenerated(resource, code, searchParam);
      return { resource, code, searchParam };
    });
  });
}

function writeSearchParameters(entries, config) {
  ensureDir(SEARCH_PARAMETER_DIR);
  const expectedFiles = new Set(
    entries.map(({ resource, code, searchParam }) => {
      const file = localSearchParameterFile(resource, code);
      write(file, generatedSearchParameterFsh(searchParameterInstance(config, resource, code, searchParam)));
      return file;
    })
  );

  fs.readdirSync(SEARCH_PARAMETER_DIR)
    .filter(file => file.endsWith('.fsh'))
    .map(file => path.join(SEARCH_PARAMETER_DIR, file))
    .filter(file => !expectedFiles.has(file))
    .forEach(file => fs.unlinkSync(file));

  return expectedFiles.size;
}

function assertResourceCoverage(resources, supportedProfilesByResource) {
  const configuredResources = new Set(Object.keys(resources));
  const mappedResources = new Set(supportedProfilesByResource.keys());
  const missingConfigs = [...mappedResources].filter(resource => !configuredResources.has(resource)).sort();
  const unmappedConfigs = [...configuredResources].filter(resource => !mappedResources.has(resource)).sort();

  if (missingConfigs.length) {
    throw new Error(
      `Mapped USCDI+ Quality profile resources are missing from data/rest.json:\n- ${missingConfigs.join(
        '\n- '
      )}`
    );
  }

  if (unmappedConfigs.length) {
    throw new Error(
      `data/rest.json includes resources with no data/uscdi_plus_quality.json profile mappings:\n- ${unmappedConfigs.join(
        '\n- '
      )}`
    );
  }
}

async function main(log) {
  const { resources, dataElements, config } = await log.step('Reading JSON inputs and IG config', () => ({
    resources: readRestData(),
    dataElements: readUscdiQualityData(),
    config: sushi.utils.readConfig(IG_ROOT)
  }));
  const fhirDefs = await log.step('Loading configured FHIR definitions', configuredFhirDefinitions);
  const { byId: profilesById, byName: profilesByName } = await log.step('Parsing authored FSH profiles', () =>
    profileMaps(parseFsh(FSH_FILES))
  );
  const supportedProfilesByResource = await log.step('Inferring supported profiles by REST resource', () =>
    mappedProfilesByResource(dataElements, profilesById, profilesByName, fhirDefs)
  );
  const ruleSet = new RuleSet(RULESET_NAME);
  let searchParameterCount = 0;

  await log.step('Building CapabilityStatement rest RuleSet', () => {
    assertResourceCoverage(resources, supportedProfilesByResource);
    Object.entries(resources).forEach(([resource, resourceConfig], index) => {
      addResource(ruleSet, resource, resourceConfig, supportedProfilesByResource.get(resource), index, config, fhirDefs);
    });
    addSystemInteractions(ruleSet);
  });

  await log.step('Writing generated SearchParameters', () => {
    searchParameterCount = writeSearchParameters(localSearchParameters(resources, supportedProfilesByResource), config);
  });

  await log.step('Writing generated CapabilityStatement rest RuleSet', () => {
    ensureDir(GENERATED_DIR);
    write(GENERATED_PATH, generatedFsh(ruleSet));
  });

  return [
    `Generated ${GENERATED_PATH}`,
    `Generated ${searchParameterCount} SearchParameter definitions in ${SEARCH_PARAMETER_DIR}`,
    `CapabilityStatement rest resources: ${Object.keys(resources).length}`,
    `Supported profiles: ${[...supportedProfilesByResource.values()].reduce((sum, profiles) => sum + profiles.length, 0)}`
  ];
}

runGenerator('generate:rest', main);
