const { US_CORE_PROFILE_PREFIX } = require('./paths');
const { sushi } = require('./sushi');
const { canonicalUrl, getOrSet, urlTail } = require('./text');

function displayTitle(profile) {
  return profile.title ?? profile.name.replace(/^USQualityCore/, 'US Quality Core ');
}

function sortByDisplayTitle(profiles) {
  return profiles.sort((a, b) => displayTitle(a).localeCompare(displayTitle(b)) || a.id.localeCompare(b.id));
}

function profileMaps(documents) {
  const profiles = [];
  const byId = new Map();
  const byName = new Map();
  const byFile = new Map();

  for (const document of documents) {
    for (const profile of document.profiles.values()) {
      profiles.push(profile);
      byId.set(profile.id, profile);
      byName.set(profile.name, profile);
      getOrSet(byFile, profile.sourceInfo.file, () => []).push(profile);
    }
  }

  return { profiles, byId, byName, byFile };
}

function localParent(profile, profilesById, profilesByName) {
  return profilesByName.get(profile.parent) ?? profilesById.get(urlTail(profile.parent));
}

// Resolves a local or external FHIR StructureDefinition using the same lookup
// strategy everywhere: canonical URL, id tail, then base Resource lookup.
function structureDefinition(value, fhirDefs) {
  const { Type } = sushi.utils;
  const id = urlTail(value);
  return (
    fhirDefs.fishForFHIR(canonicalUrl(value), Type.Profile) ??
    fhirDefs.fishForFHIR(id, Type.Profile) ??
    fhirDefs.fishForFHIR(canonicalUrl(value), Type.Resource) ??
    fhirDefs.fishForFHIR(id, Type.Resource)
  );
}

function requireStructureDefinition(value, fhirDefs, context) {
  const definition = structureDefinition(value, fhirDefs);
  if (!definition) throw new Error(`Unable to resolve ${context ?? value} from configured SUSHI dependencies.`);
  return definition;
}

function profileDefinition(value, fhirDefs) {
  const { Type } = sushi.utils;
  return fhirDefs.fishForFHIR(canonicalUrl(value), Type.Profile) ?? fhirDefs.fishForFHIR(urlTail(value), Type.Profile);
}

function requireProfileDefinition(value, fhirDefs, context) {
  const profile = profileDefinition(value, fhirDefs);
  if (!profile) throw new Error(`Unable to resolve ${context ?? value} from configured SUSHI dependencies.`);
  return profile;
}

// Walk local profile parentage until an external/base definition provides the
// FHIR resource type. This keeps generated tables and rest rules aligned.
function profileResourceType(profile, profilesById, profilesByName, fhirDefs, seen = new Set()) {
  if (seen.has(profile.id)) {
    throw new Error(`Unable to resolve resource type for ${profile.id}: circular profile parentage.`);
  }
  seen.add(profile.id);

  const parent = localParent(profile, profilesById, profilesByName);
  if (parent) return profileResourceType(parent, profilesById, profilesByName, fhirDefs, seen);

  const parentDefinition = structureDefinition(profile.parent, fhirDefs);
  if (parentDefinition?.type) return parentDefinition.type;

  throw new Error(`Unable to resolve resource type for ${profile.id} from parent ${profile.parent}.`);
}

function profileResourceTypes(profiles, profilesById, profilesByName, fhirDefs) {
  return new Map(
    profiles.map(profile => [profile.id, profileResourceType(profile, profilesById, profilesByName, fhirDefs)])
  );
}

function localProfileDepth(profile, profilesById, profilesByName, seen = new Set()) {
  if (seen.has(profile.id)) return 0;
  seen.add(profile.id);

  const parent = localParent(profile, profilesById, profilesByName);
  return parent ? localProfileDepth(parent, profilesById, profilesByName, seen) + 1 : 0;
}

function hasLocalAncestor(profile, ancestor, profilesById, profilesByName, seen = new Set()) {
  if (seen.has(profile.id)) return false;
  seen.add(profile.id);

  const parent = localParent(profile, profilesById, profilesByName);
  if (!parent) return false;
  return parent.id === ancestor.id || hasLocalAncestor(parent, ancestor, profilesById, profilesByName, seen);
}

function usCoreAncestor(profile, profilesById, profilesByName, fhirDefs, seen = new Set()) {
  if (seen.has(profile.id)) return null;
  seen.add(profile.id);

  const parent = localParent(profile, profilesById, profilesByName);
  if (parent) return usCoreAncestor(parent, profilesById, profilesByName, fhirDefs, seen);

  const parentDefinition = structureDefinition(profile.parent, fhirDefs);
  return canonicalUrl(parentDefinition?.url).startsWith(US_CORE_PROFILE_PREFIX) ? parentDefinition : null;
}

function hasUsCoreLineage(profile, profilesById, profilesByName, fhirDefs) {
  return Boolean(usCoreAncestor(profile, profilesById, profilesByName, fhirDefs));
}

module.exports = {
  displayTitle,
  hasLocalAncestor,
  hasUsCoreLineage,
  localParent,
  localProfileDepth,
  profileDefinition,
  profileMaps,
  profileResourceType,
  profileResourceTypes,
  requireProfileDefinition,
  requireStructureDefinition,
  sortByDisplayTitle,
  structureDefinition,
  usCoreAncestor
};
