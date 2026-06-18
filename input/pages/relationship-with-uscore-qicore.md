### Relationship with US Core and QI-Core

US Quality Core v1.0.0 is based on QI-Core 8.0.0-ballot and uses US Core
9.0.0 as its direct US Core dependency. QI-Core 8.0.0-ballot was developed on
US Core 8.0.0, so this guide preserves the QI-Core 8 profile lineage while
updating its US Core alignment to US Core 9.0.0. The earlier US Quality Core
v0.5.0 draft was based on QI-Core 6.0.0, which depended on US Core 6.1.0.

The profiles defined in US Quality Core are derived from US Core profiles
whenever possible. As a result, conforming to US Core automatically satisfies a
significant subset of the conformance requirements of US Quality Core. US
Quality Core conformance involves supporting certain additional data elements
not required by US Core, because they are needed for quality measurement and reporting.

Because US Quality Core profiles derive from US Core profiles where possible,
wherever US Core defines a binding, the US Quality Core profiles inherit that
binding. US Quality Core may specify additional constraints, such as requiring a
binding that is only preferred in the US Core base profile, but in general, the
US Quality Core profiles use the same bindings as US Core.

### Search Expectations and US Core
{: #search-expectations-and-us-core}

The US Quality Core CapabilityStatements identify the RESTful API capabilities specifically needed for [in-scope USCDI+ Quality V2 data](uscdiquality.html#in-scope-uscdi-quality-v2-data-elements). They do not repeat every US Core search expectation. For the search selection approach and conformance details, see [API Requirements](us-quality-core-general-requirements.html#api-requirements).

### Profile Scope

This version of US Quality Core includes a profile set intended to support USCDI+ Quality implementation. Including a profile in the guide does not mean every profile is required for US Quality Core conformance.

Only profiles that include at least one USCDI+ Quality-flagged element are in scope for this version's conformance requirements. The [Summary List of In-Scope Profiles for Conformance](uscdiquality.html#summary-list-of-in-scope-profiles-for-conformance) identifies the profiles that **SHALL** be supported. Profiles that do not include USCDI+ Quality-flagged elements are listed in the [Summary List of Out-of-Scope Profiles for Conformance](uscdiquality.html#summary-list-of-out-of-scope-profiles-for-conformance); they are included in this guide to ease adoption and preserve profile continuity, but they are not required for USCDI+ Quality V2 conformance.

See the [Scope](index.html#scope), [USCDI+ Quality](uscdiquality.html), and [Change Log](changes.html) sections of this guide for additional details on this release.
