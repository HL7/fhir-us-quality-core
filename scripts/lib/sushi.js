let sushi;
try {
  sushi = require('fsh-sushi');
} catch (error) {
  console.error(
    [
      'Unable to load fsh-sushi.',
      'Run `npm --prefix scripts install` from the IG root before running generators.',
      `Original error: ${error.message}`
    ].join('\n')
  );
  process.exit(1);
}

const { sushiImport, utils } = sushi;
utils.logger.level = 'error';

const { FSH_DIR, GENERATED_DIR, IG_ROOT, path } = require('./paths');
const { read } = require('./io');

function isInDirectory(file, dir) {
  const relative = path.relative(dir, file);
  return relative && !relative.startsWith('..') && !path.isAbsolute(relative);
}

// Returns FSH files from input/fsh. By default generated FSH is included for
// full IG-like compiles. Generators that parse authored profiles should pass
// `{ generated: 'exclude' }` so stale generated files cannot affect results.
function fshFiles({ generated = 'include' } = {}) {
  return utils
    .getFilesRecursive(FSH_DIR)
    .filter(file => file.endsWith('.fsh'))
    .filter(file => {
      if (generated === 'include') return true;
      const isGenerated = isInDirectory(file, GENERATED_DIR);
      return generated === 'only' ? isGenerated : !isGenerated;
    })
    .sort();
}

function sourceFshFiles() {
  return fshFiles({ generated: 'exclude' });
}

// Profile-focused compiles do not need authored examples or CapabilityStatement
// instances; excluding them avoids depending on generated RuleSet inserts.
function profileSourceFshFiles() {
  const instancesDir = path.join(FSH_DIR, 'instances');
  return sourceFshFiles().filter(file => !isInDirectory(file, instancesDir));
}

function parseFsh(files, overrides = new Map()) {
  return sushiImport.importText(
    files.map(file => new sushiImport.RawFSH(overrides.get(file) ?? read(file), file))
  );
}

function fshInputs(files, overrides = new Map(), extraInputs = []) {
  return [...files.map(file => overrides.get(file) ?? read(file)), ...extraInputs];
}

async function compileFsh(files, { overrides = new Map(), extraInputs = [], snapshot = false } = {}) {
  const { sushiClient } = sushi;
  const config = utils.readConfig(IG_ROOT);
  return sushiClient.fshToFhir(fshInputs(files, overrides, extraInputs), {
    canonical: config.canonical,
    version: config.version,
    fhirVersion: Array.isArray(config.fhirVersion) ? config.fhirVersion[0] : config.fhirVersion,
    dependencies: config.dependencies,
    logLevel: 'silent',
    snapshot
  });
}

async function configuredFhirDefinitions() {
  const defs = await sushi.fhirdefs.createFHIRDefinitions();
  await utils.loadExternalDependencies(defs, utils.readConfig(IG_ROOT));
  return defs;
}

function assertNoSushiErrors(result, context) {
  if (result.errors.length) {
    throw new Error(`${context}:\n- ${result.errors.map(error => error.message).join('\n- ')}`);
  }
}

module.exports = {
  sushi,
  assertNoSushiErrors,
  compileFsh,
  configuredFhirDefinitions,
  fshFiles,
  parseFsh,
  profileSourceFshFiles,
  sourceFshFiles
};
