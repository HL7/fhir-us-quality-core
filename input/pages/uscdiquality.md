{:toc}

{: .note}
> Since we should be very close to fully covering Draft USCDI+ Quality V2, this page gets a lot simpler.  We removed several sections.

**USCDI+ Quality** is part of the [USCDI+ initiative](https://www.healthit.gov/topic/interoperability/uscdi-plus). The USCDI+ initiative supports the identification and establishment of domain- or program-specific data element lists that operate as extensions to the existing USCDI data element list.
 
USCDI+ Quality is intended to improve healthcare interoperability across quality programs by establishing a consistent baseline of harmonized data elements for a wide range of quality measurement and reporting use cases. The USCDI+ Quality data element list serves as a baseline dataset to support digital quality measurement and reporting across the healthcare ecosystem.
 
USCDI+ Quality includes [two data element lists](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_domain&sys_id=7ddf78228745b95098e5edb90cbb3525&view=sp).
 
1. **Draft USCDI+ Quality V2**:
   The Draft USCDI+ Quality V2 data element list builds on USCDI+ Quality V1 adn reflects public feedback received during the Draft V2 comment submission period from January 30, 2026 to March 20, 2026. Draft USCDI+ Quality V2 prioritizes data elements for implementation that align with USCD , are represented in relevant implementation guidance, or directly support electronic clinical quality measures. For more information and highlights on Draft USCDI+ Quality V2, see [ONC's release bulletin](USCDI+ Articles - USCDI+ Quality: Public Feedback Requested on Draft V2 Data Element List by July 17…).
 
2. **Quality Overarching**:
   Like USCDI, the USCDI+ Quality framework includes data classes and elements that are not yet part of USCDI+ Quality V2 but are under consideration for future inclusion. The Quality Overarching data element list tracks all quality-relevant data elements identified across selected programs and captures a wider range of data elements identified through community input that may be included in a future version of USCDI+ Quality.
 
   Content in the Overarching USCDI+ Quality data element list that is not represented in Draft USCDI+ Quality V2 is outside the scope of this guide. Implementers and partners are encouraged to review these emerging data elements and provide feedback through the [USCDI+ platform](https://uscdiplus.healthit.gov/uscdiplus) to help shape the development of future USCDI+ Quality versions.



### USCDI+ Quality V2 and US Quality Core Implementation Guide

**USCDI+ Quality V2** defines high-level data requirements, and the **US Quality Core Implementation Guide** provides detailed FHIR-based profiles to meet those requirements. This guidance is necessary to achieve interoperability and consistency in quality-related healthcare data exchange in the United States, given the flexibility of the FHIR standard in representing this data.

The US Quality Core Implementation Guide v1.0.0 defines profiles and specific requirements for USCDI+ Quality V2. It also defines specific expectations through [CapabilityStatements](capability-statements.html) for accessing the data over a standard FHIR RESTful API.

Note that:

- USCDI+ Quality V2 data class and element names may differ from the US Quality Core profile and element names.
- Not every USCDI+ Quality V2 data class and element maps to a single US Quality Core profile.

{% include uscdi-quality-data-elements.md %}
