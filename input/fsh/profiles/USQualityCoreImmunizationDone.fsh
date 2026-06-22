Profile: USQualityCoreImmunizationDone
Parent: USQualityCoreImmunization
Id: us-quality-core-immunizationdone
Title: "US Quality Core Immunization Done"
Description: "Positive profile of Immunization for decision support/quality metrics. Indicates that the immunization is being or was performed (as opposed to the not done profile)."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* id ^mustSupport = false
* status = #completed (exactly)
  * ^short = "completed"

// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreImmunizationDone
