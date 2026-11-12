#!/usr/bin/env node

const path = require('node:path');

const {
  labels,
  local,
  pages,
  paths,
  upstream
} = require('./generator.config');
const {
  assertNoSushiErrors,
  compileFsh,
  configuredFhirDefinitions,
  parseFsh,
  profileSourceFshFiles,
  sourceFshFiles,
  sushi
} = require('./lib/sushi');
const {
  ensureDir,
  read,
  readSearchCapabilities,
  readUscdiQualityDefinitions,
  writeJson
} = require('./lib/io');
const { searchRequirementRows, usCoreDocumentationContext } = require('./lib/rest-documentation');
const { fshPathToDisplayPath, getOrSet, jsonPathToFshPath, markdownText, urlTail } = require('./lib/text');
const {
  displayTitle,
  localParent,
  profileMaps,
  profileResourceTypes,
  requireProfileDefinition,
  requireStructureDefinition,
  sortByDisplayTitle,
  usCoreAncestor
} = require('./lib/profiles');
const { profileConformanceIndicators } = require('./lib/conformance-indicators');
const {
  assertAllDataElementsMapped,
  generatedUscdiQualityElements,
  generatedUscdiQualityRuleSets,
  mappedProfilesByResource
} = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const FSH_FILES = sourceFshFiles();

async function compiledProfileDefinitions(profileIds) {
  const result = await compileFsh(profileSourceFshFiles(), {
    extraInputs: [read(paths.generatedFlagsFile)],
    snapshot: true
  });
  assertNoSushiErrors(result, 'SUSHI reported errors while compiling profile conformance indicators');

  return new Map(
    result.fhir
      .filter(resource => resource.resourceType === 'StructureDefinition' && profileIds.has(resource.id))
      .map(profile => [profile.id, profile])
  );
}

function profilePath(profileOrId) {
  const id = typeof profileOrId === 'string' ? profileOrId : profileOrId.id;
  return `StructureDefinition-${id}.html`;
}

function usCoreProfileSummary(profile) {
  return {
    id: profile.id,
    title: profile.title ?? profile.name ?? profile.id
  };
}

function stripUscdiQualityPrefix(value) {
  const text = markdownText(value);
  const prefix = `(${labels.uscdiQuality})`;
  return text.startsWith(prefix) ? text.slice(prefix.length).trimStart() : text;
}

function noteId(dataElement) {
  return `${dataElement.class}-${dataElement.name}`
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

function dataElementId(dataElement) {
  return `data-element-${noteId(dataElement)}`;
}

function groupsByClass(dataElements) {
  const groups = new Map();
  for (const dataElement of dataElements) {
    getOrSet(groups, dataElement.class, () => []).push(dataElement);
  }
  return [...groups.entries()].map(([name, elements]) => ({
    name,
    elements: elements.map(groupDataElement)
  }));
}

function groupDataElement(element) {
  return {
    name: element.name,
    description: element.description,
    dataElementId: element.dataElementId,
    noteId: element.noteId,
    profileOverride: element.profileOverride,
    usQualityCore: element.usQualityCore,
    usCore: element.usCore
  };
}

function uniqueMappings(mappings) {
  return [...new Map(mappings.map(mapping => [urlTail(mapping.profile), mapping])).values()];
}

function usQualityCoreMapping(mapping, profilesById) {
  const id = urlTail(mapping.profile);
  const profile = profilesById.get(id);
  return {
    title: profile ? displayTitle(profile) : id,
    path: profilePath(id)
  };
}

function usCoreMapping(mapping, fhirDefs) {
  const profile = requireProfileDefinition(mapping.profile, fhirDefs, `US Core profile ${mapping.profile}`);
  return {
    id: profile.id,
    title: profile.title ?? profile.name ?? profile.id
  };
}

function narrativeValue(dataElement, key) {
  const value = dataElement.narrative?.[key];
  return value == null ? null : String(value).trim();
}

function resolvedDataElement(dataElement, profilesById, fhirDefs) {
  const note = narrativeValue(dataElement, 'note');
  const profileOverride = narrativeValue(dataElement, 'profileOverride');

  return {
    class: dataElement.class,
    name: dataElement.name,
    description: markdownText(dataElement.description ?? ''),
    dataElementId: dataElementId(dataElement),
    noteId: note == null ? null : noteId(dataElement),
    note,
    profileOverride,
    usQualityCore: uniqueMappings(dataElement.mappings.usQualityCore).map(mapping =>
      usQualityCoreMapping(mapping, profilesById)
    ),
    usCore: uniqueMappings(dataElement.mappings.usCore).map(mapping => usCoreMapping(mapping, fhirDefs))
  };
}

function uscdiQualityDataElementsData(dataElements, profilesById, fhirDefs) {
  const elements = dataElements.map(dataElement => resolvedDataElement(dataElement, profilesById, fhirDefs));

  return {
    groups: groupsByClass(elements),
    notes: elements
      .filter(element => element.note != null)
      .map(element => ({
        class: element.class,
        name: element.name,
        note: element.note
      }))
  };
}

function orderedProfiles(profiles, profilesById, profilesByName) {
  const childrenByParentId = new Map();
  const roots = [];
  const profileSet = new Set(profiles);

  for (const profile of profiles) {
    const parent = localParent(profile, profilesById, profilesByName);
    if (parent && profileSet.has(parent)) {
      getOrSet(childrenByParentId, parent.id, () => []).push(profile);
    } else {
      roots.push(profile);
    }
  }

  const ordered = [];

  function visit(profile, depth) {
    ordered.push({ profile, depth });
    for (const child of sortByDisplayTitle(childrenByParentId.get(profile.id) ?? [])) {
      visit(child, depth + 1);
    }
  }

  for (const profile of sortByDisplayTitle(roots)) {
    visit(profile, 0);
  }

  return ordered;
}

function usQualityCoreProfileTableRow(profile, depth, profilesById, profilesByName, fhirDefs) {
  const usCore = usCoreAncestor(profile, profilesById, profilesByName, fhirDefs);

  return {
    title: displayTitle(profile),
    path: profilePath(profile),
    depth,
    showResource: depth === 0,
    usCore: usCore ? usCoreProfileSummary(usCore) : null
  };
}

function usCoreProfileTableRows(urls, hasLocalProfiles, fhirDefs) {
  return urls
    .filter(url => url.startsWith(upstream.usCore.profileUrlPrefix))
    .map(url => requireProfileDefinition(url, fhirDefs, `US Core profile ${url}`))
    .sort((a, b) => usCoreProfileSummary(a).title.localeCompare(usCoreProfileSummary(b).title))
    .map((profile, index) => ({
      path: null,
      depth: 0,
      showResource: !hasLocalProfiles && index === 0,
      usCore: usCoreProfileSummary(profile)
    }));
}

function profileTableData(
  profilesById,
  profilesByName,
  resourceTypes,
  supportedProfilesByResource,
  fhirDefs
) {
  const resources = new Map();
  const profiles = [...profilesById.values()].filter(profile =>
    profile.id?.startsWith(local.profileIdPrefix)
  );

  for (const profile of profiles) {
    getOrSet(resources, resourceTypes.get(profile.id), () => []).push(profile);
  }

  for (const resource of supportedProfilesByResource.keys()) {
    getOrSet(resources, resource, () => []);
  }

  return {
    resources: [...resources.keys()].sort().map(resource => {
      const localProfiles = resources.get(resource);
      const localRows = orderedProfiles(localProfiles, profilesById, profilesByName).map(({ profile, depth }) =>
        usQualityCoreProfileTableRow(profile, depth, profilesById, profilesByName, fhirDefs)
      );
      const usCoreRows = usCoreProfileTableRows(
        supportedProfilesByResource.get(resource) ?? [],
        localRows.length > 0,
        fhirDefs
      );

      return {
        name: resource,
        path: `${resource.toLowerCase()}.html`,
        profiles: [...localRows, ...usCoreRows]
      };
    })
  };
}

function searchValuePattern(param, type) {
  if (param === '_id') return '[id]';
  if (param === 'patient' || param === 'subject') return '{Patient/}[id]';
  if (param === 'questionnaire') return '{Questionnaire/}[id]';
  if (type === 'reference') return `[${param}-reference]`;
  if (type === 'date') return '{gt|lt|ge|le}[dateTime]';
  if (param === 'do-not-perform') return '[true|false]';
  if (param === 'status') return '[status]';
  if (param === 'intent') return '[intent]';
  if (type === 'token') return '{system|}[search_code]';
  return `[${param}-value]`;
}

function assertSearchBehavior(resource, param, searchParam) {
  for (const name of ['multipleOr', 'multipleAnd']) {
    const behavior = searchParam[name];
    if (behavior == null || typeof behavior !== 'object' || Array.isArray(behavior)) {
      throw new Error(`${resource}.${param}.${name} must be an object.`);
    }
    if (typeof behavior.value !== 'boolean') {
      throw new Error(`${resource}.${param}.${name}.value must be a boolean.`);
    }
    if (!['SHALL', 'SHOULD', 'MAY'].includes(behavior.expectation)) {
      throw new Error(`${resource}.${param}.${name}.expectation must be SHALL, SHOULD, or MAY.`);
    }
  }

  if (searchParam.type === 'date') {
    if (
      searchParam.comparators == null ||
      typeof searchParam.comparators !== 'object' ||
      Array.isArray(searchParam.comparators)
    ) {
      throw new Error(`${resource}.${param}.comparators must be an object for a date search parameter.`);
    }
    const validComparators = new Set(['eq', 'ne', 'gt', 'ge', 'lt', 'le', 'sa', 'eb', 'ap']);
    for (const [comparator, expectation] of Object.entries(searchParam.comparators)) {
      if (!validComparators.has(comparator)) {
        throw new Error(`${resource}.${param}.comparators contains unsupported comparator ${comparator}.`);
      }
      if (!['SHALL', 'SHOULD', 'MAY'].includes(expectation)) {
        throw new Error(
          `${resource}.${param}.comparators.${comparator} must be SHALL, SHOULD, or MAY.`
        );
      }
    }
  } else if (searchParam.comparators != null) {
    throw new Error(`${resource}.${param}.comparators is only valid for date search parameters.`);
  }
}

function searchBehaviorRequirements(resource, requirement, resourceConfig) {
  return requirement.params.flatMap((param, index) => {
    const searchParam = resourceConfig.searchParams?.[param];
    if (!searchParam) {
      throw new Error(`${resource} required search references unknown search parameter ${param}.`);
    }
    assertSearchBehavior(resource, param, searchParam);

    const type = requirement.types[index];
    const pattern = searchValuePattern(param, type);
    const requirements = [];

    if (type === 'token' && searchParam.multipleOr.value) {
      const optional = searchParam.multipleOr.expectation === 'SHALL' ? '' : 'optional ';
      requirements.push({
        text:
          `Including ${optional}support for OR search on \`${param}\` ` +
          `(e.g.\`${param}=${pattern},${pattern},...\`)`
      });
    }

    if (type === 'date' && searchParam.multipleAnd.value) {
      requirements.push({
        text:
          `Including optional support for AND search on \`${param}\` ` +
          `(e.g.\`${param}=[date]&${param}=[date]&...\`)`
      });
    }

    const comparatorDisplayOrder = ['gt', 'lt', 'ge', 'le', 'eq', 'ne', 'sa', 'eb', 'ap'];
    const requiredComparators = Object.entries(searchParam.comparators ?? {})
      .filter(([, expectation]) => expectation === 'SHALL')
      .map(([comparator]) => comparator)
      .sort((left, right) => comparatorDisplayOrder.indexOf(left) - comparatorDisplayOrder.indexOf(right))
      .map(comparator => `"${comparator}"`);
    if (requiredComparators.length) {
      requirements.push({
        text: `Including support for these \`${param}\` comparators: ${requiredComparators.join(', ')}`
      });
    }

    return requirements;
  });
}

const searchGuidanceByType = {
  reference: '[how to search by reference](https://hl7.org/fhir/R4/search.html#reference)',
  token: '[how to search by token](https://hl7.org/fhir/R4/search.html#token)',
  date: '[how to search by date](https://hl7.org/fhir/R4/search.html#date)'
};

function searchGuidance(types) {
  const links = [...new Set(types)]
    .map(type => searchGuidanceByType[type])
    .filter(Boolean);
  return links.length ? `See ${joinedLabels(links)}.` : '';
}

function searchValueExample(profile, resource, resourceConfig, param) {
  const profileValue = resourceConfig.profileExampleOverrides?.[profile.id]?.[param];
  const resourceValue = resourceConfig.searchParams?.[param]?.exampleValue;
  const value = profileValue ?? resourceValue;

  if (typeof value !== 'string' || value.trim() === '') {
    throw new Error(
      `${resource}.${param} is used by a required search for ${profile.id} but does not define a non-empty exampleValue.`
    );
  }

  return value.trim();
}

function searchQuery(resource, requirement, valueFor) {
  const query = requirement.params
    .map((param, index) => `${param}=${valueFor(param, requirement.types[index])}`)
    .join('&');
  return `GET [base]/${resource}?${query}`;
}

function searchRequirementStatement(resource, requirement) {
  const parameterNames = requirement.params.map(param => `\`${param}\``);
  const patientScoped = requirement.params.some(param => param === 'patient' || param === 'subject');
  const resourceScope = patientScoped
    ? `all ${resource} resources for a patient`
    : requirement.params[0] === '_id'
      ? `a ${resource} resource by id`
      : `all ${resource} resources`;

  if (parameterNames.length === 1) {
    return `searching for ${resourceScope} using the ${parameterNames[0]} search parameter`;
  }

  return `searching for ${resourceScope} using the combination of the ${joinedLabels(
    parameterNames
  )} search parameters`;
}

function joinedLabels(values) {
  if (values.length === 1) return values[0];
  if (values.length === 2) return `${values[0]} and ${values[1]}`;
  return `${values.slice(0, -1).join(', ')}, and ${values.at(-1)}`;
}

function documentedSearchRequirement(profile, resource, resourceConfig, requirement) {
  return {
    usCoreExpectation: requirement.usCoreExpectation,
    rationale: requirement.rationale,
    statement: searchRequirementStatement(resource, requirement),
    additionalRequirements: searchBehaviorRequirements(resource, requirement, resourceConfig),
    searchGuidance: searchGuidance(requirement.types),
    request: searchQuery(resource, requirement, searchValuePattern),
    example: searchQuery(resource, requirement, param =>
      searchValueExample(profile, resource, resourceConfig, param)
    )
  };
}

function profileSearchData(
  profile,
  resourceTypes,
  searchCapabilities,
  documentationContext
) {
  const resource = resourceTypes.get(profile.id);
  const resourceConfig = searchCapabilities[resource] ?? {};
  const resourceIndex = Object.keys(searchCapabilities).indexOf(resource);
  if (resourceIndex < 0) {
    throw new Error(
      `${profile.id} resolves to ${resource}, which is not configured in definitions/capabilities.json.`
    );
  }
  const requiredSearches = searchRequirementRows(resource, resourceConfig, documentationContext)
    .map(requirement =>
      documentedSearchRequirement(profile, resource, resourceConfig, requirement)
    );
  // Profiles with only optional searches still need discoverable search guidance.
  const optionalSearches = requiredSearches.length ? [] : Object.entries(resourceConfig.searchParams ?? {})
    .filter(([, searchParam]) => searchParam.expectation === 'MAY')
    .map(([code, searchParam]) => documentedSearchRequirement(profile, resource, resourceConfig, {
      params: [code],
      types: [searchParam.type],
      usCoreExpectation: null,
      rationale: searchParam.documentation
    }));

  return {
    resource,
    capabilityStatementAnchor: `${resource}1-${resourceIndex + 1}`,
    requiredSearches,
    ...(optionalSearches.length ? { optionalSearches } : {})
  };
}

function assertProfileExampleOverrides(
  profiles,
  resourceTypes,
  searchCapabilities
) {
  const profileIds = new Set(profiles.map(profile => profile.id));

  for (const [resource, resourceConfig] of Object.entries(
    searchCapabilities
  )) {
    for (const [profileId, overrides] of Object.entries(resourceConfig.profileExampleOverrides ?? {})) {
      if (!profileIds.has(profileId)) {
        throw new Error(`${resource}.profileExampleOverrides references unknown profile ${profileId}.`);
      }
      if (resourceTypes.get(profileId) !== resource) {
        throw new Error(
          `${resource}.profileExampleOverrides references ${profileId}, which is not based on ${resource}.`
        );
      }
      for (const [param, value] of Object.entries(overrides)) {
        if (!resourceConfig.searchParams?.[param]) {
          throw new Error(
            `${resource}.profileExampleOverrides.${profileId} references unknown search parameter ${param}.`
          );
        }
        if (typeof value !== 'string' || value.trim() === '') {
          throw new Error(
            `${resource}.profileExampleOverrides.${profileId}.${param} must be a non-empty string.`
          );
        }
      }
    }
  }
}

function assertProfilesHaveUscdiQualityElements(profileElements, mappedElements) {
  const missing = profileElements.filter(({ profile, elements }) =>
    mappedElements.has(profile.id) && elements.length === 0
  );
  if (!missing.length) return;

  throw new Error(
    [
      'Every mapped US Quality Core profile must have generated USCDI+ Quality elements.',
      'Missing elements:',
      ...missing.map(({ profile }) => `- ${profile.id}`)
    ].join('\n')
  );
}

function dataElementLink(dataElement) {
  return {
    class: dataElement.class,
    name: dataElement.name,
    path: `${pages.uscdiQualityDataElementPath}#${dataElementId(dataElement)}`
  };
}

function mappedDataElementsByProfilePath(dataElements) {
  const byProfilePath = new Map();

  for (const dataElement of dataElements) {
    for (const mapping of dataElement.mappings?.usQualityCore ?? []) {
      const profileId = urlTail(mapping.profile);
      const byPath = getOrSet(byProfilePath, profileId, () => new Map());

      for (const elementPath of mapping.elements ?? []) {
        const fshPath = jsonPathToFshPath(elementPath);
        const links = getOrSet(byPath, fshPath, () => []);
        const link = dataElementLink(dataElement);
        if (!links.some(existing => existing.class === link.class && existing.name === link.name)) {
          links.push(link);
        }
      }
    }
  }

  return byProfilePath;
}

function mappedDataElementsForFlag(profile, element, mappedElements) {
  const links = mappedElements.get(profile.id)?.get(element.path) ?? [];
  if (links.length) return links;

  throw new Error(
    `No definitions/uscdi_plus_quality.json data element mapping found for generated flag ${profile.id}.${element.path}.`
  );
}

function profileNotesData(
  profiles,
  compiledProfilesById,
  ruleSets,
  dataElements,
  profilesById,
  profilesByName,
  resourceTypes,
  searchCapabilities,
  documentationContext,
  fhirDefs
) {
  assertProfileExampleOverrides(profiles, resourceTypes, searchCapabilities);
  const mappedElements = mappedDataElementsByProfilePath(dataElements);
  const profileElements = [...profiles]
    .sort((a, b) => a.id.localeCompare(b.id))
    .map(profile => ({
      profile,
      elements: generatedUscdiQualityElements(profile, ruleSets).map(element => ({
        path: fshPathToDisplayPath(element.path),
        short: stripUscdiQualityPrefix(element.short),
        dataElements: mappedDataElementsForFlag(profile, element, mappedElements)
      }))
    }));

  assertProfilesHaveUscdiQualityElements(profileElements, mappedElements);

  return Object.fromEntries(
    profileElements
      .map(({ profile, elements }) => {
        const usCore = usCoreAncestor(profile, profilesById, profilesByName, fhirDefs);
        const compiledProfile = compiledProfilesById.get(profile.id);
        if (!compiledProfile) throw new Error(`No compiled StructureDefinition found for ${profile.id}.`);

        const resourceType = resourceTypes.get(profile.id);
        const baseResource = requireStructureDefinition(
          resourceType,
          fhirDefs,
          `base FHIR resource ${resourceType} for ${profile.id}`
        );

        return [
          profile.id,
          {
            title: displayTitle(profile),
            uscdiQualityElements: elements,
            usCore: usCore ? usCoreProfileSummary(usCore) : null,
            conformanceIndicators: profileConformanceIndicators(compiledProfile, baseResource, usCore),
            search: profileSearchData(
              profile,
              resourceTypes,
              searchCapabilities,
              documentationContext
            )
          }
        ];
      })
  );
}

function writeGeneratedData(files) {
  ensureDir(paths.generatedDataDir);
  for (const [filename, value] of Object.entries(files)) {
    writeJson(path.join(paths.generatedDataDir, filename), value);
  }
}

async function main(log) {
  const { config, dataElements, searchCapabilities } = await log.step('Reading definition inputs', () => ({
    config: sushi.utils.readConfig(paths.igRoot),
    dataElements: readUscdiQualityDefinitions(),
    searchCapabilities: readSearchCapabilities()
  }));
  const fhirDefs = await log.step('Loading configured FHIR definitions', configuredFhirDefinitions);
  const documentationContext = await log.step('Indexing US Core search requirements', () =>
    usCoreDocumentationContext(config, fhirDefs)
  );
  const { profiles, byId: profilesById, byName: profilesByName } = await log.step('Parsing authored FSH profiles', () =>
    profileMaps(parseFsh(FSH_FILES))
  );
  const ruleSets = await log.step('Reading generated USCDI+ Quality RuleSets', generatedUscdiQualityRuleSets);
  const compiledProfilesById = await log.step('Compiling profile conformance indicators', () =>
    compiledProfileDefinitions(new Set(profiles.map(profile => profile.id)))
  );
  await log.step('Checking USCDI+ Quality mappings', () => assertAllDataElementsMapped(dataElements));
  const resourceTypes = await log.step('Resolving profile resource types', () =>
    profileResourceTypes(
      profiles.filter(profile => profile.id?.startsWith(local.profileIdPrefix)),
      profilesById,
      profilesByName,
      fhirDefs
    )
  );
  const supportedProfilesByResource = await log.step('Inferring supported profiles by REST resource', () =>
    mappedProfilesByResource(dataElements, profilesById, profilesByName, fhirDefs)
  );

  await log.step('Writing generated view data', () =>
    writeGeneratedData({
      [paths.generatedViewDataFiles.profileNotes]: profileNotesData(
        profiles,
        compiledProfilesById,
        ruleSets,
        dataElements,
        profilesById,
        profilesByName,
        resourceTypes,
        searchCapabilities,
        documentationContext,
        fhirDefs
      ),
      [paths.generatedViewDataFiles.profileTable]: profileTableData(
        profilesById,
        profilesByName,
        resourceTypes,
        supportedProfilesByResource,
        fhirDefs
      ),
      [paths.generatedViewDataFiles.dataElements]: uscdiQualityDataElementsData(
        dataElements,
        profilesById,
        fhirDefs
      )
    })
  );

  return [
    `Generated view data files in ${paths.generatedDataDir}`,
    `Profiles indexed: ${profiles.filter(profile => profile.id?.startsWith(local.profileIdPrefix)).length}`,
    `${labels.uscdiQuality} data elements: ${dataElements.length}`
  ];
}

runGenerator('generate:view-data', main);
