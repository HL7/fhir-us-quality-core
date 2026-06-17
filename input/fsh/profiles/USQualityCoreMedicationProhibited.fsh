Profile: USQualityCoreMedicationProhibited
Parent: USQualityCoreMedicationRequest
Id: us-quality-core-medicationprohibited
Title: "US Quality Core Medication Prohibited"
Description: "Negation profile of MedicationRequest for decision support/quality metrics. Indicates a proposal, plan, or order not to provide a medication."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* status from USQualityCorePositiveMedicationRequestStatus (required)
  * ^short = "active | on-hold | cancelled | completed | stopped | draft"
* doNotPerform 1..1
* doNotPerform only boolean
* doNotPerform = true (exactly)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) True if medication was not requested"
* authoredOn 1..1
  * ^short = "When request was initially authored"
* reasonCode 1..1
* reasonCode from USQualityCoreNegationReasonCodes (extensible)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Reason or indication for not ordering the medication"
  * ^binding.description = "The reason the medication was prohibited"