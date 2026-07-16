{:toc}

US Quality Core derives from US Core, and therefore the [requirements on "MustSupport" defined in US Core]({{site.data.fhir.ver.uscore}}/must-support.html) must be respected.

US Quality Core adopts the QI-Core approach to flag USCDI+ Quality elements with a [US Quality Core USCDI+ Quality Extension](StructureDefinition-us-quality-core-uscdi-quality-extension.html) to indicate significance for implementers, instead of applying additional "MustSupport" flags above the inherited US Core "MustSupport" flags. This is consistent with US Core's use of the [USCDI Requirement Extension]({{site.data.fhir.ver.uscore}}/StructureDefinition-uscdi-requirement.html) to indicate those requirements specifically applicable to USCDI conformance.

Each US Quality Core profile lists a summary of USCDI+ Quality elements in their *USCDI+ Quality Elements Support Expectations* section. See Figure 1 as an example. 

{% include img-portrait.html img="must-support-uscdi-plus-expectations-section.png" caption="Figure 1. Summary of USCDI+ Quality Elements in a US Quality Core Profile"%}

Figure 2 below illustrates how the USCDI+ Quality flag is presented in the Formal View of Profile Content, the "Key Elements Table" tab, on the US Quality Core profile pages.

{% include img-portrait.html img="must-support-formal-view-example.png" caption="Figure 2. USCDI+ Quality Flag in Formal View of Profile Content"%}
