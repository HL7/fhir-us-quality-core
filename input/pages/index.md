{:toc}

{: #us-quality-core-implementation-guide}

{% include disclaimer.md %}

{: .note-to-balloters}
> US Quality Core currently provides guidance for implementing United States Core Data for Interoperability Plus Quality (USCDI+ Quality) Draft Version 2 (V2). This guidance will be updated through the ballot reconciliation process when the final USCDI+ Quality V2 dataset is published, which is expected in September 2026.
>
> [USCDI+ Quality Page](uscdiquality.html): Implementor feedback is requested on the proposed USCDI+ Quality mappings to US Quality Core and US Core profiles below. Specific feedback on the following elements is requested:
> - **Diagnostic Imaging: Diagnostic Imaging Reference:** We are seeking feedback on the level of detail necessary for quality reporting. This element is currently mapped to the `DiagnosticReport` profile. Additional mappings to `DocumentReference.content.attachment.url` or `ImagingStudy.endpoint` were considered to semantically align with the USCDI+ Quality data element description by identifying the location of the referenced document content, but feedback through the US Quality Core IG will help determine if these additional mappings should be added.
> - **Encounter Information: Diagnosis Rank:** In QI-Core, information about Principal Diagnosis is represented using the `Claim` profile. In US Quality Core v1.0.0-ballot, support for the `Claim` profile is not required for conformance. We encourage the quality community to provide additional input on information needed to support quality measurement use cases for this USCDI+ Quality data element.
> - **Encounter Information: Present on Admission:** In QI-Core, information about Present on Admission is represented using the `Claim` profile. In US Quality Core v1.0.0-ballot, support for the `Claim` profile is not required for conformance. We have reintroduced the Diagnosis Present on Admission extension for `Encounter.diagnosis` in this US Quality Core v1.0.0-ballot, and the extension is (USCDI+ Quality) tagged.
> - **Goals and Preferences: Patient Goals and SDOH Goals:** We are seeking feedback on the use of additional Goal elements (e.g., `Goal.target`) as it relates to this USCDI+ Quality data element and quality measure use cases.
> - **Orders: Nutrition Order:** We are seeking feedback on whether US Quality Core should include mappings for Nutrition Order beyond `NutritionOrder.oralDiet` to also include `NutritionOrder.enteralFormula` and `NutritionOrder.supplement`. These elements align with the broader Nutrition Order description which includes enteral feedings and nutritional supplements; however, we require additional feedback on support for their implementation and necessity for quality reporting.
> - **Procedures: Procedures:** In QI-Core, information about Principal Procedure is represented using the `Claim` profile. In US Quality Core v1.0.0-ballot, support for the `Claim` profile is not required for conformance. Implementers may determine the appropriate implementation approach to support this USCDI+ Quality data element. We encourage the quality community to provide additional input on information needed to support quality measurement use cases for this USCDI+ Quality data element.
>
> Specific feedback on the following profiles is also requested: 
> - [Adverse Event Profile](StructureDefinition-us-quality-core-adverseevent.html): We are seeking feedback on how adverse event information is used in quality measures and made available through clinical data systems. Input will help determine the need for and appropriate representation of this data element in US Quality Core.
> - [Task](StructureDefinition-us-quality-core-task.html) and [Communication](StructureDefinition-us-quality-core-communication.html) Profiles: We are seeking feedback on the scope and implementation requirements for supporting Task and Communication data elements. Implementers have noted that these profiles are broad, and feedback is needed on how their requirements can be represented clearly in quality measures and USCDI+ Quality.
>
> [US Quality Core Server Capability Statement](CapabilityStatement-us-quality-core-server.html): Implementor feedback is requested on the selection of search parameters and search parameter combinations to support quality measurement and reporting use cases. Where possible, search requirements are reused from US Core, though US Quality Core expands them in selected cases. See [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection) for more information.
> - **Date-based Filters:** We are seeking feedback on the value of adding date-based search parameters to the RESTful API, including relevant resources and date search parameters. The current version does not expand date-based search requirements beyond those already required by US Core.

### Summary
{: #summary}

The US Quality Core Implementation Guide provides guidance for implementing [United States Core Data for Interoperability (USCDI)+ Quality)](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_domain&sys_id=7ddf78228745b95098e5edb90cbb3525&view=sp) in FHIR to support
standardized, interoperable representation and exchange of quality data for
quality measurement and reporting programs. It defines profiles that derive from
and extend the base [FHIR version R4](http://hl7.org/fhir/R4/index.html)
resources and [US Core](https://hl7.org/fhir/us/core/STU9/) profiles to provide
a common foundation for implementing, sharing, and evaluating quality-related
knowledge artifacts across quality improvement efforts. It also specifies
baseline system capability expectations for exchanging data to support digital
quality measurement and reporting over standard FHIR interfaces.

### Background

This guide reflects a coordinated federal effort to enable standardized
FHIR-based exchange of data for digital quality measurement and reporting.
[The Office of the National Coordinator for Health Information Technology (ONC)](http://www.healthit.gov/newsroom/about-onc) has established the [USCDI+
Quality data element
list](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_domain&sys_id=7ddf78228745b95098e5edb90cbb3525&view=sp)
as a common, reusable foundation that can support quality measurement across
programs and settings over time, with a transparent process for proposing and
considering additional data elements in future versions. This guide specifies
how to represent and exchange the USCDI+ Quality data elements as needed to
support digital quality measurement and reporting programs, including
[electronic clinical quality measures
(eCQMs)](https://ecqi.healthit.gov/glossary/electronic-clinical-quality-measure-ecqm)
used in certain CMS quality reporting programs, as well as providing guidance on
additional data elements used in other quality reporting programs. For more
detail on USCDI+ Quality and its scope, see the [USCDI+
Quality](uscdiquality.html) page in this guide.

{% include img-landscape.html img="context-diagram.png" caption="US Quality Core defines how to represent and exchange USCDI+ Quality data elements in FHIR, building on the US Core Implementation Guide and USCDI." %}

US Quality Core descends from [Quality Improvement Core
(QI-Core)](https://hl7.org/fhir/us/qicore/) and is aligned to [US
Core](https://hl7.org/fhir/us/core/). For more information, see [Relationship
with US Core and QI-Core](relationship-with-uscore-qicore.html).

### Scope

The US Quality Core IG provides requirements and guidance for representing and
exchanging clinical data used in quality measurement programs in FHIR within the
US Realm. Its baseline conformance requirements cover the data described in the
[USCDI+ Quality Data Element List](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_domain&sys_id=7ddf78228745b95098e5edb90cbb3525&view=sp), which establishes a consistent baseline of
harmonized data elements for a wide range of quality measurement use cases. The
profiles, extensions, and constraints required for conformance support the
representation and exchange of data relevant to USCDI+ Quality.

Profiles may also be included for optional use. Inclusion in this guide does not
by itself make support for a profile part of the baseline conformance requirements.
See [General Requirements](us-quality-core-general-requirements.html#summary-of-conformance-requirements)
for profile support and exchange requirements.

This guide defines a standardized method for exchanging this data between
producers of data (e.g., health information systems that store the data and respond to data requests) and the quality measurement systems that calculate measure reports based on this data.  This exchange definition does not
introduce use-case-specific or novel methods for exchanging these data, instead,
it extends the US Core RESTful API to provide a flexible and widely-adopted
method for accessing quality related data.

Additionally, the following topics are outside the scope of this guide:
* How consumers of the quality data described in this guide calculate quality measures
* How to reference data elements in this guide within quality measures, including those represented using standards such as Clinical Quality Language (CQL)
* How to represent and exchange quality measurement reports using FHIR
* Specifics of quality program policy, such as who reports, when, and the "form and manner" of submission

### How to read this Guide
{: #contents}

This guide is divided into several pages, which are listed in the menu bar at the top of each page:

* [Home](index.html): Overview of US Quality Core, including background and scope
* [Conformance](conformance.html): Requirements for claiming conformance to this IG  
    * [General Requirements](us-quality-core-general-requirements.html): Requirements common to all profiles used in this guide
    * [Must Support](must-support.html): Expectations for elements flagged as “Must Support” and “USCDI+ Quality”
    * [Security](security.html): General security requirements
* [Guidance](guidance.html): Implementation guidance for using US Quality Core profiles
    * [USCDI+ Quality](uscdiquality.html): Description of the relationship between USCDI+ Quality and US Quality Core, including profile mappings and conformance scope
    * [Relationship with US Core and QI-Core](relationship-with-uscore-qicore.html): Relationship of US Quality Core to US Core and QI-Core
    * [US Quality Core Negation](negation.html): Guidance on using US Quality Core negation profiles
    * [Provenance](provenance.html): Description of the use of Provenance in US Quality Core
* [FHIR Artifacts](fhir-artifacts.html): Computable artifacts and examples
    * [Capability Statements](capability-statements.html): Expected FHIR capabilities of the US Quality Core Servers and Clients
    * [Profiles](profiles.html): Profiles defined in or used by US Quality Core
    * [Extensions](extensions.html): Extensions defined as part of US Quality Core
    * [Terminology](terminology.html): US Quality Core ValueSets and Code Systems defined for the profiles
    * [Examples](examples.html): Examples used in this guide
* [Downloads](downloads.html): Downloadable artifacts
* [Change Log](changes.html): List of changes to this guide across versions

---

Primary Authors: Eric Haas, Yan Heras, Adam Holmes, Rob Scanlon, Eryn Yuasa
