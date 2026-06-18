{:toc}

**USCDI+ Quality** is part of the [USCDI+ initiative](https://www.healthit.gov/topic/interoperability/uscdi-plus). The USCDI+ initiative supports the identification and establishment of domain- or program-specific data element lists that operate as extensions to the existing USCDI data element list.

USCDI+ Quality is intended to improve healthcare interoperability across quality programs by establishing a consistent baseline of harmonized data elements for a wide range of quality measurement and reporting use cases. The USCDI+ Quality data element list serves as a baseline dataset to support digital quality measurement and reporting across the healthcare ecosystem.

USCDI+ Quality includes [two data element lists](https://uscdiplus.healthit.gov/uscdiplus/en/announcing-the-release-of-uscdi-quality-version-1-january-2026?id=kb_article&sys_id=9ee9383c87f6fe108edc42e50cbb350b).

1. **Final USCDI+ Quality V2**:
   The USCDI+ Quality V2 data element list focuses on data elements that are standardized, ready for implementation, and directly support electronic clinical quality measures. This list will serve as the basis for developing implementation guidance for health IT systems.

2. **Quality Overarching**:
   Like USCDI, the USCDI+ Quality framework includes data classes and elements that are not yet part of USCDI+ Quality V2 but are under consideration for future inclusion. The Quality Overarching data element list tracks all quality-relevant data elements identified across selected programs and captures a wider range of data elements identified through community input that may be included in a future version of USCDI+ Quality.

   Content in the Overarching USCDI+ Quality data element list is outside the scope of this guide. However, implementers and partners are encouraged to review these emerging data elements and provide feedback through the [USCDI+ platform](https://uscdiplus.healthit.gov/uscdiplus) to help shape the development of future USCDI+ Quality versions.

### USCDI+ Quality V2 and US Quality Core Implementation Guide

**USCDI+ Quality V2** defines high-level data requirements, and the **US Quality Core Implementation Guide** provides detailed FHIR-based profiles to meet those requirements. This guidance is necessary to achieve interoperability and consistency in quality-related healthcare data exchange in the United States, given the flexibility of the FHIR standard in representing this data.

The US Quality Core Implementation Guide v1.0.0 defines profiles and specific requirements for USCDI+ Quality V2. It also defines specific expectations through [CapabilityStatements](capability-statements.html) for accessing the data over a standard FHIR RESTful API.

Note that:

- USCDI+ Quality V2 data class and element names may differ from the US Quality Core profile and element names.
- Not every USCDI+ Quality V2 data class and element maps to a single US Quality Core profile.

Additionally, this implementation guide's conformance requirements with respect to USCDI+ Quality V2 are limited to:

- Data elements that align with existing US Quality Core or US Core profiles, and
- Data elements used by the 2026 draft CMS eCQMs.

Data elements that do not clearly fit within these limitations above are out of scope for this version's conformance requirements. The tables included in [In-Scope USCDI+ Quality V2 Data Elements](uscdiquality.html#in-scope-uscdi-quality-v2-data-elements) and [Out-of-Scope USCDI+ Quality V2 Data Elements](uscdiquality.html#out-of-scope-uscdi-quality-v2-data-elements) below describe which USCDI+ Quality V2 data elements are in scope and which are out of scope for conformance requirements of this version of the guide.

### In-Scope USCDI+ Quality V2 Data Elements
{: #in-scope-uscdi-quality-v2-data-elements}

Only those USCDI+ Quality V2 data classes and elements that are required to
be implemented for conformance to this guide are included in this mapping table.

- In scope elements are determined by their support in the current USCDI+ Quality V2 baseline, which includes USCDI v3.1, US Core 9.0.0, and/or QI-Core 8.0.0-ballot.
- In scope elements also include data elements that are used by 2026 draft CMS eCQMs, which are based on QI-Core 8.0.0-ballot.

The mapping table identifies any US Quality Core profiles defined in this guide and any US Core profiles that apply to each USCDI+ Quality V2 data class or element. If neither column references a profile, this guide does not identify a specific profile for representing that element in this version; implementers may determine the appropriate implementation approach to support the data element.

{% include uscdi-quality-data-elements.md scope="inScope" us_quality_core_header="Implement with US Quality Core Profile(s)" us_core_header="Implement with US Core Profile(s)" %}

### Out-of-Scope USCDI+ Quality V2 Data Elements
{: #out-of-scope-uscdi-quality-v2-data-elements}

The following data elements in USCDI+ Quality V2 are out of scope for the
conformance expectations of this guide. Data elements listed here do not have a US Quality Core or US Core mapping identified for this version of the guide.

{% include uscdi-quality-data-elements.md scope="outOfScope" us_quality_core_header="Relevant US Quality Core Profile(s)" us_core_header="Relevant US Core Profile(s)" %}

### Summary List of In-Scope Profiles for Conformance
{: #summary-list-of-in-scope-profiles-for-conformance}

US Quality Core includes profiles regardless of whether they are applicable to USCDI+ Quality V2. Per the [conformance expectations](us-quality-core-general-requirements.html) and the [capability statements](capability-statements.html) in this guide, only US Quality Core profiles that include at least one USCDI+ Quality–flagged element (as defined in [Must Support](must-support.html)) are in scope for conformance and SHALL be supported.

The following profiles include at least one USCDI+ Quality–flagged element and **SHALL** be supported:

{% include uscdi-quality-profile-list.md scope="inScope" %}

### Summary List of Out-of-Scope Profiles for Conformance
{: #summary-list-of-out-of-scope-profiles-for-conformance}

Some profiles in this guide do not include any USCDI+ Quality–flagged elements (as defined in [Must Support](must-support.html)). These profiles are out-of-scope for USCDI+ Quality V2 conformance but are included to ease adoption and preserve profile continuity.

The following profiles do not include any USCDI+ Quality–flagged elements and **MAY** be supported:

{% include uscdi-quality-profile-list.md scope="outOfScope" %}
