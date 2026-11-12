const { isDeepStrictEqual } = require('node:util');

const USCDI_INDICATOR_EXTENSION =
  'http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement';
const USCDI_QUALITY_INDICATOR_EXTENSION =
  'http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension';

function snapshotElements(structureDefinition) {
  return structureDefinition?.snapshot?.element ?? [];
}

function elementPath(element) {
  if (element?.path) return element.path;
  return element?.id
    ?.split('.')
    .map(part => part.replace(/:.*/, ''))
    .join('.');
}

function inferredSliceName(element) {
  if (element?.sliceName) return element.sliceName;
  const lastIdPart = element?.id?.split('.').at(-1);
  return lastIdPart?.includes(':') ? lastIdPart.slice(lastIdPart.indexOf(':') + 1) : null;
}

function isSliceRoot(element) {
  return inferredSliceName(element) != null;
}

function elementIdentityKey(element) {
  return `${elementPath(element) ?? ''}|${inferredSliceName(element) ?? ''}`;
}

function snapshotElementIndex(structureDefinition) {
  const elements = snapshotElements(structureDefinition);
  const byId = new Map();
  const byIdentity = new Map();
  const unslicedByPath = new Map();

  for (const element of elements) {
    if (element.id) byId.set(element.id, element);

    const identityKey = elementIdentityKey(element);
    const identityMatches = byIdentity.get(identityKey) ?? [];
    identityMatches.push(element);
    byIdentity.set(identityKey, identityMatches);

    if (!isSliceRoot(element)) {
      const path = elementPath(element);
      const pathMatches = unslicedByPath.get(path) ?? [];
      pathMatches.push(element);
      unslicedByPath.set(path, pathMatches);
    }
  }

  return { elements, byId, byIdentity, unslicedByPath };
}

function onlyElement(elements) {
  return elements?.length === 1 ? elements[0] : null;
}

// Snapshot ids should normally be stable through inheritance. The path/slice
// fallbacks also handle profiles produced by tooling that rewrites an id while
// retaining the ElementDefinition's semantic identity.
function matchingElement(element, index) {
  if (!element || !index) return null;

  const exact = index.byId.get(element.id);
  if (exact) return exact;

  const identityMatch = onlyElement(index.byIdentity.get(elementIdentityKey(element)));
  if (identityMatch) return identityMatch;

  // A slice does not inherit element-level conformance indicators merely
  // because its unsliced parent has them. Nested children may still match their
  // underlying unsliced FHIR/ancestor path when that path is unambiguous.
  if (isSliceRoot(element)) return null;
  return onlyElement(index.unslicedByPath.get(elementPath(element)));
}

function minimumCardinality(element) {
  return Number(element?.min ?? 0);
}

function hasBooleanExtension(element, url) {
  return (element?.extension ?? []).some(extension => extension.url === url && extension.valueBoolean === true);
}

function elementDisplayPath(element) {
  return element.id.split('.').slice(1).join('.');
}

function canonicalValue(value) {
  const primitiveValue = typeof value === 'object' && value != null ? value.value : value;
  return primitiveValue == null ? null : String(primitiveValue).split('|')[0];
}

function matchingType(type, typeIndex, ancestorElement) {
  const ancestorTypes = ancestorElement?.type ?? [];
  const codeMatches = ancestorTypes.filter(ancestorType => ancestorType.code === type?.code);
  if (codeMatches.length === 1) return codeMatches[0];
  return ancestorTypes[typeIndex]?.code === type?.code ? ancestorTypes[typeIndex] : null;
}

function targetProfileValue(type, targetIndex) {
  return type?.targetProfile?.[targetIndex] ?? null;
}

function targetProfileMetadata(type, targetIndex) {
  const targetProfile = targetProfileValue(type, targetIndex);
  if (typeof targetProfile === 'object' && targetProfile != null) return targetProfile;
  return type?._targetProfile?.[targetIndex] ?? null;
}

function matchingTargetProfileIndex(type, targetIndex, ancestorType) {
  if (!ancestorType) return -1;

  const targetCanonical = canonicalValue(targetProfileValue(type, targetIndex));
  if (targetCanonical) {
    const canonicalMatches = (ancestorType.targetProfile ?? [])
      .map((value, index) => ({ index, value: canonicalValue(value) }))
      .filter(entry => entry.value === targetCanonical);
    if (canonicalMatches.length === 1) return canonicalMatches[0].index;
  }

  // Local profiles commonly replace a US Core target canonical while retaining
  // its array position and primitive metadata. Use the aligned position only
  // when canonical identity is no longer available.
  const ancestorTargetCount = Math.max(
    ancestorType.targetProfile?.length ?? 0,
    ancestorType._targetProfile?.length ?? 0
  );
  return targetIndex < ancestorTargetCount ? targetIndex : -1;
}

function matchingTargetProfileMetadata(type, targetIndex, ancestorType) {
  const ancestorIndex = matchingTargetProfileIndex(type, targetIndex, ancestorType);
  return ancestorIndex < 0 ? null : targetProfileMetadata(ancestorType, ancestorIndex);
}

function hasIntroducedConformanceIndicator(layer) {
  return Boolean(layer && Object.values(layer).some(value => value === true));
}

function addConformanceIndicator(layer, indicator) {
  layer[indicator] = true;
}

function emptyConformanceIndicatorRow(path, includeUsCoreLayer) {
  return {
    path,
    fhir: {},
    ...(includeUsCoreLayer && { usCore: {} }),
    usQualityCore: {}
  };
}

function addExtensionConformanceIndicator(
  row,
  indicator,
  url,
  finalMetadata,
  baseMetadata,
  usCoreMetadata
) {
  if (!hasBooleanExtension(finalMetadata, url)) return;

  if (hasBooleanExtension(baseMetadata, url)) {
    addConformanceIndicator(row.fhir, indicator);
  } else if (row.usCore && hasBooleanExtension(usCoreMetadata, url)) {
    addConformanceIndicator(row.usCore, indicator);
  } else {
    addConformanceIndicator(row.usQualityCore, indicator);
  }
}

function addUscdiExtensionConformanceIndicators(row, finalMetadata, baseMetadata, usCoreMetadata) {
  addExtensionConformanceIndicator(
    row,
    'uscdi',
    USCDI_INDICATOR_EXTENSION,
    finalMetadata,
    baseMetadata,
    usCoreMetadata
  );
  addExtensionConformanceIndicator(
    row,
    'uscdiQuality',
    USCDI_QUALITY_INDICATOR_EXTENSION,
    finalMetadata,
    baseMetadata,
    usCoreMetadata
  );
}

function addTypeUscdiExtensionConformanceIndicators(row, element, baseElement, usCoreElement) {
  for (const [typeIndex, type] of (element.type ?? []).entries()) {
    const baseType = matchingType(type, typeIndex, baseElement);
    const usCoreType = matchingType(type, typeIndex, usCoreElement);
    addUscdiExtensionConformanceIndicators(row, type, baseType, usCoreType);

    const targetCount = Math.max(type.targetProfile?.length ?? 0, type._targetProfile?.length ?? 0);
    for (let targetIndex = 0; targetIndex < targetCount; targetIndex += 1) {
      addUscdiExtensionConformanceIndicators(
        row,
        targetProfileMetadata(type, targetIndex),
        matchingTargetProfileMetadata(type, targetIndex, baseType),
        matchingTargetProfileMetadata(type, targetIndex, usCoreType)
      );
    }
  }
}

function fhirMinimumCardinality(element, baseIndex) {
  const baseElement = matchingElement(element, baseIndex);
  if (baseElement) return minimumCardinality(baseElement);

  // ElementDefinition.base preserves the FHIR cardinality for expanded
  // datatype children that do not have an exact resource-snapshot id. A slice
  // itself is not mandatory merely because its unsliced base element is.
  return isSliceRoot(element) ? 0 : minimumCardinality(element.base);
}

function assertInheritedMustSupport(profile, profileIndex, usCoreProfile, usCoreIndex) {
  const relaxed = [];

  for (const usCoreElement of usCoreIndex.elements) {
    if (
      !usCoreElement.id?.includes('.') ||
      usCoreElement.max === '0' ||
      usCoreElement.mustSupport !== true
    ) {
      continue;
    }

    const finalElement = matchingElement(usCoreElement, profileIndex);
    if (!finalElement) {
      relaxed.push(`${elementDisplayPath(usCoreElement)} is missing from the compiled target profile snapshot`);
    } else if (finalElement.max === '0') {
      relaxed.push(`${elementDisplayPath(usCoreElement)} has maximum cardinality 0`);
    } else if (finalElement.mustSupport !== true) {
      relaxed.push(`${elementDisplayPath(usCoreElement)} is no longer Must Support`);
    }
  }

  if (!relaxed.length) return;

  throw new Error(
    [
      `${profile?.id ?? 'The US Quality Core profile'} relaxes Must Support inherited from ${
        usCoreProfile?.id ?? 'its US Core ancestor'
      }:`,
      ...relaxed.map(message => `- ${message}`)
    ].join('\n')
  );
}

function conformanceIndicatorRow(element, baseIndex, usCoreIndex = null) {
  const baseElement = matchingElement(element, baseIndex);
  const usCoreElement = usCoreIndex ? matchingElement(element, usCoreIndex) : null;
  const row = emptyConformanceIndicatorRow(elementDisplayPath(element), Boolean(usCoreIndex));

  if (minimumCardinality(element) > 0) {
    if (fhirMinimumCardinality(element, baseIndex) > 0) {
      addConformanceIndicator(row.fhir, 'mandatory');
    } else if (usCoreIndex && minimumCardinality(usCoreElement) > 0) {
      addConformanceIndicator(row.usCore, 'mandatory');
    } else {
      addConformanceIndicator(row.usQualityCore, 'mandatory');
    }
  }

  if (element.mustSupport === true) {
    if (baseElement?.mustSupport === true) {
      addConformanceIndicator(row.fhir, 'mustSupport');
    } else if (usCoreElement?.mustSupport === true) {
      addConformanceIndicator(row.usCore, 'mustSupport');
    } else {
      addConformanceIndicator(row.usQualityCore, 'mustSupport');
    }
  }

  addUscdiExtensionConformanceIndicators(row, element, baseElement, usCoreElement);
  addTypeUscdiExtensionConformanceIndicators(row, element, baseElement, usCoreElement);

  return row;
}

function hasConformanceIndicator(row) {
  return (
    hasIntroducedConformanceIndicator(row.fhir) ||
    hasIntroducedConformanceIndicator(row.usCore) ||
    hasIntroducedConformanceIndicator(row.usQualityCore)
  );
}

function profileConformanceIndicators(profile, baseResource, usCoreProfile = null) {
  const profileIndex = snapshotElementIndex(profile);
  const baseIndex = snapshotElementIndex(baseResource);
  const usCoreIndex = usCoreProfile ? snapshotElementIndex(usCoreProfile) : null;

  if (usCoreIndex) {
    assertInheritedMustSupport(profile, profileIndex, usCoreProfile, usCoreIndex);
  }

  const elements = profileIndex.elements
    .filter(element => element.id?.includes('.') && element.max !== '0')
    .map(element => conformanceIndicatorRow(element, baseIndex, usCoreIndex))
    .filter(hasConformanceIndicator);

  return { elements };
}

function typeValues(element, field, normalize = value => value) {
  return [...new Set((element.type ?? []).flatMap(type =>
    field === 'code' ? [type.code] : type[field] ?? []
  ).map(normalize))].sort();
}

function profileNetNewRequirements(profile, baseResource, usCoreProfile, fhirDefs, localProfiles = new Map()) {
  if (!usCoreProfile) return [];

  const baseIndex = snapshotElementIndex(baseResource);
  const usCoreIndex = snapshotElementIndex(usCoreProfile);
  const canonical = value => {
    if (!value) return value;
    const [url, version] = value.split('|');
    const resolvedVersion = version ?? fhirDefs?.fishForFHIR(url)?.version;
    return resolvedVersion ? `${url}|${resolvedVersion}` : url;
  };
  const referenceProfile = value => {
    const url = canonicalValue(value);
    const id = url.split('/').at(-1);
    const local = localProfiles.get(id);
    const isLocal = local?.url === url;
    const target = isLocal ? local : fhirDefs?.fishForFHIR(url);
    return {
      title: target?.title ?? target?.name ?? id,
      ...(isLocal && { path: `StructureDefinition-${id}.html` })
    };
  };
  const fields = [
    ['Binding', element => element.binding?.strength],
    ['Value set', element => canonical(element.binding?.valueSet)],
    ['Types', element => typeValues(element, 'code')],
    ['Type profiles', element => typeValues(element, 'profile', canonical)],
    ['Reference profiles', element => typeValues(element, 'targetProfile', canonical)]
  ];

  return snapshotElements(profile).flatMap(element => {
    const inherited = matchingElement(element, usCoreIndex);
    const newSlice = isSliceRoot(element) && !inherited;
    const datatype = element.base?.path?.split('.')[0];
    const ancestor = inherited
      ?? onlyElement(usCoreIndex.unslicedByPath.get(elementPath(element)))
      ?? matchingElement(element, baseIndex)
      ?? snapshotElements(fhirDefs?.fishForFHIR(datatype))
        .find(candidate => candidate.path === element.base?.path);
    const baseline = ancestor ?? element.base ?? {};
    const changes = [];
    const cardinality = value => `${value.min ?? 0}..${value.max ?? '*'}`;
    const describe = value => value == null || value === '' ? '(none)'
      : typeof value === 'object' ? JSON.stringify(value) : String(value);

    if (newSlice) {
      changes.push(`New ${elementPath(element).endsWith('.extension') ? 'extension' : 'slice'} (${cardinality(element)})`);
    } else if (cardinality(element) !== cardinality(baseline)) {
      changes.push(`Cardinality: ${cardinality(baseline)} → ${cardinality(element)}`);
    }

    if (element.max !== '0') {
      const indicators = conformanceIndicatorRow(element, baseIndex, usCoreIndex);
      if (indicators.usQualityCore.mustSupport) changes.push('Must Support');
      if (indicators.usQualityCore.uscdi) changes.push('Additional USCDI support');
      const baselineSupport = [indicators.fhir, indicators.usCore]
        .some(layer => layer.mandatory || layer.mustSupport || layer.uscdi);
      if (indicators.usQualityCore.uscdiQuality && !baselineSupport
        && !indicators.usQualityCore.mustSupport) {
        changes.push('USCDI+ Quality support');
      }
    }

    if (ancestor) {
      for (const [label, select] of fields) {
        const before = select(ancestor);
        const after = select(element);
        if (isDeepStrictEqual(before, after) || (newSlice && label === 'Type profiles')) continue;
        if (label === 'Types') {
          const removed = before.filter(type => !after.includes(type));
          const added = after.filter(type => !before.includes(type));
          if (removed.length) changes.push(`Types removed: ${removed.join(', ')}`);
          if (added.length) changes.push(`Types added: ${added.join(', ')}`);
        } else if (label === 'Reference profiles' && after.length) {
          changes.push({ text: 'Reference changed', profiles: after.map(referenceProfile) });
        } else {
          changes.push(label === 'Binding'
            ? `Binding: ${describe(before)} → ${describe(after)}`
            : `${label} changed`);
        }
      }
    }

    for (const key of Object.keys(element).filter(key => /^(fixed|pattern)[A-Z]/.test(key))) {
      if (!isDeepStrictEqual(element[key], baseline[key])) {
        const label = key.startsWith('fixed') ? 'Fixed value' : 'Pattern constraint';
        changes.push(typeof element[key] === 'object'
          ? `${label} ${baseline[key] == null ? 'added' : 'changed'}`
          : `${label}: ${baseline[key] == null ? describe(element[key]) : `${describe(baseline[key])} → ${describe(element[key])}`}`);
      }
    }
    for (const constraint of element.constraint ?? []) {
      if (constraint.severity !== 'error') continue;
      const previous = (baseline.constraint ?? []).find(candidate => candidate.key === constraint.key);
      if (!previous || previous.severity !== 'error'
        || previous.expression !== constraint.expression || previous.xpath !== constraint.xpath) {
        changes.push(`Validation rule ${previous ? 'changed' : 'added'}: ${constraint.key}`);
      }
    }

    return changes.length ? [{ path: elementDisplayPath(element), changes }] : [];
  });
}

module.exports = {
  profileConformanceIndicators,
  profileNetNewRequirements
};
