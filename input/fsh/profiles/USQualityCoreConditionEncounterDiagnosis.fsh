Profile: USQualityCoreConditionEncounterDiagnosis
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis|9.0.0
Id: us-quality-core-condition-encounter-diagnosis
Title: "US Quality Core Condition Encounter Diagnosis"
Description: "The US Quality Core Condition Encounter Diagnosis Profile is based upon the US Core Condition Encounter Diagnosis Profile.   In version 5.0.0, the US Quality Core Condition Profile has been split into the US Quality Core Condition Encounter Diagnosis Profile and US Quality Core Condition Problems and Health Concerns Profile. To promote interoperability and adoption through consistent implementation, this profile defines constraints and extensions on the Condition resource for the minimal set of data to record, search, and retrieve information about an encounter diagnosis.  It defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* extension contains http://hl7.org/fhir/StructureDefinition/condition-assertedDate|5.3.0 named assertedDate 0..1 MS
* extension[assertedDate] ^short = "Date the condition was first asserted"
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
* severity ^short = "Subjective severity of condition"
  * ^definition = "A subjective assessment of the severity of the condition as evaluated by the clinician."
* code ^short = "Identification of the condition, problem or diagnosis"
  * ^definition = "Identification of the condition, problem or diagnosis."
* subject only Reference(USQualityCorePatient or Group)
* subject MS SU
  * ^short = "Who has the condition?"
  * ^isModifier = false
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter created as part of"
* onset[x] only dateTime or Age or Period or Range
  * ^short = "Estimated or actual date, date-time, or age"
* abatement[x] only dateTime or Age or Period or Range
  * ^short = "When in resolution/remission"
* recordedDate ^short = "Date record was first recorded"
  * ^definition = "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date."
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreConditionEncounterDiagnosis
