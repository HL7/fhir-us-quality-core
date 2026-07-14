Profile: USQualityCoreConditionProblemsHealthConcerns
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns|9.0.0
Id: us-quality-core-condition-problems-health-concerns
Title: "US Quality Core Condition Problems Health Concerns"
Description: "Profile of Condition for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^definition = "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern."
  * ^mustSupport = false
* meta MS
  * lastUpdated MS
    * ^short = "When the resource last changed"
* extension[assertedDate] 0..1 MS
* extension[assertedDate] only http://hl7.org/fhir/StructureDefinition/condition-assertedDate|5.3.0
  * ^short = "Date the condition was first asserted"
  * ^definition = "The date on which the existence of the Condition was first asserted or acknowledged."
  * ^comment = "The assertedDate is in the context of the recording practitioner and might not be the same as the recordedDate."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
* clinicalStatus ^short = "active | recurrence | relapse | inactive | remission | resolved"
  * ^definition = "The clinical status of the condition."
  * ^comment = "The data type is CodeableConcept because clinicalStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity."
* verificationStatus ^short = "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"
  * ^definition = "The verification status to support the clinical status of the condition."
* category 1..* MS
* category only CodeableConcept
* category from ConditionCategoryCodes (extensible)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "category codes"
  * ^base.path = "Condition.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ConditionCategory"
  * ^binding.description = "A category assigned to the condition."
* category[us-core] ^short = "problem-list-item | health-concern"
* category[screening-assessment] MS
* severity ^short = "Subjective severity of condition"
  * ^definition = "A subjective assessment of the severity of the condition as evaluated by the clinician."
  * ^comment = "Coding of the severity with a terminology is preferred, where possible."
* code ^short = "Identification of the condition, problem or diagnosis"
  * ^definition = "Identification of the condition, problem or diagnosis."
* subject only Reference(USQualityCorePatient or Group)
  * ^short = "Who has the condition?"
  // Restore the must-support flag on the Patient target profile. US Core marks it true, but the `only` rule above drops it (leaving a null _targetProfile entry) when us-core-patient is replaced by us-quality-core-patient.
  * ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
  * ^type[0].targetProfile[0].extension.valueBoolean = true
* onset[x] only dateTime or Age or Period or Range
  * ^short = "Estimated or actual date, date-time, or age"
* abatement[x] only dateTime or Age or Period or Range
  * ^short = "When in resolution/remission"
* recordedDate ^short = "Date record was first recorded"
  * ^definition = "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date."
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreConditionProblemsHealthConcerns
