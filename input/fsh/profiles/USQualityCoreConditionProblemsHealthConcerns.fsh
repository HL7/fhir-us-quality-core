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
* extension[assertedDate] only http://hl7.org/fhir/StructureDefinition/condition-assertedDate|5.2.0
  * ^short = "Date the condition was first asserted"
  * ^definition = "The date on which the existence of the Condition was first asserted or acknowledged."
  * ^comment = "The assertedDate is in the context of the recording practitioner and might not be the same as the recordedDate."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
* clinicalStatus ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) active | recurrence | relapse | inactive | remission | resolved"
  * ^definition = "The clinical status of the condition."
  * ^comment = "The data type is CodeableConcept because clinicalStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity."
* verificationStatus ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"
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
* category[us-core] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) problem-list-item | health-concern"
* severity ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Subjective severity of condition"
  * ^definition = "A subjective assessment of the severity of the condition as evaluated by the clinician."
  * ^comment = "Coding of the severity with a terminology is preferred, where possible."
* code ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Identification of the condition, problem or diagnosis"
  * ^definition = "Identification of the condition, problem or diagnosis."
* subject only Reference(USQualityCorePatient or Group)
  * ^short = "Who has the condition?"
* onset[x] only dateTime or Age or Period or Range
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Estimated or actual date, date-time, or age"
* abatement[x] only dateTime or Age or Period or Range
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) When in resolution/remission"
* recordedDate ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Date record was first recorded"
  * ^definition = "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date."
