Profile: USQualityCoreFlag
Parent: Flag
Id: us-quality-core-flag
Title: "US Quality Core Flag"
Description: "Profile of Flag for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status ^short = "active | inactive | entered-in-error"
* category from FlagCategory (preferred)
  * ^short = "Clinical, administrative, etc."
* code from FlagCode (preferred)
  * ^short = "Coded or textual message to display to user"
* subject only Reference(USQualityCorePatient or USQualityCoreLocation or Group or USQualityCoreOrganization or USQualityCorePractitioner)
  * ^short = "Who/What is flag about?"
* period ^short = "Time period when flag is active"