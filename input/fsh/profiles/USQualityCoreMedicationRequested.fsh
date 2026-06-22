Profile: USQualityCoreMedicationRequested
Parent: USQualityCoreMedicationRequest
Id: us-quality-core-medicationrequested
Title: "US Quality Core MedicationRequested"
Description: "Positive profile of MedicationRequest for decision support/quality metrics. Indicates that a medication was proposed, planned, or ordered."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status from USQualityCorePositiveMedicationRequestStatus (required)
  * ^short = "active | on-hold | cancelled | completed | stopped | draft"
* category 0..* MS
* category only CodeableConcept
* category from http://hl7.org/fhir/ValueSet/medicationrequest-category (example)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Type of medication usage"
  * ^base.path = "MedicationRequest.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "MedicationRequestCategory"
  * ^binding.description = "A coded concept identifying the category of medication request.  For example, where the medication is to be consumed or administered, or the type of medication treatment."
* doNotPerform 0..1
* doNotPerform only boolean
* doNotPerform = false (exactly)
  * ^short = "True if medication was not requested"

// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationRequested
