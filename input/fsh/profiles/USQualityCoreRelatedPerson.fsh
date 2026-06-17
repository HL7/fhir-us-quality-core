Profile: USQualityCoreRelatedPerson
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-relatedperson|9.0.0
Id: us-quality-core-relatedperson
Title: "US Quality Core RelatedPerson"
Description: "Profile of RelatedPerson for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* active 1..
  * ^short = "Whether this related person's record is in active use"
* patient only Reference(USQualityCorePatient)
  * ^short = "The patient this person is related to"
* relationship ^extension[0].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) The nature of the relationship"
  * ^condition = "us-core-14"
* name ^extension[0].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) A name associated with the person"
  * ^condition = "us-core-14"
* telecom ^extension[0].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) A contact detail for the person"
* address ^extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/uscdi-requirement"
  * ^extension[=].valueBoolean = true
  * ^extension[+].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) Address where the related person can be contacted or visited"