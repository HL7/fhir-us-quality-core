Profile: USQualityCoreAdverseEvent
Parent: AdverseEvent
Id: us-quality-core-adverseevent
Title: "US Quality Core AdverseEvent"
Description: "Actual or potential/avoided event causing unintended physical injury resulting from or contributed to by medical care, a research study or other healthcare setting factors that requires additional monitoring, treatment, or hospitalization, or that results in death."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* actuality ^short = "actual | potential"
* category ^short = "product-problem | product-quality | product-use-error | wrong-dose | incorrect-prescribing-information | wrong-technique | wrong-route-of-administration | wrong-rate | wrong-duration | wrong-time | expired-drug | medical-device-use-error | problem-different-manufacturer | unsafe-physical-environment"
* event 1..1
* event from http://hl7.org/fhir/ValueSet/adverse-event-type (preferred)
  * ^short = "Type of the event itself in relation to the subject"
  * ^binding.description = "Detailed type of event."
* subject only Reference(USQualityCorePatient)
  * ^short = "Subject impacted by event"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter created as part of"
* date ^short = "When the event occurred"
  * ^mustSupport = false
* detected ^short = "When the event was detected"
* recordedDate ^short = "When the event was recorded"
* resultingCondition only Reference(USQualityCoreConditionProblemsHealthConcerns or USQualityCoreConditionEncounterDiagnosis)
  * ^short = "Effect on the subject due to this event"
* location only Reference(USQualityCoreLocation)
  * ^mustSupport = false
* seriousness ^short = "Seriousness of the event"
* severity 0..1
* severity from AdverseEventSeverity (required)
  * ^short = "mild | moderate | severe"
  * ^binding.description = "The severity of the adverse event itself, in direct relation to the subject."
* outcome from http://hl7.org/fhir/ValueSet/adverse-event-outcome|4.0.1 (required)
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "AdverseEventOutcome"
  * ^binding.description = "Type of outcome from the adverse event"
* recorder only Reference(USQualityCorePatient or USQualityCoreRelatedPerson or USQualityCorePractitioner or USQualityCorePractitionerRole)
  * ^mustSupport = false
* contributor only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0)
  * ^mustSupport = false
* suspectEntity ^mustSupport = false
  * instance only Reference(USQualityCoreImmunization or USQualityCoreProcedure or USQualityCoreSubstance or USQualityCoreMedication or USQualityCoreMedicationAdministration or MedicationStatement or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0)
    * ^short = "Refers to the specific entity that caused the adverse event"
  * causality ^mustSupport = false
* subjectMedicalHistory only Reference(USQualityCoreSimpleObservation or USQualityCoreAllergyIntolerance or USQualityCoreFamilyMemberHistory or USQualityCoreImmunization or USQualityCoreProcedure or USQualityCoreConditionProblemsHealthConcerns or USQualityCoreConditionEncounterDiagnosis)
  * ^mustSupport = false
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreAdverseEvent
