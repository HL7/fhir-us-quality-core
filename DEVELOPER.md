# Developer Documentation

This document provides information useful for the development and maintenance of
this implementation guide, including the source layout, generated content, and
common update workflows.

## Index

- [Source Layout](#source-layout)
- [How To Make Changes](#how-to-make-changes)
- [Automation-Driven Content](#automation-driven-content)
- [Hand-Maintained Content](#hand-maintained-content)
- [Generators](#generators)
- [Generated Files](#generated-files)

## Source Layout

The basic source structure is:

```text
us-quality-core/
|-- README.md                     Repository overview
|-- DEVELOPER.md                  Developer documentation
|-- sushi-config.yaml             IG metadata, dependencies, pages, and build parameters
|-- ig.ini                        IG Publisher entry point
|-- fsh.ini                       SUSHI configuration used by the IG Publisher
|-- data/                         Maintained JSON inputs for project-specific generators
|   |-- uscdi_quality.json        USCDI+ Quality data element and profile mappings
|   `-- rest.json                 REST/search conformance requirements
|-- scripts/                      Node-based generators and shared helper code
|   |-- generate_flags.js         Generates USCDI+ Quality flag RuleSets
|   |-- generate_rest.js          Generates REST RuleSets and SearchParameters
|   |-- generate_view_data.js     Generates JSON consumed by Liquid/Jekyll templates
|   `-- lib/                      Shared generator helpers
|-- input/
|   |-- fsh/                      FHIR Shorthand source
|   |   |-- profiles/             Authored US Quality Core profile definitions
|   |   |-- extensions/           Authored extension definitions
|   |   |-- valuesets/            Authored value set definitions
|   |   |-- instances/            Authored CapabilityStatements, examples, and other instances
|   |   `-- generated/            Committed generated FSH; do not edit by hand
|   |       `-- search-parameters/ Generated SearchParameter definitions
|   |-- pages/                    Authored narrative pages in Markdown
|   |-- intro-notes/              Profile intro and notes Markdown fragments
|   |-- includes/                 Liquid/Jekyll includes for generated narrative sections
|   |-- data/
|   |   `-- generated/            Committed generated JSON view data; do not edit by hand
|   |-- _resources/               Supporting IG resources
|   `-- images/                   Static image assets
`-- output/                       IG Publisher output; not maintained source
```

## How To Make Changes

Most IG maintenance falls into two categories:

1. **Automation-driven content** - maintained in JSON under `data/`, then
   expanded into generated FSH and generated Jekyll data.
2. **Hand-maintained content** - authored directly in FSH or Markdown under
   `input/`.

Do not edit files under `input/fsh/generated/` or `input/data/generated/` by
hand. If generated output is wrong, update the maintained JSON or authored
source and rerun the relevant generator.

## Automation-Driven Content

Use this workflow when changing USCDI+ Quality mappings, generated flags,
profile tables, USCDI+ Quality scope tables, generated profile guidance, REST
requirements, CapabilityStatement REST content, or generated SearchParameters.

### Add Or Revise USCDI+ Quality Mappings

Edit `data/uscdi_quality.json`.

Use this file when adding or changing:

- USCDI+ Quality data element entries
- data element `notes`
- mapped US Quality Core profiles
- mapped US Quality Core element paths to flag
- mapped US Core profiles

US Quality Core mappings include profile URLs and element paths. US Core
mappings include only profile URLs; they do not include element mappings.

If the mapping references a US Quality Core element that does not exist on the
target profile, add the needed rule to the appropriate profile in
`input/fsh/profiles/`. Element short descriptions should be maintained in
profile FSH; the flag generator reads those shorts and applies the USCDI+
Quality prefix in generated RuleSets.

After editing mappings, run:

```sh
npm --prefix scripts run generate
```

Then build and review:

```sh
./_genonce.sh
```

Check affected profile pages, `uscdiquality.html`, `profiles.html`, and
`output/qa.html`.

### Change REST, Search, Or CapabilityStatement Expectations

Edit `data/rest.json`.

Use this file when adding or changing:

- supported REST resources
- resource-level documentation
- search parameters
- search parameter expectations
- search parameter expressions
- required search parameter combinations

The REST generator uses this data, together with mappings in
`data/uscdi_quality.json`, to generate CapabilityStatement REST rules and local
SearchParameter FSH.

After editing REST/search requirements, run:

```sh
npm --prefix scripts run generate
```

Then build and review:

```sh
./_genonce.sh
```

Check the generated CapabilityStatement pages, SearchParameter artifacts,
affected profile notes, and `output/qa.html`.

## Hand-Maintained Content

Use this workflow when directly editing authored FSH or Markdown under `input/`.

### Authored FSH

Edit FSH under `input/fsh/` for profiles, extensions, value sets, examples,
CapabilityStatements, and other authored FHIR artifacts.

Profile FSH is also where element short descriptions are maintained. If an
element is flagged for USCDI+ Quality, the flag generator reads the authored
short and applies the USCDI+ Quality prefix in generated RuleSets.

If a profile has USCDI+ Quality mappings, keep its generated flag insert at the
end of the profile:

```fsh
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsFor...
```

If FSH changes affect mapped elements, element shorts, generated search
parameters, or CapabilityStatement content, run:

```sh
npm --prefix scripts run generate
```

Then build with:

```sh
./_genonce.sh
```

Review affected artifact pages and `output/qa.html`.

### Authored Markdown

Edit narrative pages under `input/pages/` and profile-specific intro/notes
fragments under `input/intro-notes/`.

Profile intro and notes files use these patterns:

```text
StructureDefinition-{profile-id}-intro.md
StructureDefinition-{profile-id}-notes.md
```

Generated USCDI+ Quality guidance, US Core guidance, and search parameter
guidance are added through templates and generated data, so avoid duplicating
that generated content manually.

After editing Markdown, build with:

```sh
./_genonce.sh
```

Review affected pages and `output/qa.html`.

## Generators

Project-specific generators live under `scripts/`. Maintained JSON inputs live
under `data/`. Scripts use those inputs, authored FSH, and SUSHI-resolved
profile metadata to generate formal FSH and view data for rendered IG pages.

Install script dependencies once from the IG root:

```sh
npm --prefix scripts install
```

Generators use local dependencies installed under `scripts/`; they do not fall
back to globally installed Node packages.

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

The npm scripts are:

- `generate` - runs all current generators in sequence.
- `generate:rest` - generates local SearchParameter definitions and the shared
  CapabilityStatement rest RuleSet.
- `generate:flags` - generates USCDI+ Quality element flagging FSH from the data
  element mapping JSON.
- `generate:view-data` - generates JSON under `input/data/generated` for
  rendered profile guidance, profile tables, and USCDI+ Quality scope tables.

### Important Inputs

- `data/uscdi_quality.json` - the data element mapping source for USCDI+
  Quality flagging. This file identifies the US Quality Core profiles and
  element paths that should receive the USCDI+ Quality extension and short-text
  prefix. Its US Core and US Quality Core profile mappings also determine which
  profiles are supported in generated CapabilityStatement rest rules.
- `data/rest.json` - the RESTful interaction and search requirement source for
  generated SearchParameter definitions and CapabilityStatement rest rules.

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
| `input/data/generated/data_elements.json` | `npm --prefix scripts run generate:view-data` | `data/uscdi_quality.json`, authored profile FSH |

Generated RuleSet FSH files are inserted from authored FSH using RuleSet
inserts. Generated SearchParameter FSH files are regular FSH instance
definitions imported by SUSHI. The generated JSON files are consumed by Liquid
includes during the Jekyll/IG Publisher build.
