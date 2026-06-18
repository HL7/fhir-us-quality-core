# US Quality Core Implementation Guide

This repository contains the source for the US Quality Core Implementation Guide, which defines a set of FHIR profiles and extensions for use in clinical quality measurement.

The implementation guide is based on [FHIR version 4.0.1 (R4 release)](http://hl7.org/fhir/R4/index.html) and depends on the [US Core Implementation Guide (STU 9.0.0)](https://hl7.org/fhir/us/core/STU9/).

## Building

This IG is authored in FHIR Shorthand (FSH) under `input/fsh` and uses
[SUSHI](https://fshschool.org/docs/sushi/) to generate the FHIR resources used
by the IG Publisher.

To initially build locally, clone the repository and run the following commands in order below in the root command:

  1. **_updatePublisher[.bat | .sh]** - <i>Process retrieves the current version of the IG publisher and stores it within the input-cache folder. The IG publisher is updated on a regular basis but this process does not have to be executed for every instance of the publication process.</i>

  2. **_genonce[.bat | .sh]** - <i>This launches HL7's IG Publisher and builds/publishes the IG one time. The publisher detects `sushi-config.yaml` and invokes SUSHI automatically.</i>

### Dependencies

Before the instructions in the above "Local Build" section will work, you
need to install several primary dependencies.

#### Java

Go to [http://www.oracle.com/technetwork/java/javase/downloads/](
http://www.oracle.com/technetwork/java/javase/downloads/) and download the
latest (version 8 or higher) JDK for your platform, and install it.

#### Ruby

Jekyll requires Ruby version 2.1 or greater.  Depending on your operating
system, you may already have Ruby bundled with it.  Otherwise, or if you
need a newer version, go to [https://www.ruby-lang.org/en/downloads/](
https://www.ruby-lang.org/en/downloads/) for directions.

#### Jekyll

Go to [https://jekyllrb.com](https://jekyllrb.com) and follow the
instructions there, for example `gem install jekyll bundler`.  The end
result of this should be that the binary "jekyll" is now in your path.

#### SUSHI

Install SUSHI before building the IG. The IG Publisher reads `fsh.ini` and
invokes the pinned `fsh-sushi` version when running SUSHI.

## Development

### Scripts

Project-specific generators and developer automation are documented in
[scripts/README.md](scripts/README.md). Install generator dependencies with:

```sh
npm --prefix scripts install
```

Then refresh all committed generated source files with:

```sh
npm --prefix scripts run generate
```

Generated source files are committed to the repository but should not be edited
by hand. See [scripts/README.md](scripts/README.md) for the generated-file
workflow and ownership.

### Source Layout

The most important maintenance paths are:

```text
us-quality-core/
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

When changing generated content, update the maintained source data or authored
FSH first, then rerun the relevant generator documented in
[scripts/README.md](scripts/README.md).

### How To Make Changes

Most content changes start from either authored FSH/Markdown or the maintained
JSON files in `data/`. For generated USCDI+ Quality and REST/search content,
use this workflow.

1. Update the USCDI+ Quality mapping in `data/uscdi_quality.json`.

   Add or update the data element entry with its `class`, `name`, optional
   `notes`, and `mappings`. US Quality Core mappings identify the profile URL
   and the element paths to flag. US Core mappings identify only the mapped US
   Core profile; they do not include element paths.

2. Confirm the mapped US Quality Core elements exist.

   Each mapped element path must exist on the target profile's authored FSH
   definition before it can be flagged. If the generator reports that an
   element path is missing, add the needed differential rule to the appropriate
   profile in `input/fsh/profiles/`, then rerun the generator.

   Element short descriptions should be maintained by hand in the profile FSH.
   The flag generator reads those authored short descriptions and uses them
   when producing the generated USCDI+ Quality RuleSets. If an element is
   mapped for USCDI+ Quality, the generated RuleSet applies the USCDI+ Quality
   extension and writes the flagged short description used in the rendered
   profile views.

3. Add REST/search conformance requirements if needed.

   If the new mapping introduces a supported resource or changes the searches
   expected for that resource, update `data/rest.json`. Add or update the
   resource entry, its narrative `documentation`, `searchParams`, and any
   required `searchCombinations`. Search parameters need the FHIR search
   `type`, CapabilityStatement `expectation`, IG-facing `documentation`, and
   FHIRPath `expression` used to generate local SearchParameter definitions.

4. Refresh generated source.

   Run all generators when mappings change, because the flags, profile notes,
   profile tables, USCDI+ Quality scope tables, CapabilityStatement REST rules,
   and generated SearchParameters may all be affected.

   ```sh
   npm --prefix scripts run generate
   ```

   The full generator command runs the current generators in dependency order:

   - `generate:rest` reads `data/rest.json`, `data/uscdi_quality.json`, and
     authored FSH. It generates
     `input/fsh/generated/USQualityCoreCapabilityStatementRest.fsh` and local
     SearchParameter definitions under
     `input/fsh/generated/search-parameters/`.
   - `generate:flags` reads `data/uscdi_quality.json` and authored profile
     FSH. It generates `input/fsh/generated/USCDIQualityFlags.fsh`.
   - `generate:view-data` reads generated flags, REST data, mapping data, and
     authored FSH. It generates JSON under `input/data/generated/` for profile
     notes, profile tables, and USCDI+ Quality scope tables.

   Do not edit files under `input/fsh/generated/` or
   `input/data/generated/` by hand. If the generated output is wrong, fix the
   maintained JSON or authored FSH source and rerun the generator.

5. Build and review the IG.

   ```sh
   ./_genonce.sh
   ```

   Review `output/qa.html` and spot-check the rendered pages affected by the
   change, especially profile pages, `uscdiquality.html`,
   `profiles.html`, and the CapabilityStatement/SearchParameter artifacts.
