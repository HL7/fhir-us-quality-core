# US Quality Core Implementation Guide

This repository contains the source for the US Quality Core Implementation Guide, which defines a set of FHIR profiles and extensions for use in clinical quality measurement.

The implementation guide is based on [FHIR version 4.0.1 (R4 release)](http://hl7.org/fhir/R4/index.html) and depends on the [US Core Implementation Guide (STU 9.0.0)](https://hl7.org/fhir/us/core/STU9/).

## Local Build

This IG is authored in FHIR Shorthand (FSH) under `input/fsh` and uses
[SUSHI](https://fshschool.org/docs/sushi/) to generate the FHIR resources used
by the IG Publisher.

To initially build locally, clone the repository and run the following commands in order below in the root command:

  1. **_updatePublisher[.bat | .sh]** - <i>Process retrieves the current version of the IG publisher and stores it within the input-cache folder. The IG publisher is updated on a regular basis but this process does not have to be executed for every instance of the publication process.</i>

  2. **_genonce[.bat | .sh]** - <i>This launches HL7's IG Publisher and builds/publishes the IG one time. The publisher detects `sushi-config.yaml` and invokes SUSHI automatically.</i>

## Dependencies

Before the instructions in the above "Local Build" section will work, you
need to install several primary dependencies.

### Java

Go to [http://www.oracle.com/technetwork/java/javase/downloads/](
http://www.oracle.com/technetwork/java/javase/downloads/) and download the
latest (version 8 or higher) JDK for your platform, and install it.

### Ruby

Jekyll requires Ruby version 2.1 or greater.  Depending on your operating
system, you may already have Ruby bundled with it.  Otherwise, or if you
need a newer version, go to [https://www.ruby-lang.org/en/downloads/](
https://www.ruby-lang.org/en/downloads/) for directions.

### Jekyll

Go to [https://jekyllrb.com](https://jekyllrb.com) and follow the
instructions there, for example `gem install jekyll bundler`.  The end
result of this should be that the binary "jekyll" is now in your path.

### SUSHI

Install SUSHI before building the IG. The IG Publisher invokes SUSHI during the
build, so use `npm install -g fsh-sushi` or another project-approved
installation method that places the `sushi` command on your `PATH`.

The latest version of the IG publisher is available here:

[https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar](https://github.com/FHIR/latest-ig-publisher/raw/master/org.hl7.fhir.publisher.jar)
