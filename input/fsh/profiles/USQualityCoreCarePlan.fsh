Profile: USQualityCoreCarePlan
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan|9.0.0
Id: us-quality-core-careplan
Title: "US Quality Core CarePlan"
Description: "The US Quality Core CarePlan is based upon the US Core CarePlan Profile which is based upon the core FHIR CarePlan Resource and created to meet the 2015 Edition Common Clinical Data Set 'Assessment and Plan of Treatment requirements. Defines constraints and extensions on the CarePlan resource for the minimal set of data to query and retrieve a patient's Care Plan."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* text ^short = "Text summary of the resource, for human interpretation"
* category ..* SU
* category only CodeableConcept
* category from CarePlanCategory (preferred)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Type of plan"
  * ^definition = "Type of plan."
  * ^comment = "There may be multiple axes of categorization and one plan may serve multiple purposes.  In some cases, this may be redundant with references to CarePlan.concern."
  * ^requirements = "Identifies what \"kind\" of plan this is to support differentiation between multiple co-existing plans; e.g. \"Home health\", \"psychiatric\", \"asthma\", \"disease management\", \"wellness plan\", etc."
  * ^base.path = "CarePlan.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "CarePlanCategory"
  * ^binding.description = "Identifies what \"kind\" of plan this is to support differentiation between multiple co-existing plans; e.g. \"Home health\", \"psychiatric\", \"asthma\", \"disease management\", etc."
* category contains AssessPlan 1..1 SU
* category[AssessPlan] only CodeableConcept
* category[AssessPlan] = USCoreCarePlanCategoryExtensionCodes#assess-plan
* category[AssessPlan] from CarePlanCategory (preferred)
  * ^short = "Type of plan"
  * ^definition = "Type of plan."
  * ^comment = "There may be multiple axes of categorization and one plan may serve multiple purposes.  In some cases, this may be redundant with references to CarePlan.concern."
  * ^requirements = "Identifies what \"kind\" of plan this is to support differentiation between multiple co-existing plans; e.g. \"Home health\", \"psychiatric\", \"asthma\", \"disease management\", \"wellness plan\", etc."
  * ^base.path = "CarePlan.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "CarePlanCategory"
  * ^binding.description = "Identifies what \"kind\" of plan this is to support differentiation between multiple co-existing plans; e.g. \"Home health\", \"psychiatric\", \"asthma\", \"disease management\", etc."
* subject 1..1
* subject only Reference(USQualityCorePatient)
  * ^short = "Who the care plan is for."
  * ^definition = "Who care plan is for."
  * ^requirements = "Identifies the patient or group whose intended care is described by the plan."
* addresses ^short = "Health issues this plan addresses"
* contributor ^short = "Who provided the content of the care plan"
* intent ^short = "proposal | plan | order | option"
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreCarePlan
