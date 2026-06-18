# Scripts Documentation

This directory contains project-specific generators for the US Quality Core
Implementation Guide. The maintained JSON inputs live at the IG root in
`data/`. Scripts use those inputs, authored FSH, and SUSHI-resolved profile
metadata to generate formal FSH and view data for rendered IG pages.

The npm scripts are:

- `generate` - runs all current generators in sequence.
- `generate:rest` - generates local SearchParameter definitions and the shared
  CapabilityStatement rest RuleSet.
- `generate:flags` - generates USCDI+ Quality element flagging FSH from the data
  element mapping JSON.
- `generate:view-data` - generates JSON under `input/data/generated` for
  rendered profile guidance, profile tables, and USCDI+ Quality scope
  tables.

Generated files should not be edited by hand. Update the root JSON or authored
FSH inputs, then rerun the relevant generator.

## Important Inputs

- `data/uscdi_quality.json` - the data element mapping source for USCDI+
  Quality flagging. This file identifies the US Quality Core profiles and element
  paths that should receive the USCDI+ Quality extension and short-text prefix.
  Its US Core and US Quality Core profile mappings also determine which profiles
  are supported in generated CapabilityStatement rest rules.
- `data/rest.json` - the RESTful interaction and search requirement source for
  generated SearchParameter definitions and CapabilityStatement rest rules.

## Setup

Install script dependencies once from the IG root:

```sh
npm --prefix scripts install
```

Generators use the local dependencies installed under `scripts/`; they do not
fall back to globally installed Node packages.

## Run Generators

Run all current generators from the IG root:

```sh
npm --prefix scripts run generate
```

Run an individual generator when only one output family needs to be refreshed:

```sh
npm --prefix scripts run generate:rest
npm --prefix scripts run generate:flags
npm --prefix scripts run generate:view-data
```

## Generated Files

This repository commits a small set of generated source files so the IG source
is reviewable and can be built without rerunning project-specific generators.
Do not edit these files by hand; update the source JSON or authored FSH, then
rerun the relevant npm script from the IG root.

| File | Generator | Primary inputs |
| --- | --- | --- |
| `input/fsh/generated/USQualityCoreCapabilityStatementRest.fsh` | `npm --prefix scripts run generate:rest` | `data/rest.json`, `data/uscdi_quality.json`, authored FSH |
| `input/fsh/generated/search-parameters/*.fsh` | `npm --prefix scripts run generate:rest` | `data/rest.json`, `data/uscdi_quality.json`, authored FSH |
| `input/fsh/generated/USCDIQualityFlags.fsh` | `npm --prefix scripts run generate:flags` | `data/uscdi_quality.json`, authored profile FSH |
| `input/data/generated/profile_notes.json` | `npm --prefix scripts run generate:view-data` | `data/rest.json`, generated flag RuleSets, authored profile FSH |
| `input/data/generated/profile_table.json` | `npm --prefix scripts run generate:view-data` | `data/uscdi_quality.json`, authored profile FSH, generated flag RuleSets |
| `input/data/generated/uscdi_quality_scope.json` | `npm --prefix scripts run generate:view-data` | `data/uscdi_quality.json`, generated flag RuleSets, authored profile FSH |

Generated RuleSet FSH files are inserted from authored FSH using RuleSet
inserts. Generated SearchParameter FSH files are regular FSH instance
definitions imported by SUSHI. The generated JSON files are consumed by Liquid
includes during the Jekyll/IG Publisher build.

## Scripts

### `generate_rest.js`

This script keeps local SearchParameter definitions and the repeated
CapabilityStatement rest section driven by `data/rest.json` and the profile
mappings in `data/uscdi_quality.json`. It writes SearchParameter FSH files under
`input/fsh/generated/search-parameters/` and generates
`input/fsh/generated/USQualityCoreCapabilityStatementRest.fsh`, which is
inserted into the authored server and client CapabilityStatement instances.
Supported profile lists are inferred from `data/uscdi_quality.json`; do not
duplicate them in `data/rest.json`.

### `generate_flags.js`

This script keeps USCDI+ Quality element flagging driven by
`data/uscdi_quality.json`. It generates USCDI+ Quality flagging RuleSets and
validates that mapped element paths exist before writing updates.

Flagged profiles are expected to contain a stable
`* insert GeneratedUSCDIQualityFlagsFor...` rule at the end of the profile. The
script verifies those inserts, but it does not edit authored profile FSH.

If the script reports that an element path does not exist on a target FSH
profile, update the JSON path or add the element to the profile FSH. Do not add
one-off path exceptions to the generator.

### `generate_view_data.js`

This script writes generated view-data JSON files under `input/data/generated`.
Those files are consumed by Liquid includes in `input/includes` and rendered by
Jekyll during the IG build.

This script depends on `input/fsh/generated/USCDIQualityFlags.fsh`, which is
created by `generate_flags.js`. Run
`npm --prefix scripts run generate:flags` first, or run
`npm --prefix scripts run generate` to execute the npm scripts in the correct
order.

Related files:

- `input/data/generated/profile_notes.json` - per-profile USCDI+ Quality
  element guidance, US Core lineage facts, and resource-level search parameter
  expectations used by profile intro and notes includes.
- `input/data/generated/profile_table.json` - resolved profile table data for
  `input/pages/profiles.md`, including directly supported US Core profiles
  inferred from `data/uscdi_quality.json`.
- `input/data/generated/uscdi_quality_scope.json` - resolved data element scope
  tables and in-scope/out-of-scope profile lists for
  `input/pages/uscdiquality.md`.
- `input/includes/profile-*.md` and `input/includes/uscdi-quality-*.md` -
  Liquid includes that render generated data and shared guidance text.
- `input/intro-notes/StructureDefinition-*-intro.md` - profile intro markdown.
  These files may include custom narrative before generated guidance includes.
- `input/intro-notes/StructureDefinition-*-notes.md` - profile notes markdown.
  These files include generated search parameter guidance.
