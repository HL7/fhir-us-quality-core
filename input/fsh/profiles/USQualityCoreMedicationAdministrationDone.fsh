Profile: USQualityCoreMedicationAdministrationDone
Parent: USQualityCoreMedicationAdministration
Id: us-quality-core-medicationadministrationdone
Title: "US Quality Core MedicationAdministration Done"
Description: "Positive profile of MedicationAdministration for decision support/quality metrics. Indicates that a medication administration is being or was performed (as opposed to the negative profile)"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status from USQualityCorePositiveMedicationAdministrationStatus (required)
  * ^short = "in-progress | on-hold | completed | stopped"

// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationAdministrationDone
