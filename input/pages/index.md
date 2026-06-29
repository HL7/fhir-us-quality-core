{:toc}

{: #us-quality-core-implementation-guide}

{% include disclaimer.md %}

  {: .note}
  > Placing some internal notes in this pink note box right now on the top of each
  > page until we have a first stable build.
  >
  > We took a pass at the new scope. We are putting anything
  > that does not fall in USCDI+ Quality as 'out of scope', and in this
  > version of the guide that means we are planning on removing profiles
  > that do not have any USCDI+ Quality tagged elements. Also, out of scope
  > now are the artifacts that provide bindings to CQL.

### Summary
{: #summary}

The US Quality Core Implementation Guide provides guidance for implementing
[USCDI+ Quality](https://uscdiplus.healthit.gov/uscdiplus) in FHIR to support
consistent, interoperable representation and exchange of quality data for
quality measurement and reporting programs. It defines profiles that derive from
and extend the base [FHIR version R4](http://hl7.org/fhir/R4/index.html)
resources and [US Core](https://hl7.org/fhir/us/core/STU9/) profiles to provide
a common foundation for implementing, sharing, and evaluating quality-related
knowledge artifacts across quality improvement efforts. It also defines basic
system capability expectations for exchanging data to support digital quality
measurement and reporting over standard FHIR interfaces.

### Background

This guide reflects a coordinated federal effort to enable standardized
FHIR-based exchange of data for digital quality measurement and reporting.
[ONC](http://www.healthit.gov/newsroom/about-onc) has established the [USCDI+
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

US Quality Core began as a derivative of [Quality Improvement Core (QI-Core)
STU6](https://hl7.org/fhir/us/qicore/STU6/) in the v0.5.0 draft. This v1.0.0
release targets USCDI+ Quality V2 data elements and is based on the [QI-Core
Implementation Guide v8.0.0-ballot](https://hl7.org/fhir/us/qicore/2025Sep/)
(QI-Core 8.0.0-ballot), which aligns with the [US Core Implementation Guide
v8.0.0](https://hl7.org/fhir/us/core/STU8/) (US Core 8.0.0) and [USCDI
v3.1](https://isp.healthit.gov/united-states-core-data-interoperability-uscdi#uscdi-v3-1).
This guide updates that foundation to build directly on [US Core
9.0.0](https://hl7.org/fhir/us/core/STU9/).

[^1]: Consistent with Executive Order 14168 the Sex, Sexual Orientation, and Gender Identity, data elements have been removed or updated in the Patient Demographics/Information Data Class.

{% include img-landscape.html img="context-diagram.png" caption="US Quality Core defines how to represent and exchange USCDI+ Quality data elements in FHIR, building on the US Core Implementation Guide and USCDI." %}

### Scope

The US Quality Core IG provides requirements and guidance for representing and
exchanging clinical data used in quality measurement programs and activities in
FHIR within the US Realm.  The scope of the data described in this guide is
defined by the USCDI+ Quality data element list, which establishes a consistent
baseline of harmonized data elements for a wide range of measurement use cases.
This guide defines a standardized method for exchanging this data between
producers of data (e.g., EHRs) and the quality measurement systems that
calculate reports based on this data.  This is exchange definition does not
introduce use-case specific or novel methods for exchanging this data, and
instead extends the US Core RESTful API to provide a flexible and widely-adopted
data access method.

The scope of this version of the guide is limited to the representation and
exchange of data described in Draft USCDI+ Quality V2.  While this version of the
guide is primarily composed of content from QI-Core and US Core, only that content
that is relevant to Draft USCDI+ Quality V2 is included.

Additionally, the following topics are outside the scope of this guide:
* How consumers of the quality data described in this guide calculate measures
* How to reference data elements in this guide within measures, including those represented using standards such as CQL
* How to represent and exchange quality measurement reports using FHIR
* Specifics of quality program policy, such as who reports, when, what format, and "form and matter"

### How to read this Guide
{: #contents}

This guide is divided into several pages, which are listed at the top of each page in the menu bar.

* [Home](index.html): Overview of US Quality Core, including its background and scope
* [Conformance](conformance.html): The set of rules to claim conformance to this implementation guide
    * [General Requirements](us-quality-core-general-requirements.html): Requirements common to all profiles used in this guide
    * [Must Support](must-support.html): Expectations for Must Support and USCDI+ Quality flagged elements
    * [Security](security.html): General security requirements
* [Guidance](guidance.html): Best practices and how to use the profiles defined in this guide
    * [USCDI+ Quality](uscdiquality.html): Description of the relationship between USCDI+ Quality and US Quality Core, including profile mappings and conformance scope
    * [US Quality Core Negation](negation.html): Guidance on using US Quality Core negation profiles
    * [Provenance](provenance.html): Description of the use of Provenance in US Quality Core
    * [Relationship with US Core and QI-Core](relationship-with-uscore-qicore.html): Relationship between US Quality Core with US Core and QI-Core
    * [QDM-to-US Quality Core Mapping](qdm-to-us-quality-core.html): Mapping from the Quality Data Model (QDM) to US Quality Core
* [FHIR Artifacts](artifacts.html): Detailed descriptions and formal definitions for all the FHIR artifacts defined in this guide
    * [Capability Statements](capability-statements.html): Expected FHIR capabilities of the US Quality Core Servers and Clients
    * [Profiles](profiles.html): All profiles defined in or used by US Quality Core
    * [Extensions](extensions.html): Extensions defined as part of US Quality Core
    * [Terminology](terminology.html): US Quality Core ValueSets and Code Systems defined for the profiles
    * [Examples](examples.html): Examples used in this guide
* [Downloads](downloads.html): Downloadable artifacts
* [Change Log](changes.html): Change Log that lists changes to this guide across versions.

### Acknowledgements

Content of US Quality Core is primarily based on QI-Core, as managed by the [HL7 Clinical Quality Information Workgroup](http://www.hl7.org/Special/committees/cqi/index.cfm) and the supporting Quality Improvement (QI) community.

---
Footnotes:
