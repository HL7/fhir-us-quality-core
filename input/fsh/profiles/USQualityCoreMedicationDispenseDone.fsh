Profile: USQualityCoreMedicationDispenseDone
Parent: USQualityCoreMedicationDispense
Id: us-quality-core-medicationdispensedone
Title: "US Quality Core MedicationDispense Done"
Description: "Positive profile of MedicationDispense for decision support/quality metrics. Indicates that a medication is being or was dispensed"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status from USQualityCorePositiveMedicationDispenseStatus (required)
  * ^short = "preparation | in-progress | on-hold | completed | stopped"
* daysSupply ^short = "Amount of medication expressed as a timing amount"
* dosageInstruction ^short = "How the medication is to be used by the patient or administered by the caregiver"
* dosageInstruction.doseAndRate ^short = "Amount of medication administered"
* dosageInstruction.doseAndRate.dose[x] ^short = "Amount of medication per dose"
* dosageInstruction.route ^short = "How drug should enter body"
* dosageInstruction.text ^short = "Free text dosage instructions e.g. SIG"
* dosageInstruction.timing ^short = "When medication should be administered"
* medication[x] ^short = "What medication was supplied"
* quantity ^short = "Amount dispensed"
* whenPrepared ^short = "When product was packaged and reviewed"
* performer.actor ^short = "Individual who was performing"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationDispenseDone
