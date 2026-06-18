function formatDuration(ms) {
  if (ms < 1000) return `${ms}ms`;
  return `${(ms / 1000).toFixed(1)}s`;
}

function createLogger(name) {
  const started = Date.now();

  return {
    info(message) {
      console.log(`[${name}] ${message}`);
    },

    async step(label, work) {
      const stepStarted = Date.now();
      console.log(`[${name}] ${label}...`);

      try {
        const result = await work();
        console.log(`[${name}] ${label} done (${formatDuration(Date.now() - stepStarted)})`);
        return result;
      } catch (error) {
        console.error(`[${name}] ${label} failed (${formatDuration(Date.now() - stepStarted)})`);
        throw error;
      }
    },

    done(message) {
      console.log(`[${name}] ${message ?? 'Done'} (${formatDuration(Date.now() - started)})`);
    }
  };
}

// Wrap each generator so progress output, timing, summaries, and failures look
// the same whether a generator is run directly or through an npm script.
function runGenerator(name, main) {
  const log = createLogger(name);
  log.info('Starting');

  Promise.resolve()
    .then(() => main(log))
    .then(summary => {
      if (Array.isArray(summary)) {
        summary.filter(Boolean).forEach(line => log.info(line));
      } else if (summary) {
        log.info(summary);
      }
      log.done();
    })
    .catch(error => {
      console.error(error.stack ?? error.message ?? error);
      process.exit(1);
    });
}

module.exports = {
  createLogger,
  runGenerator
};
