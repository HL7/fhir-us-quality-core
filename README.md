# US Quality Core Implementation Guide

This repository contains the source for the US Quality Core Implementation Guide, which defines a set of FHIR profiles and extensions for use in clinical quality measurement.

The implementation guide is based on [FHIR version 4.0.1 (R4 release)](http://hl7.org/fhir/R4/index.html) and depends on the [US Core Implementation Guide (STU 9.0.0)](https://hl7.org/fhir/us/core/STU9/).

## Local Build

This IG is authored in FHIR Shorthand (FSH) under `input/fsh` and uses
[SUSHI](https://fshschool.org/docs/sushi/) to generate FHIR resources. The HL7
IG Publisher runs SUSHI automatically when building the guide.

### Prerequisites

Install the following before building the IG.

- **Java** - required to run the HL7 IG Publisher. Install a current Java LTS
  runtime or JDK and verify it is available on your path:

  ```sh
  java -version
  ```

- **Ruby, RubyGems, Jekyll, and Bundler** - required by the IG Publisher to
  render the final HTML site. Install Ruby and RubyGems for your platform, then
  install Jekyll and Bundler:

  ```sh
  gem install jekyll bundler
  ruby --version
  jekyll --version
  ```

- **Node.js and npm** - required for SUSHI and for this repository's generator
  scripts. Install a current Node.js LTS release, then install the generator
  dependencies from the IG root:

  ```sh
  node --version
  npm --version
  npm --prefix scripts install
  ```

- **SUSHI** - required to compile FSH. The IG Publisher reads `fsh.ini` and
  invokes the pinned `fsh-sushi` version when building the IG. The generator
  scripts also install their local `fsh-sushi` dependency under `scripts/`, so
  a global SUSHI install is not required for the normal project workflow.

- **IG Publisher** - downloaded by the update publisher script:

  ```sh
  ./_updatePublisher.sh
  ```

  On Windows, run `_updatePublisher.bat`.

### Build Commands

To build locally on macOS or Linux, run the following commands from the IG
root:

```sh
./_updatePublisher.sh
./_genonce.sh
```

On Windows, run:

```bat
_updatePublisher.bat
_genonce.bat
```

## Development

See [DEVELOPER.md](DEVELOPER.md) for information about maintaining this IG.
