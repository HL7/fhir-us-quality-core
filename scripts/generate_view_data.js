#!/usr/bin/env node

const { GENERATED_DATA_DIR, US_CORE_PROFILE_PREFIX, path } = require('./lib/paths');
const { configuredFhirDefinitions, parseFsh, sourceFshFiles } = require('./lib/sushi');
const { ensureDir, readRestData, readUscdiQualityData, writeJson } = require('./lib/io');
const { fshPathToDisplayPath, getOrSet, markdownText, urlTail } = require('./lib/text');
const {
  displayTitle,
  hasUsCoreLineage,
  localParent,
  profileMaps,
  profileResourceTypes,
  requireProfileDefinition,
  sortByDisplayTitle,
  usCoreAncestor
} = require('./lib/profiles');
const {
  assertAllDataElementsMapped,
  generatedUscdiQualityElements,
  generatedUscdiQualityRuleSets,
  mappedProfilesByResource
} = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const FSH_FILES = sourceFshFiles();

function profilePath(profileOrId) {
  const id = typeof profileOrId === 'string' ? profileOrId : profileOrId.id;
  return `StructureDefinition-${id}.html`;
}

function profileSummary(profile) {
  return {
    id: profile.id,
    title: displayTitle(profile),
    path: profilePath(profile)
  };
}

function usCoreProfileSummary(profile) {
  return {
    id: profile.id,
    title: profile.title ?? profile.name ?? profile.id
  };
}

function stripUscdiQualityPrefix(value) {
  return markdownText(value).replace(/^\(USCDI\+ Quality\)\s*/, '');
}

function noteId(dataElement) {
  return `${dataElement.class}-${dataElement.name}`
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

function groupsByClass(dataElements) {
  const groups = new Map();
  for (const dataElement of dataElements) {
    getOrSet(groups, dataElement.class, () => []).push(dataElement);
  }
  return [...groups.entries()].map(([name, elements]) => ({ name, elements }));
}

function uniqueMappings(mappings) {
  return [...new Map(mappings.map(mapping => [urlTail(mapping.profile), mapping])).values()];
}

function usQualityCoreMapping(mapping, profilesById) {
  const id = urlTail(mapping.profile);
  const profile = profilesById.get(id);
  return {
    id,
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

function resolvedDataElement(dataElement, profilesById, fhirDefs) {
  return {
    class: dataElement.class,
    name: dataElement.name,
    noteId: noteId(dataElement),
    notes: String(dataElement.notes ?? '').trim(),
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
    notes: elements.filter(element => element.notes)
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
    ...profileSummary(profile),
    depth,
    showResource: depth === 0,
    usCore: usCore ? usCoreProfileSummary(usCore) : null
  };
}

function usCoreProfileTableRows(resource, urls, hasLocalProfiles, fhirDefs) {
  return urls
    .filter(url => url.startsWith(US_CORE_PROFILE_PREFIX))
    .map(url => requireProfileDefinition(url, fhirDefs, `US Core profile ${url}`))
    .sort((a, b) => usCoreProfileSummary(a).title.localeCompare(usCoreProfileSummary(b).title))
    .map((profile, index) => ({
      id: profile.id,
      title: usCoreProfileSummary(profile).title,
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
  const profiles = [...profilesById.values()].filter(profile => profile.id?.startsWith('us-quality-core-'));

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
        resource,
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

function searchParamData(searchParams) {
  return Object.entries(searchParams ?? {}).map(([code, searchParam]) => ({
    name: code,
    expectation: searchParam.expectation ?? ''
  }));
}

function searchCombinationData(searchCombinations) {
  return (searchCombinations ?? []).map(combination => ({
    name: (combination.params ?? []).join(' + '),
    expectation: combination.expectation ?? ''
  }));
}

function profileSearchData(profile, resourceTypes, restResources) {
  const resource = resourceTypes.get(profile.id);
  const resourceConfig = restResources[resource] ?? {};
  const searchParams = searchParamData(resourceConfig.searchParams);
  const searchCombinations = searchCombinationData(resourceConfig.searchCombinations);

  return {
    resource,
    hasSearchParameters: searchParams.length > 0 || searchCombinations.length > 0,
    searchParams,
    searchCombinations
  };
}

function assertProfilesHaveUscdiQualityElements(profileElements) {
  const missing = profileElements.filter(({ elements }) => elements.length === 0);
  if (!missing.length) return;

  throw new Error(
    [
      'Every US Quality Core profile must have generated USCDI+ Quality elements.',
      'Missing elements:',
      ...missing.map(({ profile }) => `- ${profile.id}`)
    ].join('\n')
  );
}

function profileNotesData(profiles, ruleSets, profilesById, profilesByName, resourceTypes, restResources, fhirDefs) {
  const profileElements = [...profiles]
    .sort((a, b) => a.id.localeCompare(b.id))
    .map(profile => ({
      profile,
      elements: generatedUscdiQualityElements(profile, ruleSets).map(element => ({
        path: fshPathToDisplayPath(element.path),
        short: stripUscdiQualityPrefix(element.short)
      }))
    }));

  assertProfilesHaveUscdiQualityElements(profileElements);

  return Object.fromEntries(
    profileElements
      .map(({ profile, elements }) => {
        return [
          profile.id,
          {
            ...profileSummary(profile),
            uscdiQualityElements: elements,
            hasUsCoreLineage: hasUsCoreLineage(profile, profilesById, profilesByName, fhirDefs),
            search: profileSearchData(profile, resourceTypes, restResources)
          }
        ];
      })
  );
}

function writeGeneratedData(files) {
  ensureDir(GENERATED_DATA_DIR);
  for (const [filename, value] of Object.entries(files)) {
    writeJson(path.join(GENERATED_DATA_DIR, filename), value);
  }
}

async function main(log) {
  const { dataElements, restResources } = await log.step('Reading root JSON inputs', () => ({
    dataElements: readUscdiQualityData(),
    restResources: readRestData()
  }));
  const fhirDefs = await log.step('Loading configured FHIR definitions', configuredFhirDefinitions);
  const { profiles, byId: profilesById, byName: profilesByName } = await log.step('Parsing authored FSH profiles', () =>
    profileMaps(parseFsh(FSH_FILES))
  );
  const ruleSets = await log.step('Reading generated USCDI+ Quality RuleSets', generatedUscdiQualityRuleSets);
  await log.step('Checking USCDI+ Quality mappings', () => assertAllDataElementsMapped(dataElements));
  const resourceTypes = await log.step('Resolving profile resource types', () =>
    profileResourceTypes(
      profiles.filter(profile => profile.id?.startsWith('us-quality-core-')),
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
      'profile_notes.json': profileNotesData(
        profiles,
        ruleSets,
        profilesById,
        profilesByName,
        resourceTypes,
        restResources,
        fhirDefs
      ),
      'profile_table.json': profileTableData(
        profilesById,
        profilesByName,
        resourceTypes,
        supportedProfilesByResource,
        fhirDefs
      ),
      'data_elements.json': uscdiQualityDataElementsData(
        dataElements,
        profilesById,
        fhirDefs
      )
    })
  );

  return [
    `Generated view data files in ${GENERATED_DATA_DIR}`,
    `Profiles indexed: ${profiles.filter(profile => profile.id?.startsWith('us-quality-core-')).length}`,
    `USCDI+ Quality data elements: ${dataElements.length}`
  ];
}

runGenerator('generate:view-data', main);
