# Maintained Generator Inputs

This directory contains maintained JSON inputs for project-specific generators.
These files are edited by hand and drive generated FSH and generated view data
elsewhere in the IG source.

## Files

- `uscdi_quality.json` - USCDI+ Quality data element mappings. This file
  identifies US Quality Core profile mappings, mapped element paths to flag, US
  Core profile mappings, and optional data element notes.
- `rest.json` - REST/search conformance requirements. This file provides
  resource-level documentation, search parameter requirements, expressions, and
  search combinations used to generate CapabilityStatement REST rules and local
  SearchParameter definitions.

After changing either file, rerun the generators from the IG root:

```sh
npm --prefix scripts run generate
```

See `README.md` and `scripts/README.md` for the full maintenance workflow.
