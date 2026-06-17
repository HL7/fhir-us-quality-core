Profile: USQualityCoreAllergyIntolerance
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance|9.0.0
Id: us-quality-core-allergyintolerance
Title: "US Quality Core AllergyIntolerance"
Description: "Profile of AllergyIntolerance for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^definition = "The US Quality Core AllergyIntolerance Profile is based upon the US Core AllergyIntolerance Profile which is based upon the core FHIR AllergyIntolerance Resource and created to meet the 2015 Edition Common Clinical Data Set 'Medical allergies' requirements."
  * ^mustSupport = false
* clinicalStatus ^short = "active | inactive | resolved"
  * ^definition = "The clinical status of the allergy or intolerance."
  * ^comment = "Refer to [discussion](http://hl7.org/fhir/R4/extensibility.html#Special-Case) if clincalStatus is missing data.\nThe data type is CodeableConcept because clinicalStatus has some clinical judgment involved, such that there might need to be more specificity than the required FHIR value set allows. For example, a SNOMED coding might allow for additional specificity."
* verificationStatus only CodeableConcept
  * ^short = "unconfirmed | confirmed | refuted | entered-in-error"
* type ^short = "allergy | intolerance - Underlying mechanism (if known)"
* category ^short = "food | medication | environment | biologic"
* criticality ^short = "low | high | unable-to-assess"
* code only CodeableConcept
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Code that identifies the allergy or intolerance"
  * ^alias = "Code"
* patient only Reference(USQualityCorePatient)
  * ^short = "Who the sensitivity is for"
* onset[x] only dateTime or Age or Period or Range
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) When allergy or intolerance was identified"
* recordedDate only dateTime
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Date first version of the resource instance was recorded"
* lastOccurrence ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Date(/time) of last known occurrence of a reaction"
* reaction ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Adverse Reaction Events linked to exposure to substance"
  * severity ^short = "mild | moderate | severe (of event as a whole)"