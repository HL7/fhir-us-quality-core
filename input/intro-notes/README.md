# Profile Intro And Notes Fragments

This directory contains profile-specific Markdown fragments used by the IG
Publisher when rendering profile pages.

Each profile has two files:

```text
StructureDefinition-<profile-id>-intro.md
StructureDefinition-<profile-id>-notes.md
```

The intro file appears before the generated formal profile content. The notes
file appears in the profile notes area.

## Maintenance

Custom narrative may be edited directly in these files. Generated guidance
should be included through Liquid includes rather than copied into each profile
fragment. Those includes read generated JSON from `input/data/generated`.

The most common includes are:

- `profile-uscdi-quality-guidance.md` - USCDI+ Quality element support guidance
  for profile intro fragments.
- `profile-us-core-guidance.md` - US Core lineage guidance for profile intro
  fragments.
- `profile-search-param-guidance.md` - search parameter guidance for profile
  notes fragments.

If a profile is added, create matching intro and notes files. The view-data
generator expects these files to exist for every profile.
