Profile: USQualityCoreMedicationDispenseDeclined
Parent: USQualityCoreMedicationDispense
Id: us-quality-core-medicationdispensedeclined
Title: "US Quality Core MedicationDispense Declined"
Description: "Negation profile of MedicationDispense for decision support/quality metrics. Indicates that a medication dispense was declined for a reason."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* extension[recorded] 1..1
* extension[recorded] only $extension-MedicationDispense.recorded
  * ^short = "Extension"
* status only code
* status = #declined (exactly)
  * ^short = "declined"
* statusReason[x] 1..1
* statusReason[x] only CodeableConcept
* statusReason[x] from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Why a dispense was not performed"
  * ^binding.description = "The reason the event did not occur or was not performed"
* medication[x] ^short = "What medication was supplied"
* medication[x].extension[codeOptions] ^short = "Url of a value set of candidate medications"
* whenPrepared ^short = "When product was packaged and reviewed"
* performer.actor ^short = "Individual who was performing"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationDispenseDeclined
