Profile: USQualityCoreBodyStructure
Parent: BodyStructure
Id: us-quality-core-bodystructure
Title: "US Quality Core BodyStructure"
Description: "Profile of BodyStructure for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* active 1..1
  * ^short = "Whether this record is in active use"
* location 1..1
* location from SNOMEDCTBodyStructures (preferred)
  * ^short = "Body site"
* locationQualifier from BodystructureLocationQualifier (preferred)
  * ^short = "Body site modifier"
  * ^binding.description = "Concepts modifying the anatomic location"
* patient only Reference(USQualityCorePatient)
  * ^short = "Who this is about"