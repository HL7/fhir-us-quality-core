Invariant: mdp-1
Description: "To indicate what medication, either a reference to a Medication, or at least one coding in the medication or a codeOptions extension shall be provided"
* severity = #error
* expression = "(medication is Reference).not() implies medication.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor medication.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreMedicationDispense
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationdispense|9.0.0
Id: us-quality-core-medicationdispense
Title: "US Quality Core MedicationDispense"
Description: "Profile of MedicationDispense for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys mdp-1
* extension contains $extension-MedicationDispense.recorded named recorded 0..1
* extension[recorded] ^short = "When recorded"
* status ^short = "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown"
* medication[x] only CodeableConcept or Reference(USQualityCoreMedication)
* medication[x] from $vsac-medication-clinical-drug (extensible)
  * ^short = "What medication was supplied"
  * ^binding.description = "The set of RxNorm codes to represent medications"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate medications"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the medication."
* subject only Reference(USQualityCorePatient)
  * ^short = "Who the dispense is for"
* authorizingPrescription only Reference(USQualityCoreMedicationRequest)
  * ^short = "Medication order that authorizes the dispense"
* type from http://terminology.hl7.org/ValueSet/v3-ActPharmacySupplyType (extensible)
  * ^short = "Trial fill, partial fill, emergency fill, etc."
* quantity ^short = "Amount dispensed"
* daysSupply ^short = "Amount of medication expressed as a timing amount"
* whenPrepared 0..1
  * ^short = "When product was packaged and reviewed"
  * ^comment = "When used as part of a cumulative medication duration calculation, the whenPrepared element is used if whenHandedOver is not available to determine a starting point for the period covered by the dispense."
* whenHandedOver ^short = "When product was given out or mailed"
* dosageInstruction ^short = "How the medication is to be used by the patient or administered by the caregiver"
  * text ^short = "Free text dosage instructions e.g. SIG"
  * timing ^short = "When medication should be administered"
  * route ^short = "How drug should enter body"
  * doseAndRate ^short = "Amount of medication administered"
    * dose[x] only SimpleQuantity or Range
      * ^short = "Amount of medication per dose"
      * ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
      * ^type.extension.valueBoolean = true
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationDispense
