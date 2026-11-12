const { readJson } = require('./io');
const { sushi } = require('./sushi');
const { fhir, labels, rest, upstream } = require('../generator.config');

const { Type } = sushi.utils;

const temporalSearchParameters = new Set(
  rest.rationale.temporalSearchParameters
);

function expectation(item) {
  const extensions = (item.extension ?? []).filter(
    extension => extension.url === fhir.capabilityExpectationExtensionUrl
  );
  if (extensions.length > 1) {
    throw new Error('Multiple capability expectation extensions found on a US Core search requirement.');
  }
  return extensions[0]?.valueCode ?? null;
}

function combinationKey(params) {
  return [...params].sort().join('\u0000');
}

function resourceRequirements(resource) {
  const searchParams = new Map();
  for (const searchParam of resource.searchParam ?? []) {
    if (searchParams.has(searchParam.name)) {
      throw new Error(`US Core ${resource.type} defines search parameter ${searchParam.name} more than once.`);
    }
    searchParams.set(searchParam.name, {
      expectation: expectation(searchParam),
      type: searchParam.type
    });
  }

  const searchCombinations = new Map();
  for (const combination of (resource.extension ?? []).filter(
    extension => extension.url === fhir.searchParameterCombinationExtensionUrl
  )) {
    const params = (combination.extension ?? [])
      .filter(extension => extension.url === 'required')
      .map(extension => extension.valueString);
    const key = combinationKey(params);
    if (searchCombinations.has(key)) {
      throw new Error(`US Core ${resource.type} defines search combination ${params.join(' + ')} more than once.`);
    }
    searchCombinations.set(key, {
      expectation: expectation(combination),
      params
    });
  }

  return { searchParams, searchCombinations };
}

function usCoreSearchRequirementIndex(capabilityStatement) {
  if (capabilityStatement?.resourceType !== 'CapabilityStatement') {
    throw new Error('Unable to resolve the US Core Server CapabilityStatement.');
  }

  const index = new Map();
  for (const resource of (capabilityStatement.rest ?? []).flatMap(rest => rest.resource ?? [])) {
    if (index.has(resource.type)) {
      throw new Error(`US Core Server CapabilityStatement defines ${resource.type} more than once.`);
    }
    index.set(resource.type, resourceRequirements(resource));
  }
  return index;
}

function usCoreDocumentationContext(config, fhirDefs) {
  const capabilityStatement = fhirDefs.fishForFHIR(
    upstream.usCore.serverCapabilityStatementUrl,
    Type.Instance
  );
  const dependency = config.dependencies.find(
    item => item.packageId === upstream.usCore.packageId
  );
  if (!dependency) {
    throw new Error(
      `${upstream.usCore.packageId} is not configured as an IG dependency.`
    );
  }

  const packageInfo = fhirDefs.packageDB.findPackageInfo(
    upstream.usCore.packageId,
    dependency.version
  );
  if (!packageInfo?.packageJSONPath) {
    throw new Error(
      `Unable to resolve package metadata for ${upstream.usCore.packageId}#${dependency.version}.`
    );
  }
  const packageJson = readJson(packageInfo.packageJSONPath);
  if (!packageJson.url) {
    throw new Error(
      `${upstream.usCore.packageId}#${dependency.version} does not declare a publication URL.`
    );
  }

  return {
    usCoreIndex: usCoreSearchRequirementIndex(capabilityStatement),
    usCoreCapabilityStatementUrl: [
      packageJson.url.replace(/^http:/, 'https:').replace(/\/$/, ''),
      'CapabilityStatement-us-core-server.html'
    ].join('/')
  };
}

function requiredSearches(resource, resourceConfig) {
  const searchParams = Object.entries(resourceConfig.searchParams ?? {})
    .filter(([, searchParam]) => searchParam.expectation === 'SHALL')
    .sort(([left], [right]) => {
      if (left === '_id') return -1;
      if (right === '_id') return 1;
      return 0;
    })
    .map(([code, searchParam]) => ({
      kind: 'parameter',
      params: [code],
      type: searchParam.type,
      label: `\`${code}\``,
      context: `${resource}.${code}`,
      rationaleOverride: searchParam.rationaleOverride
    }));
  const searchCombinations = (resourceConfig.searchCombinations ?? []).flatMap((combination, index) =>
    combination.expectation === 'SHALL'
      ? [
          {
            kind: 'combination',
            params: combination.params ?? [],
            label: (combination.params ?? []).map(param => `\`${param}\``).join(' + '),
            context: `${resource}.searchCombinations[${index}]`,
            rationaleOverride: combination.rationaleOverride
          }
        ]
      : []
  );

  return [...searchParams, ...searchCombinations];
}

function usCoreRequirement(search, resourceRequirementsForType) {
  if (!resourceRequirementsForType) return null;

  if (search.kind === 'parameter') {
    const match = resourceRequirementsForType.searchParams.get(search.params[0]);
    if (match && match.type !== search.type) {
      throw new Error(
        `${search.context} has type ${search.type}, but the matching US Core search parameter has type ${match.type}.`
      );
    }
    return match;
  }

  return resourceRequirementsForType.searchCombinations.get(combinationKey(search.params)) ?? null;
}

function usCoreAlignment(resource, search, usCoreIndex, usCoreCapabilityStatementUrl) {
  const match = usCoreRequirement(search, usCoreIndex.get(resource));
  if (!match) return `Added in ${labels.implementationGuide}.`;

  const link = `[US Core](${usCoreCapabilityStatementUrl}#Server_${resource})`;
  if (match.expectation === 'SHALL') return `Required by ${link}.`;
  if (match.expectation === 'SHOULD') {
    return `Recommended by ${link}; ${labels.implementationGuide} strengthens this to SHALL.`;
  }
  if (match.expectation === 'MAY') {
    return `Optional in ${link}; ${labels.implementationGuide} strengthens this to SHALL.`;
  }

  throw new Error(
    `${search.context} matches a US Core search requirement with unsupported expectation ${
      match.expectation ?? '(missing)'
    }.`
  );
}

function filterLabel(param) {
  return rest.rationale.filterLabels[param] ?? param.replace(/-/g, ' ');
}

function joinedLabels(labels) {
  if (labels.length === 1) return labels[0];
  if (labels.length === 2) return `${labels[0]} and ${labels[1]}`;
  return `${labels.slice(0, -1).join(', ')}, and ${labels.at(-1)}`;
}

function generatedRationale(resource, search) {
  if (search.rationaleOverride != null) {
    if (typeof search.rationaleOverride !== 'string' || search.rationaleOverride.trim() === '') {
      throw new Error(`${search.context}.rationaleOverride must be a non-empty string.`);
    }
    return search.rationaleOverride.trim();
  }

  if (search.params.length === 1) {
    const [param] = search.params;
    if (param === '_id') return `Supports retrieval of a known ${resource} resource by id.`;
    if (param === 'patient' || param === 'subject') {
      return `Supports ${param}-scoped retrieval of ${resource} resources for ${labels.uscdiQuality} workflows.`;
    }
    return `Supports retrieval of ${resource} resources filtered by ${filterLabel(
      param
    )} for ${labels.uscdiQuality} workflows.`;
  }

  const scopeParams = search.params.filter(param => param === 'patient' || param === 'subject');
  if (scopeParams.length > 1) {
    throw new Error(`${search.context} contains multiple patient or subject scope parameters.`);
  }
  const scope = scopeParams[0];
  const filters = search.params.filter(param => param !== scope);
  if (!filters.length) {
    throw new Error(`${search.context} does not contain a filter parameter.`);
  }

  const prefix = `Supports ${scope ? `${scope}-scoped ` : ''}retrieval of ${resource} resources`;
  const filterLabelsText = joinedLabels(filters.map(filterLabel));
  if (filters.includes('do-not-perform')) {
    return `${prefix} filtered by ${filterLabelsText} to support negation workflows.`;
  }
  if (filters.includes('status')) {
    return `${prefix} filtered by ${filterLabelsText} for status-sensitive quality workflows.`;
  }
  if (filters.some(param => temporalSearchParameters.has(param))) {
    return `${prefix} filtered by ${filterLabelsText} so quality workflows can constrain results to relevant reporting periods.`;
  }
  return `${prefix} filtered by ${filterLabelsText} for ${labels.uscdiQuality} workflows.`;
}

function markdownTableCell(value) {
  return value.trim().replace(/\|/g, '\\|').replace(/\r?\n/g, ' ');
}

function searchRequirementRows(resource, resourceConfig, documentationContext) {
  return requiredSearches(resource, resourceConfig).map(search => {
    const usCoreMatch = usCoreRequirement(
      search,
      documentationContext.usCoreIndex.get(resource)
    );
    const types = search.params.map(param => {
      const type = resourceConfig.searchParams?.[param]?.type;
      if (!type) {
        throw new Error(`${search.context} references search parameter ${param} without a type.`);
      }
      return type;
    });

    return {
      kind: search.kind,
      params: search.params,
      types,
      label: search.label,
      usCoreExpectation: usCoreMatch?.expectation ?? null,
      usCoreAlignment: usCoreAlignment(
        resource,
        search,
        documentationContext.usCoreIndex,
        documentationContext.usCoreCapabilityStatementUrl
      ),
      rationale: generatedRationale(resource, search)
    };
  });
}

function searchRequirementDocumentation(
  resource,
  resourceConfig,
  documentationContext,
  resourceExpectation = 'SHALL'
) {
  const rows = searchRequirementRows(resource, resourceConfig, documentationContext);

  if (resourceExpectation === 'MAY') {
    return `Support for this resource is optional because its profiles have no ${labels.uscdiQuality} mappings. Implementations MAY support the interactions and search parameters listed below. See [Search Requirement Selection](${rest.searchRequirementSelectionPath}) for how search expectations are selected.`;
  }

  if (!rows.length) {
    return `Search requirements are selected according to the rules described in [Search Requirement Selection](${rest.searchRequirementSelectionPath}). ${labels.implementationGuide} does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently.`;
  }

  return [
    `Search requirements are selected according to the rules described in [Search Requirement Selection](${rest.searchRequirementSelectionPath}). The table below summarizes why each required individual search or required search parameter combination is included for this resource.`,
    '',
    '| Required search | US Core alignment | Rationale |',
    '|---|---|---|',
    ...rows.map(
      row =>
        `| ${row.label} | ${markdownTableCell(row.usCoreAlignment)} | ${markdownTableCell(row.rationale)} |`
    )
  ].join('\n');
}

module.exports = {
  generatedRationale,
  requiredSearches,
  searchRequirementRows,
  searchRequirementDocumentation,
  usCoreAlignment,
  usCoreDocumentationContext,
  usCoreSearchRequirementIndex
};
