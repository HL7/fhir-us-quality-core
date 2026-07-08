const path = require('path');

const IG_ROOT = path.resolve(__dirname, '..', '..');
const SOURCE_DATA_DIR = path.join(IG_ROOT, 'data');
const FSH_DIR = path.join(IG_ROOT, 'input', 'fsh');
const DATA_DIR = path.join(IG_ROOT, 'input', 'data');
const GENERATED_DATA_DIR = path.join(DATA_DIR, 'generated');
const GENERATED_DIR = path.join(FSH_DIR, 'generated');
const GENERATED_SEARCH_PARAMETER_DIR = path.join(GENERATED_DIR, 'search-parameters');
const GENERATED_FLAGS_PATH = path.join(GENERATED_DIR, 'USCDIQualityFlags.fsh');
const USCDI_QUALITY_DATA_PATH = path.join(SOURCE_DATA_DIR, 'uscdi_plus_quality.json');
const REST_DATA_PATH = path.join(SOURCE_DATA_DIR, 'rest.json');

const USCDI_QUALITY_RULESET_PREFIX = 'GeneratedUSCDIQualityFlagsFor';
const US_CORE_PROFILE_PREFIX = 'http://hl7.org/fhir/us/core/StructureDefinition/';
const US_QUALITY_CORE_PROFILE_PREFIX = 'http://hl7.org/fhir/us/quality-core/StructureDefinition/';

module.exports = {
  path,
  IG_ROOT,
  SOURCE_DATA_DIR,
  FSH_DIR,
  DATA_DIR,
  GENERATED_DATA_DIR,
  GENERATED_DIR,
  GENERATED_SEARCH_PARAMETER_DIR,
  GENERATED_FLAGS_PATH,
  USCDI_QUALITY_DATA_PATH,
  REST_DATA_PATH,
  USCDI_QUALITY_RULESET_PREFIX,
  US_CORE_PROFILE_PREFIX,
  US_QUALITY_CORE_PROFILE_PREFIX
};
