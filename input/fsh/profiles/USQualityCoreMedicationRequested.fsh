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
* authoredOn ^short = "When request was initially authored"
* dispenseRequest ^short = "Medication supply authorization"
* dispenseRequest.expectedSupplyDuration ^short = "Number of days supply per dispense"
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of refills authorized"
* dispenseRequest.quantity ^short = "Amount of medication to supply per dispense"
* dispenseRequest.validityPeriod ^short = "Time period supply is authorized for"
* dosageInstruction ^short = "How medication should be taken"
* dosageInstruction.asNeeded[x] ^short = "Take \"as needed\" (for x)"
* dosageInstruction.doseAndRate ^short = "Amount of medication administered"
* dosageInstruction.doseAndRate.dose[x] ^short = "Amount of medication per dose"
* dosageInstruction.route ^short = "How drug should enter body"
* dosageInstruction.text ^short = "Free text dosage instructions e.g. SIG"
* dosageInstruction.timing ^short = "When medication should be administered"
* dosageInstruction.timing.repeat ^short = "When the event is to occur"
* dosageInstruction.timing.repeat.bounds[x] ^short = "Length/Range of lengths, or (Start and/or end) limits"
* dosageInstruction.timing.repeat.frequency ^short = "Event occurs frequency times per period"
* dosageInstruction.timing.repeat.frequencyMax ^short = "Event occurs frequencyMax times per period"
* dosageInstruction.timing.repeat.period ^short = "Event occurs frequency times per period"
* dosageInstruction.timing.repeat.periodMax ^short = "Upper limit of period (3-4 hours)"
* dosageInstruction.timing.repeat.periodUnit ^short = "s | min | h | d | wk | mo | a - unit of time (UCUM)"
* extension[medicationAdherence] ^short = "Reported adherence to prescribed medication instructions."
* intent ^short = "proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option"
* medication[x] ^short = "Medication to be taken"
* reasonCode ^short = "Reason or indication for ordering or not ordering the medication"
* reasonReference ^short = "US Quality Core Condition or Observation that supports the prescription"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationRequested
