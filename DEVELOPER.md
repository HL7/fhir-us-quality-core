# Developer Documentation

This document provides information useful for the development and maintenance of
this implementation guide, including the source layout, generated content, and
common update workflows.

## Index

- [Source Layout](#source-layout)
- [How To Make Changes](#how-to-make-changes)
- [Maintained Definition Schemas](#maintained-definition-schemas)
- [Automation-Driven Content](#automation-driven-content)
- [Hand-Maintained Content](#hand-maintained-content)
- [Generators](#generators)
- [Generator Configuration](#generator-configuration)
- [Generated Files](#generated-files)

## Source Layout

The basic source structure is:

```text
us-quality-core/
|-- README.md                          Repository overview
|-- DEVELOPER.md                       Developer documentation
|-- sushi-config.yaml                  IG metadata, dependencies, pages, and build parameters
|-- ig.ini                             IG Publisher entry point
|-- fsh.ini                            SUSHI configuration used by the IG Publisher
|-- definitions/                       Maintained JSON definitions for project-specific generators
|   |-- uscdi_plus_quality.json         USCDI+ Quality data element and profile mappings
|   `-- capabilities.json        REST/search conformance requirements
|-- scripts/                           Node-based generators and shared helper code
|   |-- generator.config.js            Shared generator paths, identifiers, and behavior
|   |-- generate_flags.js              Generates USCDI+ Quality flag RuleSets
|   |-- generate_rest.js               Generates REST RuleSets and SearchParameters
|   |-- generate_uscdi_quality_csv.js  Generates the USCDI+ Quality CSV download
|   |-- generate_view_data.js          Generates JSON consumed by Liquid/Jekyll templates
|   `-- lib/                           Shared generator helpers
|-- input/
|   |-- fsh/                           FHIR Shorthand source
|   |   |-- profiles/                  Authored US Quality Core profile definitions
|   |   |-- extensions/                Authored extension definitions
|   |   |-- valuesets/                 Authored value set definitions
|   |   |-- instances/                 Authored CapabilityStatements, examples, and other instances
|   |   `-- generated/                 Committed generated FSH; do not edit by hand
|   |       `-- search-parameters/     Generated SearchParameter definitions
|   |-- pages/                         Authored narrative pages in Markdown
|   |-- intro-notes/                   Profile intro and notes Markdown fragments
|   |-- includes/                      Liquid/Jekyll includes for generated narrative sections
|   |-- data/
|   |   `-- generated/                 Committed generated JSON view data; do not edit by hand
|   |-- _resources/                    Supporting IG resources
|   `-- images/                        Static image assets
|       `-- generated/                 Committed generated downloads; do not edit by hand
`-- output/                            IG Publisher output; not maintained source
```

## How To Make Changes

Most IG maintenance falls into two categories:

1. **Automation-driven content** - maintained as JSON definitions under
   `definitions/`, then expanded into generated FSH and generated Jekyll data.
2. **Hand-maintained content** - authored directly in FSH or Markdown under
   `input/`.

Do not edit files under `input/fsh/generated/` or `input/data/generated/` by
hand. If generated output is wrong, update the maintained JSON or authored
source and rerun the relevant generator.

## Maintained Definition Schemas

The two JSON files under `definitions/` are hand-maintained generator
definitions. The examples below show their basic shapes; arrays may contain any
number of entries, including none where the corresponding behavior is not
needed.

### `definitions/uscdi_plus_quality.json`

This file is an array with one object per USCDI+ Quality data element:

```json
[
  {
    "class": "Adverse Events",
    "name": "Adverse Event Condition",
    "description": "Description shown in the USCDI+ Quality table.",
    "narrative": {
      "note": null,
      "profileOverride": null
    },
    "mappings": {
      "usCore": [],
      "usQualityCore": [
        {
          "profile": "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-adverseevent",
          "elements": [
            "AdverseEvent.resultingCondition"
          ]
        }
      ]
    }
  }
]
```

- `class`, `name`, and `description` supply the data class, data element name,
  and descriptive text shown on the USCDI+ Quality page.
- `narrative.note` is either a Markdown string or `null`. A non-null value
  adds a note link and the corresponding note below the table.
- `narrative.profileOverride` is either a Markdown string or `null`. A non-null
  value replaces the generated links in the "Implement with US Quality Core
  Profile(s)" cell and leaves the "Implement with US Core Profile(s)" cell
  blank for that data element.
- `mappings.usCore` contains US Core canonical profile URLs. These mappings do
  not include individual element paths.
- `mappings.usQualityCore` contains US Quality Core canonical profile URLs and
  the FHIR element paths represented by each profile. Element paths begin with
  the FHIR resource type, for example `AdverseEvent.resultingCondition`.
- Every data element must have at least one US Core or US Quality Core mapping.

### `definitions/capabilities.json`

This file is an object keyed by FHIR resource type. Each value describes the
resource's CapabilityStatement and search requirements:

```json
{
  "Immunization": {
    "interactions": {
      "read": "SHALL",
      "search-type": "SHALL"
    },
    "revIncludes": [
      {
        "value": "Provenance:target",
        "expectation": "SHALL"
      }
    ],
    "searchParams": {
      "patient": {
        "type": "reference",
        "documentation": "Search parameter guidance in Markdown.",
        "expectation": "SHALL",
        "expression": "Immunization.patient",
        "exampleValue": "Patient/example",
        "multipleOr": {
          "value": true,
          "expectation": "MAY"
        },
        "multipleAnd": {
          "value": true,
          "expectation": "MAY"
        }
      },
      "status": {
        "type": "token",
        "documentation": "Search parameter guidance in Markdown.",
        "expectation": "MAY",
        "expression": "Immunization.status",
        "exampleValue": "completed",
        "multipleOr": {
          "value": true,
          "expectation": "MAY"
        },
        "multipleAnd": {
          "value": true,
          "expectation": "MAY"
        }
      }
    },
    "profileExampleOverrides": {
      "us-quality-core-immunizationnotdone": {
        "status": "not-done"
      }
    },
    "searchCombinations": [
      {
        "params": [
          "patient",
          "status"
        ],
        "expectation": "SHALL"
      }
    ]
  }
}
```

- Each top-level key is an R4 resource type. The configured resource types must
  exactly match those inferred from authored US Quality Core profiles and the
  profile mappings in `definitions/uscdi_plus_quality.json`. Resource support
  is generated as `SHALL` when at least one profile for that resource has a
  USCDI+ Quality mapping, and `MAY` otherwise.
- Resource-level CapabilityStatement documentation is generated from the
  required search parameter and combination metadata. The generator compares
  each requirement with the configured US Core Server CapabilityStatement to
  describe whether it is required, recommended, optional, or absent in US Core.
  It also generates rationale text from the resource type and search shape.
  Combination matching is independent of parameter order, and matching
  individual parameters must have the same search type.
  When a required resource has no required searches, the generator emits the
  standard no-additional-search guidance. Resources without mapped profiles
  receive optional-support guidance.
- `interactions` maps FHIR resource interaction codes to expectation codes such
  as `SHALL` or `MAY`.
- `revIncludes` lists supported `_revinclude` values and their expectations.
- `searchParams` is keyed by search parameter code. Every configured search
  parameter requires `type`, `documentation`, `expectation`, `expression`, and
  a non-empty `exampleValue`, plus `multipleOr` and `multipleAnd` objects. Each
  multiplicity object declares the boolean SearchParameter value and its
  `SHALL`, `SHOULD`, or `MAY` conformance expectation. Profile-page request
  examples are composed from these values; complete `GET` requests are not
  maintained by hand.
  A search parameter with a `SHALL` expectation may define a non-empty
  `rationaleOverride` when the generated rationale needs additional clinical
  context.
- Date search parameters also require a `comparators` object mapping each
  supported comparator (`eq`, `ne`, `gt`, `ge`, `lt`, `le`, `sa`, `eb`, or
  `ap`) to its conformance expectation.
- `profileExampleOverrides` optionally maps a local profile id to parameter
  values that differ from the resource-level examples. Use this for constrained
  profiles such as negation profiles whose required status value is
  `not-done`, `declined`, or `rejected`.
- `searchCombinations` lists required parameter combinations. Each `params`
  array contains search parameter codes and `expectation` states the
  combination's conformance level. A combination with a `SHALL` expectation may
  also define `rationaleOverride`.
- `revIncludes`, `searchParams`, and `searchCombinations` may be empty when a
  resource has no requirements of that kind. Supported profile URLs are
  inferred from authored US Quality Core profiles and
  `definitions/uscdi_plus_quality.json` and are not repeated here. For optional
  resources such as Claim, interactions, search parameters, and search behavior
  expectations are configured as `MAY`.

## Automation-Driven Content

Use this workflow when changing USCDI+ Quality mappings, generated flags,
profile tables, generated profile guidance, REST requirements,
CapabilityStatement REST content, or generated SearchParameters.

### Add Or Revise USCDI+ Quality Mappings

Edit `definitions/uscdi_plus_quality.json`.

Use this file when adding or changing:

- USCDI+ Quality data element entries
- data element `narrative.note` notes
- data element `narrative.profileOverride` overrides for the "Implement with US
  Quality Core Profile(s)" table cell
- mapped US Quality Core profiles
- mapped US Quality Core element paths to flag
- mapped US Core profiles

Both `narrative` values are nullable. A non-null `note` adds the existing
data-element note link and note text. A non-null `profileOverride` replaces the
generated US Quality Core profile links in that data element's table cell and
leaves its US Core profiles cell blank. When either value is `null`, that
behavior is omitted.

US Quality Core mappings include profile URLs and element paths. US Core
mappings include only profile URLs; they do not include element mappings.

If the mapping references a US Quality Core element that is not explicitly
defined in the target profile FSH, add the needed rule to the appropriate
profile in `input/fsh/profiles/`. This applies even when the element exists by
inheritance in the compiled profile snapshot. Element short descriptions should
be maintained in profile FSH; the flag generator reads those shorts and applies
the USCDI+ Quality prefix in generated RuleSets.

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

Edit `definitions/capabilities.json`.

Use this file when adding or changing:

- supported REST resources
- optional required-search rationale overrides
- search parameters
- search parameter expectations
- search parameter expressions
- required search parameter combinations

The REST generator uses this definition, together with authored profiles and
mappings in `definitions/uscdi_plus_quality.json`, to generate CapabilityStatement
REST rules and local SearchParameter FSH. An optional profile does not need a
USCDI+ Quality mapping or a generated flag insert; its resource still needs an
entry in `definitions/capabilities.json`.

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
element is flagged for USCDI+ Quality, the target profile FSH must contain an
explicit rule for that element path. The flag generator reads the authored short
and applies the USCDI+ Quality prefix in generated RuleSets.

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

Project-specific generators live under `scripts/`. Maintained JSON definitions
live under `definitions/`. Scripts use those definitions, authored FSH, and
SUSHI-resolved profile metadata to generate formal FSH, view data for rendered
IG pages, and downloadable mapping files.

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
npm --prefix scripts run generate:uscdi-quality-csv
```

The npm scripts are:

- `generate` - runs all current generators in sequence.
- `generate:rest` - generates local SearchParameter definitions and the shared
  CapabilityStatement rest RuleSet.
- `generate:flags` - generates USCDI+ Quality element flagging FSH from the data
  element mapping JSON.
- `generate:view-data` - generates JSON under `input/data/generated` for
  rendered profile guidance, conformance-indicator tables, search rationale
  tables, profile tables, and USCDI+ Quality scope tables.
- `generate:uscdi-quality-csv` - generates the USCDI+ Quality CSV download
  under `input/images/generated`.

## Generator Configuration

Shared generator settings are centralized in `scripts/generator.config.js`.
Change that file when generator behavior needs a project-wide update instead of
adding constants to individual generator entry points.

The configuration is grouped by purpose:

- `labels` and `local` define project terminology, local profile and
  SearchParameter naming, the preferred publisher contact, and the USCDI+
  Quality extension id.
- `upstream` identifies the US Core package and canonical artifacts used for
  profile, SearchParameter, and CapabilityStatement lookups.
- `fhir` contains standard extension URLs shared by REST generation and US Core
  comparison.
- `generated` contains generated RuleSet names and the required profile insert
  comment.
- `rest`, `csv`, and `pages` contain shared output behavior and narrative
  settings.
- `paths` defines all maintained generator inputs and generated output
  locations relative to the IG root.

IG publication metadata—including the canonical URL, package id, version,
dependency versions, publisher, and publication date—continues to come from
`sushi-config.yaml`. Do not duplicate those values in the generator
configuration when they can be read from SUSHI config.

### Important Definitions

- `definitions/uscdi_plus_quality.json` - the data element mapping source for
  USCDI+ Quality flagging. This file identifies the US Quality Core profiles
  and element paths that should receive the USCDI+ Quality extension and
  short-text prefix. Its US Core and US Quality Core profile mappings also
  determine which profiles require support in generated CapabilityStatement rest
  rules. Authored US Quality Core profiles without mappings are included for
  optional support.
- `definitions/capabilities.json` - the RESTful interaction and search
  requirement source for generated SearchParameter definitions and
  CapabilityStatement rest rules.

### `generate_rest.js`

This script keeps local SearchParameter definitions and the repeated
CapabilityStatement rest section driven by
`definitions/capabilities.json` and the profile mappings in
`definitions/uscdi_plus_quality.json`. It writes SearchParameter FSH files under
`input/fsh/generated/search-parameters/` and generates
`input/fsh/generated/USQualityCoreCapabilityStatementRest.fsh`, which is
inserted into the authored server and client CapabilityStatement instances.
Supported profile lists are inferred from authored US Quality Core profiles and
`definitions/uscdi_plus_quality.json`; do not duplicate them in
`definitions/capabilities.json`. Resources without mapped profiles have `MAY`
support expectations. The generated search alignment and
rationale rows are also reused by profile notes through the view-data
generator.

### `generate_flags.js`

This script keeps USCDI+ Quality element flagging driven by
`definitions/uscdi_plus_quality.json`. It generates USCDI+ Quality flagging
RuleSets and validates that mapped element paths both exist in the compiled
profile snapshot and are explicitly authored in the target profile FSH before
writing updates.

Flagged profiles are expected to contain a stable
`* insert GeneratedUSCDIQualityFlagsFor...` rule at the end of the profile. The
script verifies those inserts, but it does not edit authored profile FSH.

If the script reports that an element path does not exist on a target FSH
profile, update the JSON path or add the element to the profile FSH. If it
reports an inherited-only element, add an explicit rule for that element to the
target profile FSH, such as an authored `^short` rule that preserves the current
short text. Do not add one-off path exceptions to the generator.

### `generate_view_data.js`

This script writes generated view-data JSON files under `input/data/generated`.
Those files are consumed by Liquid includes in `input/includes` and rendered by
Jekyll during the IG build. Generated profile guidance uses
`definitions/uscdi_plus_quality.json` to link flagged profile elements back to
the USCDI+ Quality data class and element rows that caused each path to be
flagged.
It also uses the shared REST documentation helper to add the same required
search alignment and rationale rows used by the CapabilityStatements.
For each profile, it also compares the compiled profile snapshot with the base
FHIR resource and any US Core ancestor to derive the element conformance
indicators—Mandatory, Must Support, Additional USCDI, and USCDI+ Quality—and
identify the layer where each indicator is first introduced.

This script depends on `input/fsh/generated/USCDIQualityFlags.fsh`, which is
created by `generate_flags.js`. Run
`npm --prefix scripts run generate:flags` first, or run
`npm --prefix scripts run generate` to execute the npm scripts in the correct
order.

### `generate_uscdi_quality_csv.js`

This script writes the generated USCDI+ Quality CSV download under
`input/images/generated`, which is copied into the rendered IG output. The CSV
contains one row per USCDI+ Quality data element. It uses official profile URLs
in the mapped profile columns and profile computable names in the US Quality
Core mapped elements column.

## Generated Files

This repository commits a small set of generated source files so the IG source
is reviewable and can be built without rerunning project-specific generators.
Do not edit these files by hand; update the source definition or authored FSH,
then rerun the relevant npm script from the IG root.

| File | Generator | Primary inputs |
| --- | --- | --- |
| `input/fsh/generated/USQualityCoreCapabilityStatementRest.fsh` | `npm --prefix scripts run generate:rest` | `definitions/capabilities.json`, `definitions/uscdi_plus_quality.json`, authored FSH |
| `input/fsh/generated/search-parameters/*.fsh` | `npm --prefix scripts run generate:rest` | `definitions/capabilities.json`, `definitions/uscdi_plus_quality.json`, authored FSH |
| `input/fsh/generated/USCDIQualityFlags.fsh` | `npm --prefix scripts run generate:flags` | `definitions/uscdi_plus_quality.json`, authored profile FSH |
| `input/data/generated/profile_notes.json` | `npm --prefix scripts run generate:view-data` | `definitions/uscdi_plus_quality.json`, `definitions/capabilities.json`, generated flag RuleSets, authored profile FSH, configured FHIR and US Core definitions |
| `input/data/generated/profile_table.json` | `npm --prefix scripts run generate:view-data` | `definitions/uscdi_plus_quality.json`, authored profile FSH, configured FHIR and US Core definitions |
| `input/data/generated/data_elements.json` | `npm --prefix scripts run generate:view-data` | `definitions/uscdi_plus_quality.json`, authored profile FSH, configured US Core definitions |
| `input/images/generated/uscdi-quality-data-elements.csv` | `npm --prefix scripts run generate:uscdi-quality-csv` | `definitions/uscdi_plus_quality.json`, authored profile FSH |

Generated RuleSet FSH files are inserted from authored FSH using RuleSet
inserts. Generated SearchParameter FSH files are regular FSH instance
definitions imported by SUSHI. The generated JSON files are consumed by Liquid
includes during the Jekyll/IG Publisher build.
