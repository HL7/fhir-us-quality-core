{: toc}

{: #changes}

This page lists the change history for each version of **US Quality Core**.  For
v0.5.0 it provides an overview of the changes made to the predecessor QI-Core v6.0.0.

### v0.5.0

{: #v0.5.0}

This initial version of the US Quality Core IG is
based on <a href="https://hl7.org/fhir/us/qicore/STU6/">QI-Core v6.0.0</a> and adds USCDI+ Quality V1 guidance and
requirements. This guide retains all artifacts provided by QI-Core v6.0.0; it does not remove QI-Core profiles that are not relevant to USCDI+ Quality. Instead, scope and conformance requirements are described on the <a href="uscdiquality.html">USCDI+ Quality Guidance</a> and <a href="must-support.html">Must Support</a> pages.

The following pages containing USCDI+ Quality V1 guidance have been **added**:

* <a href="general-requirements.html">General Requirements</a>: Documents requirements common to all US Quality Core actors in this guide
* <a href="must-support.html">Must Support</a>: Provides additional context on the usage and requirements of MustSupport elements and the USCDI+ Quality flag
* <a href="uscdiquality.html">USCDI+ Quality Guidance page</a>: Describes which US Quality Core profiles implement USCDI+ Quality data classes and elements
* <a href="relationship-with-uscore-qicore.html">Relationship with US Core and QI-Core</a>: Provides additional context on the relationship of US Quality Core with US Core and QI-Core
* <a href="capability-statements.html">Capability Statements</a>: Specifies requirements for servers and clients exchanging USCDI+ Quality data via a standard FHIR RESTful interface

The following QI-Core v6.0.0 content has been **altered**:
* The <a href="index.html">Home page</a> has been updated to include background, context, and scope for US Quality Core
* All profiles containing USCDI+ Quality elements have been updated to include USCDI+ Quality tags to indicate elements necessary for USCDI+ Quality V1 implementation. For example, <a href="StructureDefinition-us-quality-core-adverseevent.html">AdverseEvent</a> includes a USCDI+ Quality Elements section with six elements relating to USCDI+ Quality
* This <a href="changes.html">Change Log</a> has been reset to v0.5.0
* The Table of Contents and associated navigation header has been reorganized similar to US Core to contain dropdowns for Conformance, Guidance, and FHIR Artifacts
* Informational artifacts inherited from QI-Core v6.0.0 supporting measure authoring, including the ModelInfo file and CQL scripts, have been modernized in a manner consistent with later versions of QI-Core. These informational artifacts are outside the scope of conformance expectations of this IG but are retained in this version to support continuity in the CQL tooling ecosystem.

Several other updates have been made to provide this Implementation Guide
a separate identity from QI-Core, particularly around naming and machine-readable
content.  This includes:
* Updates Implementation Guide metadata to establish a separate identity from QI-Core, resulting in the following changes:
   * Title updated to US Quality Core
   * Computable name updated to USQualityCore
   * Version reset to v0.5.0
   * Logical id of resources updated to us-quality-core
   * Canonical URL updated to match the ID
   * Removal of (QI-Core) flags
* Updates the ID prefix of all computable artifacts from QICore to USQualityCore
* Reintroduces the Present on Admission extension for Encounter.diagnosis