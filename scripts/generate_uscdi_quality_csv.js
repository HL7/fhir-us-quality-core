#!/usr/bin/env node

const { USCDI_QUALITY_CSV_PATH, path } = require('./lib/paths');
const { parseFsh, sourceFshFiles } = require('./lib/sushi');
const { ensureDir, readUscdiQualityData, write } = require('./lib/io');
const { urlTail } = require('./lib/text');
const { profileMaps } = require('./lib/profiles');
const { assertAllDataElementsMapped } = require('./lib/uscdi');
const { runGenerator } = require('./lib/runner');

const FSH_FILES = sourceFshFiles();
const CSV_LIST_SEPARATOR = '; ';

function uniqueMappings(mappings = []) {
  return [...new Map(mappings.map(mapping => [urlTail(mapping.profile), mapping])).values()];
}

function csvCell(value) {
  return `"${String(value ?? '').replace(/"/g, '""')}"`;
}

function csvRow(values) {
  return values.map(csvCell).join(',');
}

function csvList(values) {
  return values.filter(Boolean).join(CSV_LIST_SEPARATOR);
}

function usQualityCoreProfileName(mapping, profilesById) {
  const id = urlTail(mapping.profile);
  const profile = profilesById.get(id);
  if (!profile) throw new Error(`Unable to resolve local US Quality Core profile ${mapping.profile}.`);
  return profile.name ?? id;
}

function mappedUsQualityCoreElementNames(mapping, profilesById) {
  const profileName = usQualityCoreProfileName(mapping, profilesById);
  return (mapping.elements ?? []).map(elementPath => elementPath.replace(/^[^.]+/, profileName));
}

function profileUrl(mapping) {
  return mapping.profile;
}

function uscdiQualityCsvRows(dataElements, profilesById) {
  const header = [
    'Class',
    'Name',
    'Description',
    'Mapped US Core Profiles',
    'Mapped US Quality Core Profiles',
    'Mapped US Quality Core Elements'
  ];

  return [
    header,
    ...dataElements.map(dataElement => {
      const usCoreProfiles = uniqueMappings(dataElement.mappings?.usCore).map(mapping =>
        profileUrl(mapping)
      );
      const usQualityCoreMappings = uniqueMappings(dataElement.mappings?.usQualityCore);
      const usQualityCoreProfiles = usQualityCoreMappings.map(mapping =>
        profileUrl(mapping)
      );
      const usQualityCoreElements = usQualityCoreMappings.flatMap(mapping =>
        mappedUsQualityCoreElementNames(mapping, profilesById)
      );

      return [
        dataElement.class,
        dataElement.name,
        dataElement.description,
        csvList(usCoreProfiles),
        csvList(usQualityCoreProfiles),
        csvList(usQualityCoreElements)
      ];
    })
  ];
}

function uscdiQualityCsv(dataElements, profilesById) {
  return `${uscdiQualityCsvRows(dataElements, profilesById).map(csvRow).join('\n')}\n`;
}

function writeUscdiQualityCsv(dataElements, profilesById) {
  ensureDir(path.dirname(USCDI_QUALITY_CSV_PATH));
  write(USCDI_QUALITY_CSV_PATH, uscdiQualityCsv(dataElements, profilesById));
}

async function main(log) {
  const dataElements = await log.step('Reading USCDI+ Quality mappings', readUscdiQualityData);
  const { byId: profilesById } = await log.step('Parsing authored FSH profiles', () =>
    profileMaps(parseFsh(FSH_FILES))
  );

  await log.step('Checking USCDI+ Quality mappings', () => assertAllDataElementsMapped(dataElements));
  await log.step('Writing USCDI+ Quality CSV download', () =>
    writeUscdiQualityCsv(dataElements, profilesById)
  );

  return [
    `Generated USCDI+ Quality CSV download at ${USCDI_QUALITY_CSV_PATH}`,
    `USCDI+ Quality data elements: ${dataElements.length}`
  ];
}

runGenerator('generate:uscdi-quality-csv', main);
