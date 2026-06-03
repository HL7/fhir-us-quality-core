{:toc}

**USCDI+ Quality** is part of the [USCDI+ initiative](https://www.healthit.gov/topic/interoperability/uscdi-plus). The USCDI+ initiative supports the identification and establishment of domain- or program-specific data element lists that operate as extensions to the existing USCDI data element list.

USCDI+ Quality is intended to improve healthcare interoperability across quality programs by establishing a consistent baseline of harmonized data elements for a wide range of quality measurement and reporting use cases. The USCDI+ Quality data element list serves as a baseline dataset to support digital quality measurement and reporting across the healthcare ecosystem.

USCDI+ Quality includes [two data element lists](https://uscdiplus.healthit.gov/uscdiplus/en/announcing-the-release-of-uscdi-quality-version-1-january-2026?id=kb_article&sys_id=9ee9383c87f6fe108edc42e50cbb350b).

1. **Final USCDI+ Quality V1**:
   The USCDI+ Quality V1 data element list focuses on data elements that are standardized, ready for implementation, and directly support electronic clinical quality measures. This list will serve as the basis for developing implementation guidance for health IT systems.

2. **Quality Overarching**:
   Like USCDI, the USCDI+ Quality framework includes data classes and elements that are not yet part of USCDI+ Quality V1 but are under consideration for future inclusion. The Quality Overarching data element list tracks all quality-relevant data elements identified across selected programs and captures a wider range of data elements identified through community input that may be included in a future version of USCDI+ Quality.

   Content in the Overarching USCDI+ Quality data element list is outside the scope of this guide. However, implementers and partners are encouraged to review these emerging data elements and provide feedback through the [USCDI+ platform](https://uscdiplus.healthit.gov/uscdiplus) to help shape the development of future USCDI+ Quality versions.

### USCDI+ Quality V1 and US Quality Core Implementation Guide

**USCDI+ Quality V1** defines high-level data requirements, and the **US Quality Core Implementation Guide** provides detailed FHIR-based profiles to meet those requirements. This guidance is necessary to achieve interoperability and consistency in quality-related healthcare data exchange in the United States, given the flexibility of the FHIR standard in representing this data.

The US Quality Core Implementation Guide v0.5.0 is derived from the [QI-Core 6.0.0](https://hl7.org/fhir/us/qicore/STU6/), adopting its profiles and annotating them with specific requirements for USCDI+ Quality V1. It also defines specific expectations through [CapabilityStatements](capability-statements.html) for accessing the data over a standard FHIR RESTful API.

Note that:

- USCDI+ Quality V1 data class and element names may differ from the US Quality Core profile and element names.
- Not every USCDI+ Quality V1 data class and element maps to a single US Quality Core profile.

Additionally, this implementation guide's conformance requirements with respect to USCDI+ Quality V1 are limited to:

- Data elements that align with existing QI-Core 6.0.0 or US Core 6.1.0 profiles, and
- Data elements used by the 2026 draft CMS eCQMs, which are based on QI-Core 6.0.0.

Data elements that do not clearly fit within these limitations above are out of scope for this version's conformance requirements.  The tables included in [section 3.1.2](uscdiquality.html#in-scope-uscdi-quality-v1-data-elements) and [section 3.1.3](uscdiquality.html#out-of-scope-uscdi-quality-v1-data-elements) below describe which USCDI+ Quality V1 data elements are in scope and which are out of scope for conformance requirements of this version of the guide.

{% include mapping-table.md %}
