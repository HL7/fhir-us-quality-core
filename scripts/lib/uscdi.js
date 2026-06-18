const { fs } = require('./io');
const { GENERATED_FLAGS_PATH, USCDI_QUALITY_RULESET_PREFIX } = require('./paths');
const {
  hasLocalAncestor,
  localProfileDepth,
  profileResourceType,
  structureDefinition
} = require('./profiles');
const { parseFsh } = require('./sushi');
const { canonicalUrl, getOrSet, urlTail } = require('./text');

// These helpers read the generated USCDI+ Quality RuleSets so downstream page
// generators describe exactly what the flag generator applied.
function generatedUscdiQualityRuleSets() {
  if (!fs.existsSync(GENERATED_FLAGS_PATH)) {
    throw new Error(
      `${GENERATED_FLAGS_PATH} does not exist. Run \`npm --prefix scripts run generate:flags\` before running generators that consume generated USCDI+ Quality flags.`
    );
  }

  const ruleSets = new Map();

  for (const document of parseFsh([GENERATED_FLAGS_PATH])) {
    for (const ruleSet of document.ruleSets.values()) {
      ruleSets.set(ruleSet.name, ruleSet);
    }
  }

  return ruleSets;
}

function generatedUscdiQualityRuleSetName(profile) {
  const insertRules = profile.rules.filter(rule => {
    return rule.constructorName === 'InsertRule' && rule.ruleSet?.startsWith(USCDI_QUALITY_RULESET_PREFIX);
  });

  if (insertRules.length > 1) {
    throw new Error(`${profile.name} has multiple generated USCDI+ Quality RuleSet inserts.`);
  }

  return insertRules[0]?.ruleSet;
}

function generatedUscdiQualityElements(profile, ruleSets) {
  const ruleSetName = generatedUscdiQualityRuleSetName(profile);
  if (!ruleSetName) return [];

  const ruleSet = ruleSets.get(ruleSetName);
  if (!ruleSet) {
    throw new Error(`${profile.name} inserts ${ruleSetName}, but no matching RuleSet exists in ${GENERATED_FLAGS_PATH}.`);
  }

  return ruleSet.rules
    .filter(rule => rule.constructorName === 'CaretValueRule' && rule.caretPath === 'short')
    .map(rule => ({
      path: rule.path,
      short: rule.value
    }));
}

function uscdiQualityProfileIds(profiles, ruleSets) {
  return new Set(
    profiles
      .filter(profile => profile.id?.startsWith('us-quality-core-'))
      .filter(profile => generatedUscdiQualityElements(profile, ruleSets).length > 0)
      .map(profile => profile.id)
  );
}

function mappingProfileUrls(dataElements) {
  const urls = [];
  const seen = new Set();

  for (const dataElement of dataElements) {
    for (const group of ['usCore', 'usQualityCore']) {
      for (const mapping of dataElement.mappings?.[group] ?? []) {
        const url = canonicalUrl(mapping.profile);
        if (!url || seen.has(url)) continue;
        urls.push(url);
        seen.add(url);
      }
    }
  }

  return urls;
}

function hasMappings(dataElement) {
  return dataElement.mappings.usQualityCore.length > 0 || dataElement.mappings.usCore.length > 0;
}

// Builds the CapabilityStatement supportedProfile source of truth from
// data/uscdi_quality.json mappings, grouped by resolved FHIR resource type.
function mappedProfileResourceType(url, profilesById, profilesByName, fhirDefs) {
  const localProfile = profilesById.get(urlTail(url));
  if (localProfile) return profileResourceType(localProfile, profilesById, profilesByName, fhirDefs);

  const profile = structureDefinition(url, fhirDefs);
  if (profile?.type) return profile.type;

  throw new Error(`Unable to resolve mapped profile from configured SUSHI dependencies: ${url}`);
}

function sortMappedProfiles(urls, profilesById, profilesByName) {
  const originalIndex = new Map(urls.map((url, index) => [url, index]));
  return urls.sort((a, b) => {
    const aProfile = profilesById.get(urlTail(a));
    const bProfile = profilesById.get(urlTail(b));

    if (aProfile && bProfile) {
      if (hasLocalAncestor(bProfile, aProfile, profilesById, profilesByName)) return -1;
      if (hasLocalAncestor(aProfile, bProfile, profilesById, profilesByName)) return 1;

      const depth =
        localProfileDepth(aProfile, profilesById, profilesByName) -
        localProfileDepth(bProfile, profilesById, profilesByName);
      if (depth !== 0) return depth;
    }

    return originalIndex.get(a) - originalIndex.get(b);
  });
}

function mappedProfilesByResource(dataElements, profilesById, profilesByName, fhirDefs) {
  const byResource = new Map();
  for (const url of mappingProfileUrls(dataElements)) {
    getOrSet(
      byResource,
      mappedProfileResourceType(url, profilesById, profilesByName, fhirDefs),
      () => []
    ).push(url);
  }
  for (const urls of byResource.values()) sortMappedProfiles(urls, profilesById, profilesByName);
  return byResource;
}

module.exports = {
  generatedUscdiQualityElements,
  generatedUscdiQualityRuleSetName,
  generatedUscdiQualityRuleSets,
  hasMappings,
  mappedProfilesByResource,
  mappingProfileUrls,
  uscdiQualityProfileIds
};
