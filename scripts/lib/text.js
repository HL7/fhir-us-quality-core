function getOrSet(map, key, createValue) {
  if (!map.has(key)) map.set(key, createValue());
  return map.get(key);
}

function normalizeTrailingNewline(text) {
  return text.replace(/\n*$/, '\n');
}

function splitLines(text) {
  const lines = text.split('\n');
  const trailingNewline = lines.at(-1) === '';
  if (trailingNewline) lines.pop();
  return { lines, trailingNewline };
}

function joinLines(lines, trailingNewline) {
  return `${lines.join('\n')}${trailingNewline ? '\n' : ''}`;
}

function escapeHtml(value) {
  return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

function markdownText(value) {
  return String(value).replace(/\s+/g, ' ').trim();
}

function urlTail(value) {
  return String(value ?? '')
    .replace(/\|.*$/, '')
    .split('/')
    .at(-1);
}

function canonicalUrl(value) {
  return String(value ?? '').replace(/\|.*$/, '');
}

function canonicalWithVersion(resource) {
  return resource.version ? `${resource.url}|${resource.version}` : resource.url;
}

function jsonPathToFshPath(elementPath) {
  return elementPath
    .replace(/^[^.]+\./, '')
    .split('.')
    .map(part => part.replace(/^([^:]+):(.+)$/, '$1[$2]'))
    .join('.');
}

function fshPathToDisplayPath(fshPath) {
  return fshPath
    .split('.')
    .map(part => part.replace(/^([^[]+)\[([^\]]+)]$/, '$1:$2'))
    .join('.');
}

function elementIdToFshPath(elementId) {
  return elementId
    .split('.')
    .slice(1)
    .map(part => part.replace(/^([^:]+):(.+)$/, '$1[$2]'))
    .join('.');
}

module.exports = {
  canonicalUrl,
  canonicalWithVersion,
  elementIdToFshPath,
  escapeHtml,
  fshPathToDisplayPath,
  getOrSet,
  joinLines,
  jsonPathToFshPath,
  markdownText,
  normalizeTrailingNewline,
  splitLines,
  urlTail
};
