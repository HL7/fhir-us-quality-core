{:toc}


This page documents requirements common to all US Quality Core actors in this guide. The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules](https://hl7.org/fhir/R4/conformance-rules.html).

### Summary of Conformance Requirements

In addition to adherence to core FHIR requirements, conformance to this US Quality Core Implementation Guide also requires the following:

- Implementations **SHALL** support all [US Quality Core profiles](profiles.html).
- Implementations **SHALL** support all elements flagged as USCDI+ Quality and all elements flagged MustSupport in underlying US Core profiles.
- Server implementations **SHALL** support the requirements described in the [US Quality Core Server CapabilityStatement](CapabilityStatement-us-quality-core-server.html).
- Server implementations **SHALL** support all interactions, search parameters, and combined search parameters that have `SHALL` conformance expectations in the US Quality Core Server CapabilityStatement.
- Server implementations **SHALL** declare their support of the US Quality Core profiles in a FHIR CapabilityStatement.
- Quality improvement applications **SHALL** recognize and process all MustSupport elements in US Quality Core.
- Modifier elements **SHALL** be treated as MustSupport, even if not explicitly declared.
    - Applications **SHALL NOT** process resource instances that include unknown modifier elements.
- If a target resource referenced by a US Quality Core profile has a US Quality Core profile, it **SHALL** conform to the US Quality Core profile.
- Quality improvement applications **SHALL** be simultaneously compliant with US Quality Core profiles and US Core profiles. Where a US Quality Core profile is derived from a US Core profile, the more restrictive bindings defined by US Quality Core **SHALL** be applied where they exist.
- Applications **SHOULD** use the preferred value sets as defined by US Quality Core profiles.

### API Requirements

US Quality Core RESTful API conformance is defined by the [US Quality Core CapabilityStatements](capability-statements.html). The CapabilityStatements identify required and optional RESTful interactions, including `read` and `search-type`, as well as individual search parameters and combined search parameters used to retrieve USCDI+ Quality data.

US Quality Core implementations **SHALL** also conform to applicable US Core RESTful API requirements. This guide may restate US Core requirements to highlight those that are relevant to USCDI+ Quality data access, and any US Core requirements not restated in US Quality Core remain part of the applicable US Core conformance expectations for implementations.

#### Search Requirement Selection

Like US Core, many US Quality Core RESTful API requirements are search requirements. US Quality Core defines a focused set of searches needed to retrieve USCDI+ Quality data for quality measurement and reporting.

US Quality Core CapabilityStatements may restate US Core search requirements when the search is directly relevant to USCDI+ Quality data access. Restating a US Core search in this guide highlights its relevance for US Quality Core; not restating a US Core search in this guide does not remove the underlying US Core requirement.

US Quality Core adds search requirements when retrieval support is needed for quality workflows. This includes searches for resources without a corresponding US Core profile, filters needed to retrieve or distinguish negated or status-sensitive records such as `status` or `do-not-perform`, and code-oriented filters such as `code` or `type` when they support quality retrieval patterns or US Quality Core primary code path guidance.

Individual search parameters with `MAY` expectations identify filters that can participate in required combined searches or support relevant optional filtering. Combined search parameter expectations identify the multi-parameter searches required for US Quality Core conformance.

#### SearchParameter Artifacts

Some US Quality Core and US Core SearchParameter artifacts referenced by these CapabilityStatements are derived from standard FHIR SearchParameters. These artifacts are included to document server and client expectations, such as comparator support, and to support generation tooling. They do not create new search parameter names when a standard FHIR search parameter already exists; actual searches use the standard FHIR search parameter names.

The presence of a SearchParameter artifact in this guide does not, by itself, create a US Quality Core conformance expectation. Conformance expectations for search are established by the CapabilityStatements and their `SHALL` or `MAY` expectation extensions.

### Modifier Elements

Within FHIR resources, some elements are considered [Modifier Elements]({{site.data.fhir.path}}conformance-rules.html#isModifier), indicating that the value of that element may change the interpretation of the resource. A typical example of a modifier element is the `status` element present in many QI Core resources. For example, a `Procedure.status` value of `not-done` indicates that the procedure was not performed.

Decision support and quality implementations **SHALL** always check the values of modifier elements. For example, when processing a Procedure resource, an application must inspect the `status` element to determine whether the procedure was performed or not performed on the patient. For this reason, modifier elements **SHALL** be treated as MustSupport, even if they are not explicitly declared in this guide.

### Negation in US Quality Core
{: #negation-in-us-quality-core}

US Quality Core adopts QI-Core's concept of negation and its approach to constraining negated concepts following an HL7 informative publication on representing negatives.[^2]

US Quality Core constrains these negated concepts as follows:

[^2]: For further information about representing negatives in HL7 standards, see: HL7 Cross Paradigm Specification: Representing Negatives, Release I. April 2022. Available at: <http://www.hl7.org/implement/standards/product_brief.cfm?product_id=592>. Retrieved 31 December 2023.

1.  Absence of data

    A quality measure or Clinical Decision Support (CDS) artifact determines that an expected record artifact does not exist.

2.  Documented absence of data with a valid reason

    A quality measure or CDS artifact uses a specifically designed US Quality Core profile to indicate that an activity intentionally did not occur for a valid reason.

When there is a need to document evidence that an expected activity was not done due to patient preference and/or specific criteria, systems should use one of the US Quality Core specific *negation rationale* profiles that align with the profiles representing the expected actions.
The [US Quality Core Negation](negation.html) page of this guide provides detailed descriptions and guidance on these profiles.

### Terminology Bindings

Quality improvement artifact authors should pay close attention to binding parameters specified in the
profiles to determine whether the value set defined in the binding is exemplar or should be constrained to a specific value set when used. For example, the `code` element of the US Quality Core Medication profile has an extensible binding to a value set composed of all codes from the RxNorm code system, indicating that Medication instances SHOULD use RxNorm codes where available. However, individual artifacts will typically further constrain the Medication code element to a more restricted, clinically focused value set from RxNorm.

### Resource References

FHIR resources frequently contain references (pointers) to other FHIR resources. For example, `Encounter.subject` is a reference to a Patient resource. In US Quality Core, most such references are constrained to US Quality Core profiled resources. For example, the US Quality Core Encounter profile's `Encounter.subject` must point to a Patient resource that conforms to the US Quality Core Patient profile. Consequently, any extensions or bindings expected to exist in US Quality Core Patient are also present in the resource pointed to by `Encounter.subject`. References to US Quality Core extensions accessed through references are guaranteed to be valid. References to resources that do not currently have US Quality Core profiles are not constrained, and as such, only the core FHIR properties and bindings are guaranteed to exist.

A particular problem occurs when a resource reference permits any type of resource, such as `Task.basedOn` or
`Provenance.target`. These are rendered as `Reference(Resource)` in the profile tables. When dealing with
`Reference(Resource)` elements, the current method of specifying profiles does not allow the profile author to specify
something to the effect of "a US Quality Core resource when there is one, and a FHIR core resource if there isn't." As
stated in the [Summary of Conformance Requirements](us-quality-core-general-requirements.html#summary-of-conformance-requirements)
section above, in US Quality Core, the resources referenced by `Reference(Resource)` elements **SHALL** conform to US Quality
Core profiles if the base resource has been profiled.

---
Footnotes:
