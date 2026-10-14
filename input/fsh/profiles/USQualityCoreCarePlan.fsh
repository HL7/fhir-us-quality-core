Profile: USQualityCoreCarePlan
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan|9.0.0
Id: us-quality-core-careplan
Title: "US Quality Core CarePlan"
Description: "Defines constraints and extensions on the CarePlan resource for the minimal set of data to query and retrieve a patient's Care Plan."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* text ^short = "Text summary of the resource, for human interpretation"
// US Core 9 removes the assess-plan category slice: there is no distinction
// between a Care Plan and an Assessment and Plan of Treatment. Align with the
// US Core 9 parent element: 0..1, preferred binding to CarePlanCategory.
* category 0..1 SU
* category only CodeableConcept
* category from CarePlanCategory (preferred)
* subject 1..1
* subject only Reference(USQualityCorePatient)
  * ^short = "Who the care plan is for."
  * ^definition = "Who care plan is for."
  * ^requirements = "Identifies the patient or group whose intended care is described by the plan."
* addresses ^short = "Health issues this plan addresses"
* contributor ^short = "Who provided the content of the care plan"
* intent ^short = "proposal | plan | order | option"
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
// Elementdefinition-type-must-support flags on Reference target profiles.
* subject ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type[0].targetProfile[0].extension.valueBoolean = true
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreCarePlan
