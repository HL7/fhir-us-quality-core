Profile: USQualityCoreEncounter
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter|9.0.0
Id: us-quality-core-encounter
Title: "US Quality Core Encounter"
Description: "Profile of Encounter for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^meta.lastUpdated = "2022-07-29T00:15:18.578000+00:00"
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Identifier(s) by which this encounter is known"
  * system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The namespace for the identifier value"
  * value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The value that is unique"
* status ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) planned | arrived | triaged | in-progress | onleave | finished | cancelled +"
  * ^definition = "planned | arrived | triaged | in-progress | onleave | finished | cancelled +."
* class 1..1 MS
* class only Coding
* class from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (extensible)
  * ^short = "Classification of patient encounter"
  * ^definition = "Concepts representing classification of patient encounter such as ambulatory (outpatient), inpatient, emergency, home health or others due to local variations."
  * ^base.path = "Encounter.class"
  * ^base.min = 1
  * ^base.max = "1"
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "EncounterClass"
  * ^binding.description = "Classification of the encounter."
* type ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Specific type of encounter"
  * ^definition = "Specific type of encounter (e.g. e-mail consultation, surgical day-care, skilled nursing, rehabilitation)."
* priority ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Indicates the urgency of the encounter"
* subject only Reference(USQualityCorePatient)
  * ^short = "The patient or group present at the encounter"
* participant ^short = "List of participants involved in the encounter"
  * individual only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreRelatedPerson)
    * ^short = "Persons involved in the encounter other than the patient"
    * ^comment = "Should include US Quality Core RelatedPerson as a possible participant, but USCore-Encounter only allows USCore-Practitioner."
* period ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) The start and end time of the encounter"
  * ^definition = "The start and end time of the encounter."
* partOf
  * ^mustSupport = false
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-encounter"
* reasonCode ^short = "Coded reason the encounter takes place"
  * ^definition = "Reason the encounter takes place, expressed as a code. For admissions, this can be used for a coded admission diagnosis."
* reasonReference 0..* SU
* reasonReference only Reference(USQualityCoreConditionProblemsHealthConcerns or USQualityCoreConditionEncounterDiagnosis or USQualityCoreProcedure or USQualityCoreSimpleObservation or USQualityCoreImmunizationRecommendation)
  * ^short = "Reason the encounter takes place (reference)"
  * ^base.path = "Encounter.reasonReference"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
* diagnosis ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) The list of diagnosis relevant to this encounter"
  * extension contains USQualityCoreDiagnosisPresentOnAdmission named diagnosisPresentOnAdmission 0..1 MS
  * extension[diagnosisPresentOnAdmission]
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) onAdmission"
    * ^definition = "Indicator of whether the Encounter diagnosis was present at the time of admission."
* hospitalization ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Details about the admission to a healthcare service"
  // SUSHI retains inherited targetProfile array entries unless each slot is overwritten.
  * origin ^mustSupport = false
  * origin ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
  * origin ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
  * destination ^mustSupport = false
  * destination ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
  * destination ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
  * dischargeDisposition from ClinicalDischargeDisposition (extensible)
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Category or kind of location after discharge"
    * ^definition = "Category or kind of location after discharge."
* location ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) List of locations where the patient has been"
  * location only Reference(USQualityCoreLocation)
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Location the encounter takes place"
  * period ^short = "Time period during which the patient was present at the location"
* serviceProvider only Reference(USQualityCoreOrganization)
  * ^short = "The organization (facility) responsible for this encounter"
