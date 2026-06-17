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
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) declined"
* statusReason[x] 1..1
* statusReason[x] only CodeableConcept
* statusReason[x] from USQualityCoreNegationReasonCodes (extensible)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Why a dispense was not performed"
  * ^binding.description = "The reason the event did not occur or was not performed"