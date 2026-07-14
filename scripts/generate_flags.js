#!/usr/bin/env node

const { GENERATED_DIR, GENERATED_FLAGS_PATH } = require('./lib/paths');
const { assertNoSushiErrors, compileFsh, parseFsh, profileSourceFshFiles, sushi } = require('./lib/sushi');
const { elementIdToFshPath, getOrSet, joinLines, jsonPathToFshPath, splitLines, urlTail } = require('./lib/text');
const { ensureDir, read, readUscdiQualityData, write } = require('./lib/io');
const { generatedFshFile, ruleSetToFsh } = require('./lib/fsh-output');
const { profileMaps } = require('./lib/profiles');
const { assertAllDataElementsMapped } = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const { fshrules, fshtypes } = sushi;
const { CaretValueRule, InsertRule } = fshrules;
const { RuleSet } = fshtypes;

const GENERATED_PATH = GENERATED_FLAGS_PATH;
const EXTENSION_URL =
  'http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension';
const EXTENSION_VALUE_CARET_PATH = `extension[${EXTENSION_URL}].valueBoolean`;
const RULESET_PREFIX = 'GeneratedUSCDIQualityFlags';
const INSERT_COMMENT =
  '// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.';
const FSH_FILES = profileSourceFshFiles();

function rulesetName(profileName) {
  return `${RULESET_PREFIX}For${profileName}`;
}

function readMappings() {
  const flags = new Map();
  const sources = new Map();
  const dataElements = readUscdiQualityData();

  assertAllDataElementsMapped(dataElements);

  for (const dataElement of dataElements) {
    for (const mapping of dataElement.mappings.usQualityCore) {
      const id = urlTail(mapping.profile);
      const flaggedPaths = getOrSet(flags, id, () => new Set());
      const profileSources = getOrSet(sources, id, () => new Map());

      for (const elementPath of mapping.elements) {
        const fshPath = jsonPathToFshPath(elementPath);
        flaggedPaths.add(fshPath);
        getOrSet(profileSources, fshPath, () => []).push({
          className: dataElement.class,
          name: dataElement.name,
          elementPath
        });
      }
    }
  }

  return {
    flags: new Map([...flags.entries()].map(([id, paths]) => [id, [...paths].sort()])),
    sources
  };
}

function isGeneratedInsert(rule) {
  return rule.constructorName === 'InsertRule' && rule.ruleSet?.startsWith(`${RULESET_PREFIX}For`);
}

function stripGeneratedInsertLines(text) {
  const { lines, trailingNewline } = splitLines(text);
  const nextLines = lines.filter(line => {
    if (line.trimEnd() === INSERT_COMMENT) return false;
    if (line.trim().startsWith(`* insert ${RULESET_PREFIX}For`)) return false;
    return true;
  });

  return nextLines.length === lines.length ? text : joinLines(nextLines, trailingNewline);
}

function profileContentsWithoutGeneratedInserts() {
  const contents = new Map();

  for (const file of FSH_FILES) {
    const original = read(file);
    const clean = stripGeneratedInsertLines(original);
    if (clean !== original) contents.set(file, clean);
  }

  return contents;
}

function insertRule(profileName) {
  const rule = new InsertRule('');
  rule.ruleSet = rulesetName(profileName);
  return rule;
}

function assertProfilesExist(flags, profilesById) {
  const missingProfiles = [...flags.keys()].filter(id => !profilesById.has(id)).sort();
  if (missingProfiles.length) {
    throw new Error(`No FSH profile source found for: ${missingProfiles.join(', ')}`);
  }
}

function assertGeneratedInsertsAreLast(profilesById, flags) {
  const errors = [];

  for (const [id, paths] of flags.entries()) {
    if (!paths.length) continue;

    const profile = profilesById.get(id);
    const lastRule = profile?.rules.at(-1);
    if (!lastRule || !isGeneratedInsert(lastRule) || lastRule.ruleSet !== rulesetName(profile.name)) {
      const profileName = profile?.name ?? id;
      errors.push(`${profileName} must end with:\n${INSERT_COMMENT}\n${insertRule(profileName).toFSH()}`);
    }
  }

  if (errors.length) {
    throw new Error(`Generated USCDI+ Quality inserts are not at the end of these profiles:\n- ${errors.join('\n- ')}`);
  }
}

async function compiledProfileData(profilesById, cleanContents) {
  const result = await compileFsh(FSH_FILES, { overrides: cleanContents, snapshot: true });
  assertNoSushiErrors(result, 'SUSHI reported errors while reading current profile elements');

  const profileData = new Map();

  for (const resource of result.fhir) {
    if (resource.resourceType !== 'StructureDefinition' || !profilesById.has(resource.id)) continue;

    const elements = new Set();
    const shorts = new Map();
    for (const element of resource.snapshot?.element ?? []) {
      const fshPath = elementIdToFshPath(element.id);
      if (!fshPath) continue;
      elements.add(fshPath);
      if (element.short) shorts.set(fshPath, element.short);
    }
    profileData.set(resource.id, { elements, shorts });
  }

  return profileData;
}

function authoredProfileData(profilesById) {
  const profileData = new Map();

  for (const [id, profile] of profilesById.entries()) {
    const paths = new Set();

    for (const rule of profile.rules) {
      if (rule.path) paths.add(rule.path);
    }

    profileData.set(id, { paths, file: profile.sourceInfo.file });
  }

  return profileData;
}

function sourceText(sources, profileIdValue, fshPath) {
  const sourceEntries = sources.get(profileIdValue)?.get(fshPath) ?? [];
  return sourceEntries.length
    ? sourceEntries.map(source => `${source.className} / ${source.name}: ${source.elementPath}`).join('; ')
    : 'No JSON source mapping found for this generated rule.';
}

function inheritedShortSuggestion(data, fshPath) {
  const inheritedShort = data.shorts.get(fshPath);
  if (!inheritedShort) {
    return '  The compiled target profile snapshot does not provide an inherited short to preserve.';
  }

  return [
    '  Suggested FSH rule using the inherited short:',
    `    ${caretRule(fshPath, 'short', inheritedShort).toFSH()}`
  ].join('\n');
}

function assertMappedElementsAndShorts(flags, profilesById, profileData, authoredData, sources) {
  const missingElements = [];
  const inheritedOnlyElements = [];
  const missingShorts = [];

  for (const [id, paths] of flags.entries()) {
    const profile = profilesById.get(id);
    const data = profileData.get(id) ?? { elements: new Set(), shorts: new Map() };
    const authored = authoredData.get(id) ?? { paths: new Set(), file: profile?.sourceInfo.file };

    for (const fshPath of paths) {
      if (!data.elements.has(fshPath)) {
        missingElements.push(
          [
            `${profile.name}.${fshPath} does not exist in the compiled target profile snapshot.`,
            `  JSON mapping: ${sourceText(sources, id, fshPath)}`
          ].join('\n')
        );
      } else if (!authored.paths.has(fshPath)) {
        inheritedOnlyElements.push(
          [
            `${profile.name}.${fshPath} exists only by inheritance and is not defined in ${authored.file}.`,
            '  Add an explicit rule for this element to the target profile FSH before it can be flagged.',
            inheritedShortSuggestion(data, fshPath),
            `  JSON mapping: ${sourceText(sources, id, fshPath)}`
          ].join('\n')
        );
      } else if (!data.shorts.has(fshPath)) {
        missingShorts.push(`${profile.name}.${fshPath}`);
      }
    }
  }

  if (missingElements.length) {
    throw new Error(
      `Generated USCDI+ Quality flags reference elements that SUSHI cannot find:\n\n${[
        ...new Set(missingElements)
      ].join('\n\n')}`
    );
  }

  if (inheritedOnlyElements.length) {
    throw new Error(
      `Generated USCDI+ Quality flags reference inherited-only elements that need explicit target profile FSH rules before they can be flagged:\n\n${[
        ...new Set(inheritedOnlyElements)
      ].join('\n\n')}`
    );
  }

  if (missingShorts.length) {
    throw new Error(`Unable to find current short text for these mapped elements:\n- ${missingShorts.join('\n- ')}`);
  }
}

function caretRule(pathValue, caretPath, value) {
  const rule = new CaretValueRule(pathValue);
  rule.caretPath = caretPath;
  rule.value = value;
  return rule;
}

function flaggedShort(short) {
  return `(USCDI+ Quality) ${String(short).replace(/^\(USCDI\+ Quality\)\s*/, '')}`;
}

function buildRuleSets(flags, profilesById, profileData) {
  const ruleSets = [];

  for (const [id, paths] of flags.entries()) {
    if (!paths.length) continue;

    const profile = profilesById.get(id);
    const ruleSet = new RuleSet(rulesetName(profile.name));
    const shorts = profileData.get(id).shorts;

    for (const fshPath of paths) {
      ruleSet.rules.push(caretRule(fshPath, EXTENSION_VALUE_CARET_PATH, true));
      ruleSet.rules.push(caretRule(fshPath, 'short', flaggedShort(shorts.get(fshPath))));
    }

    ruleSets.push(ruleSet);
  }

  return ruleSets;
}

function generatedFsh(ruleSets) {
  return generatedFshFile({
    scriptName: 'generate_flags.js',
    inputPaths: ['data/uscdi_plus_quality.json'],
    content: ruleSets.map(ruleSetToFsh).join('\n\n')
  });
}

function generatedRuleSetInsertHint(message) {
  if (!message.includes(`RuleSet ${RULESET_PREFIX}For`)) return message;
  return [
    message,
    'This usually means a profile still contains a generated USCDI+ Quality RuleSet insert, but data/uscdi_plus_quality.json no longer has mappings for that profile.',
    `If this profile no longer has any mappings, you may need to remove the generated insert and comment from the profile FSH:\n${INSERT_COMMENT}\n* insert ${RULESET_PREFIX}For...`
  ].join('\n');
}

function assertNoGeneratedFlagValidationErrors(result) {
  if (!result.errors.length) return;

  throw new Error(
    `SUSHI reported errors while validating generated USCDI+ Quality flags:\n- ${result.errors
      .map(error => generatedRuleSetInsertHint(error.message))
      .join('\n- ')}`
  );
}

function writeOutputs(generated) {
  ensureDir(GENERATED_DIR);
  write(GENERATED_PATH, generated);
}

async function main(log) {
  const { cleanContents, profilesById, sourceProfilesById } = await log.step('Parsing authored FSH profiles', () => {
    const sourceDocuments = parseFsh(FSH_FILES);
    const nextCleanContents = profileContentsWithoutGeneratedInserts();
    const nextCleanDocuments = parseFsh(FSH_FILES, nextCleanContents);
    return {
      cleanContents: nextCleanContents,
      profilesById: profileMaps(nextCleanDocuments).byId,
      sourceProfilesById: profileMaps(sourceDocuments).byId
    };
  });
  const { flags, sources } = await log.step('Reading USCDI+ Quality mappings', readMappings);

  await log.step('Checking profile RuleSet inserts', () => {
    assertProfilesExist(flags, profilesById);
    assertGeneratedInsertsAreLast(sourceProfilesById, flags);
  });

  const profileData = await log.step('Compiling profile snapshots for mapped element checks', () =>
    compiledProfileData(profilesById, cleanContents)
  );
  const authoredData = authoredProfileData(profilesById);
  await log.step('Checking mapped elements, authored profile paths, and short text', () =>
    assertMappedElementsAndShorts(flags, profilesById, profileData, authoredData, sources)
  );

  const generated = await log.step('Building generated USCDI+ Quality RuleSets', () =>
    generatedFsh(buildRuleSets(flags, profilesById, profileData))
  );
  await log.step('Validating generated RuleSets with SUSHI', async () => {
    const validation = await compileFsh(FSH_FILES, { extraInputs: [generated] });
    assertNoGeneratedFlagValidationErrors(validation);
  });

  await log.step('Writing generated flags', () => writeOutputs(generated));

  return [
    `Generated ${GENERATED_PATH}`,
    `Flagged profiles: ${[...flags.values()].filter(paths => paths.length > 0).length}`,
    `Flagged elements: ${[...flags.values()].reduce((total, paths) => total + paths.length, 0)}`
  ];
}

runGenerator('generate:flags', main);
