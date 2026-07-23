{:toc}

{: #us-quality-core-implementation-guide}

{% include disclaimer.md %}

### Summary
{: #summary}

The US Quality Core Implementation Guide provides guidance for implementing
[USCDI+ Quality](https://uscdiplus.healthit.gov/uscdiplus) in FHIR to support
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
Core](https://hl7.org/fhir/us/core/). For more information on the relationship
between US Quality Core and these guides, see [Relationship with US Core and
QI-Core](relationship-with-uscore-qicore.html).

### Scope

The US Quality Core IG provides requirements and guidance for representing and
exchanging clinical data used in quality measurement programs in FHIR within the
US Realm.  The scope of the data described in this guide is defined by the
USCDI+ Quality Data Element List, which establishes a consistent baseline of
harmonized data elements for a wide range of quality measurement use cases.
This guide defines a standardized method for exchanging this data between
producers of data (e.g., EHRs) and the quality measurement systems that
calculate measure reports based on this data.  This exchange definition does not
introduce use-case-specific or novel methods for exchanging these data, instead,
it extends the US Core RESTful API to provide a flexible and widely-adopted
method for accessing quality related data.

The scope of this implementation guide is limited to the representation and
exchange of data described in the USCDI+ Quality Data Element List. It includes
only those FHIR profiles, extensions, and constraints needed to represent and
exchange data relevant to USCDI+ Quality.

Additionally, the following topics are outside the scope of this guide:
* How consumers of the quality data described in this guide calculate quality measures
* How to reference data elements in this guide within quality measures, including those represented using standards such as CQL
* How to represent and exchange quality measurement reports using FHIR
* Specifics of quality program policy, such as who reports, when, and the "form and manner" of submission

### How to read this Guide
{: #contents}

This guide is divided into several pages, which are listed at the top of each page in the menu bar.

* [Home](index.html): Overview of US Quality Core, including its background and scope
* [Conformance](conformance.html): Requirements for claiming conformance to this implementation guide
    * [General Requirements](us-quality-core-general-requirements.html): Requirements common to all profiles used in this guide
    * [Must Support](must-support.html): Expectations for Must Support and USCDI+ Quality flagged elements
    * [Security](security.html): General security requirements
* [Guidance](guidance.html): Implementation guidance for using US Quality Core profiles
    * [USCDI+ Quality](uscdiquality.html): Description of the relationship between USCDI+ Quality and US Quality Core, including profile mappings and conformance scope
    * [US Quality Core Negation](negation.html): Guidance on using US Quality Core negation profiles
    * [Provenance](provenance.html): Description of the use of Provenance in US Quality Core
    * [Relationship with US Core and QI-Core](relationship-with-uscore-qicore.html): Relationship between US Quality Core, US Core, and QI-Core
* [FHIR Artifacts](fhir-artifacts.html): Computable artifacts and examples defined by this guide
    * [Capability Statements](capability-statements.html): Expected FHIR capabilities of the US Quality Core Servers and Clients
    * [Profiles](profiles.html): All profiles defined in or used by US Quality Core
    * [Extensions](extensions.html): Extensions defined as part of US Quality Core
    * [Terminology](terminology.html): US Quality Core ValueSets and Code Systems defined for the profiles
    * [Examples](examples.html): Examples used in this guide
* [Downloads](downloads.html): Downloadable artifacts
* [Change Log](changes.html): Change Log that lists changes to this guide across versions
