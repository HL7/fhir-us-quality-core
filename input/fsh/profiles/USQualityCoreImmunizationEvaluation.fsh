Profile: USQualityCoreImmunizationEvaluation
Parent: ImmunizationEvaluation
Id: us-quality-core-immunizationevaluation
Title: "US Quality Core ImmunizationEvaluation"
Description: "Defines constraints and extensions on the ImmunizationEvaluation resource for the minimal set of data to query and retrieve a patient's Immunization Evaluation."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* identifier only Identifier
  * ^short = "Business identifier"
* status ^short = "completed | entered-in-error"
* patient only Reference(USQualityCorePatient)
  * ^short = "Who this evaluation is for"
* date 1..1
  * ^short = "Date evaluation was performed"
* authority only Reference(USQualityCoreOrganization)
  * ^mustSupport = false
* targetDisease 1..1
* targetDisease from ImmunizationEvaluationTargetDiseaseCodes (preferred)
  * ^short = "Evaluation target disease"
* immunizationEvent 1..1
* immunizationEvent only Reference(USQualityCoreImmunization)
  * ^short = "Immunization being evaluated"
* doseStatus 1..1
* doseStatus from ImmunizationEvaluationDoseStatusCodes (preferred)
  * ^short = "Status of the dose relative to published recommendations"
* doseStatusReason from ImmunizationEvaluationDoseStatusCodes (preferred)
  * ^short = "Reason for the dose status"