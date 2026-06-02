
{:toc}

{: #us-quality-core-implementation-guide}

{% include disclaimer.md %}

### Summary
{: #summary}

The US Quality Core Implementation Guide provides guidance for implementing
[USCDI+ Quality](https://uscdiplus.healthit.gov/uscdiplus) in FHIR to support consistent, interoperable representation and exchange of quality data for quality measurement and reporting programs. It
defines profiles that derive from and extend the base [FHIR version R4](http://hl7.org/fhir/R4/index.html) resources and [US Core](https://hl7.org/fhir/us/core/STU6.1/) profiles to provide a common foundation for implementing, sharing, and evaluating quality-related knowledge artifacts across quality improvement efforts. It also defines basic system capability expectations for exchanging data to support digital quality measurement and reporting over standard FHIR interfaces.

### Background

This guide reflects a coordinated federal effort to enable
standardized FHIR-based exchange of data for digital quality measurement and
reporting. [ONC](http://www.healthit.gov/newsroom/about-onc) has established the [USCDI+ Quality data element list](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_domain&sys_id=7ddf78228745b95098e5edb90cbb3525&view=sp) as a common, reusable foundation that can support quality measurement across programs
and settings over time, with a transparent process for proposing and considering additional data elements in future versions. This guide specifies how to represent and exchange the USCDI+ Quality data elements as needed to support reporting of [electronic clinical quality measures (eCQMs)](https://ecqi.healthit.gov/glossary/electronic-clinical-quality-measure-ecqm) used in certain CMS
quality reporting programs, as well as providing guidance on additional data elements used in other quality reporting programs. For more detail on USCDI+ Quality and its scope, see the [USCDI+ Quality](uscdiquality.html) page in this guide.

This guide descends directly from the [Quality Improvement Core (QI-Core) Implementation Guide](https://hl7.org/fhir/us/qicore/STU6/), which aligns with the standards adopted for the ONC Health IT Certification Program, including FHIR, US Core, and USCDI. The initial version of this guide targets [USCDI+ Quality V1](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=07ff90701b72f25049edc957624bcbf8&view=sp) data elements. It is based on the [QI-Core Implementation Guide v6.0.0](https://hl7.org/fhir/us/qicore/STU6/) (QI-Core 6.0.0), which aligns with the [US Core Implementation Guide v6.1.0](https://hl7.org/fhir/us/core/STU6.1/) (US Core 6.1.0) and [USCDI v3.1](https://isp.healthit.gov/united-states-core-data-interoperability-uscdi#uscdi-v3-1).[^1]

[^1]: Consistent with Executive Order 14168 the Sex, Sexual Orientation, and Gender Identity, data elements have been removed or updated in the Patient Demographics/Information Data Class.

This guide extends QI-Core by providing USCDI+ Quality guidance within profiles through the use of flags for [USCDI+ Quality relevant elements](uscdiquality.html). It also introduces [CapabilityStatements](capability-statements.html) that define specific expectations for actors exchanging US Quality Core data over standard RESTful FHIR interfaces. The technical content in this initial version of US Quality Core is intended to be backward compatible with QI-Core 6.0.0. Details of the specific changes made from QI-Core 6.0.0 are provided in the [Change Log](changes.html).

### How to read this Guide
{: #contents}

This guide is divided into several pages, which are listed at the top of each page in the menu bar.

* [Home](index.html): This page provides a summary, background, and scope of US Quality Core.
* [Conformance](conformance.html): These pages describe the set of rules to claim conformance to this guide.
    * [General Requirements](general-requirements.html): This page defines requirements common to all profiles used in this guide.
    * [Must Support](must-support.html): This page defines the expectations for mandatory, Must Support, and USCDI+Quality flagged elements in the US Quality Core Profiles.
    * [Security](security.html): This page documents the general security requirements.
* [Guidance](guidance.html): These pages document best practices and how to use the profiles defined in this guide.
    * [USCDI+ Quality](uscdiquality.html): This page provides additional information about the relationship between USCDI+ Quality and US Quality Core. It maps the US Quality Core Profiles to the USCDI+ Quality data classes and data elements.
    * [General Requirements](general-requirements.html): This page provides guidance and requirements common to all profiles used in this guide.
    * [US Quality Core Negation](negation.html): This page provides guidance on using US Quality Core negation profiles.
    * [Provenance](provenance.html): This page describes the use of Provenance for this guide.
    * [Relationship with USCore and QI-Core](relationship-with-uscore-qicore.html): This page describes the US Quality Core relationship with US-Core and QI-Core.
    * [QDM-to-US Quality Core Mapping](qdm-to-us-quality-core.html): This page provides a detailed description of mapping from the Quality Data Model (QDM) to US Quality Core.
* [FHIR Artifacts](artifacts.html): These pages provide detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
    * [Capability Statements](capability-statements.html): This page defines the expected FHIR capabilities of the US Quality Core Servers and Clients.
    * [Profiles](profiles.html): This page lists all profiles defined in or used by US Quality Core.
    * [Extensions](extensions.html): This page lists all extensions defined as part of US Quality Core.
    * [Terminology](terminology.html): This page lists the US Quality Core ValueSets and Code Systems defined for the profiles.
    * [Examples](examples.html): This page lists all the examples used in this guide.
* [CQL Artifacts and Patterns (Informational)](cql-artifacts.html): These pages provide the US Quality Core model information (ModelInfo) and document patterns for use with US Quality Core. This content is informational and is not part of the conformance requirements of this guide.
    * [US Quality Core ModelInfo](modelinfo.html): This page provides the US Quality Core model information to support implementation using Clinical Quality Language (CQL).
    * [US Quality Core Patterns](patterns.html): This page describes patterns of usage for US Quality Core applications.
* [Downloads](downloads.html): This page provides links to downloadable artifacts.
* [Change Log](changes.html): This Change Log lists changes from QI-Core 6.0.0 to this guide.

### Scope

The US Quality Core IG provides requirements and guidance for using FHIR to implement the USCDI+ Quality data elements. The scope of the conformance expectations of this version of the guide is limited to the representation and exchange of data described in USCDI+ Quality V1. Note that not all USCDI+ Quality V1 data elements are in scope for this version's conformance requirements. See the [In-Scope USCDI+ Quality Data Elements](uscdiquality.html#in-scope-uscdi-quality-v1-data-elements) section for a complete list of the USCDI+ Quality V1 data elements that are in scope for the conformance requirements of this guide.

The scope of this guide is limited to the published content of [QI-Core 6.0.0](https://hl7.org/fhir/us/qicore/STU6/) and [US Core 6.1.0](https://hl7.org/fhir/us/core/STU6.1/).

USCDI+ Quality V1 data elements that are not readily represented in the profiles provided by QI-Core 6.0.0 or US Core 6.1.0 are outside the scope of this version of the guide. Implementers are encouraged to provide feedback for inclusion in future versions of this guide.

This guide retains all artifacts provided by QI-Core 6.0.0, with limited alterations described below, to support the adoption by existing QI-Core implementers. The US Quality Core profiles adhere to a naming convention that uses the prefix "US Quality Core". For example, the US Quality Core profile of Patient is named US Quality Core Patient.

These limited FHIR artifact changes made in this guide include:
* Updated the prefix of FHIR profile names from QI-Core to US Quality Core.
* Updated logical id of the resources from 'qicore' to 'us-quality-core'.
* Removed 'QI-Core' flags on FHIR elements, this guide uses 'USCDI+ Quality' flags to indicate which elements must be supported to meet [USCDI+ Quality conformance requirements](general-requirements.html#summary-of-conformance-requirements).
  * In cases where a 'QI-Core' flagged FHIR element within a QI-Core 6.0.0 profile does not map to a USCDI+ Quality data element, the FHIR element is not flagged and is therefore not part of the conformance requirements of this guide.

Note that the informational ModelInfo file that supports implementations using CQL has been updated to reflect the changes made to US Quality Core. See [CQL Artifacts and Patterns (Informational)](cql-artifacts.html) for details; this content is not part of the conformance requirements of this guide.

### Acknowledgements

Content in this initial version of the US Quality Core is primarily based on the QI-Core 6.0.0, as managed by the [HL7 Clinical Quality Information Workgroup](http://www.hl7.org/Special/committees/cqi/index.cfm) and the supporting Quality Improvement (QI) community.

---
Footnotes:
