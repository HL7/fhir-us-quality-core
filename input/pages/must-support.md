{:toc}

Because US Quality Core derives from US Core the [requirements on "Must Support" defined in US Core]({{site.data.fhir.ver.uscore}}/must-support.html) must be respected.

Like QI-Core, US Quality Core flags USCDI+ Quality elements with a [US Quality Core USCDI+ Quality Extension](StructureDefinition-us-quality-core-uscdi-quality-extension.html) to indicate significance for implementers, instead of applying additional "Must Support" flags above the inherited US Core "Must Support" flags. This is consistent with US Core's use of the [USCDI Requirement Extension]({{site.data.fhir.ver.uscore}}/StructureDefinition-uscdi-requirement.html) to indicate those requirements specifically applicable to USCDI conformance.

US Quality Core profiles containing USCDI+ Quality flagged elements include a summary of those elements in their *USCDI+ Quality Element Support Expectations* section (see Figure 1 for an example). These profiles are required for conformance. Profiles without USCDI+ Quality mappings, such as [US Quality Core Claim](StructureDefinition-us-quality-core-claim.html), have no USCDI+ Quality flags and are optional. See [General Requirements](us-quality-core-general-requirements.html) for profile support expectations.

{% include img-portrait.html img="must-support-uscdi-plus-expectations.png" alt="Summary" caption="Figure 1. Summary of USCDI+ Quality Elements in a US Quality Core Profile"%}

Figure 2 illustrates how the USCDI+ Quality flag is presented in the Formal View of Profile Content, the "Key Elements Table" tab, on the US Quality Core profile pages.

{% include img-portrait.html img="must-support-formal-view-example.png" caption="Figure 2. USCDI+ Quality Flag in Formal View of Profile Content"%}

Figure 3 shows the profile's elements and identifies the profile layer where each conformance indicator is first introduced.

{% include img-portrait.html img="element-conformance-indicators-by-profile.png" caption="Figure 3. Element Conformance Indicators by Profile Layer"%}
