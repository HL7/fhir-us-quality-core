Invariant: qma-1
Description: "To indicate what medication, either a reference to a Medication or at least one coding in the medication or a codeOptions extension shall be provided"
* severity = #error
* expression = "(medication is Reference).not() implies medication.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor medication.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreMedicationAdministration
Parent: MedicationAdministration
Id: us-quality-core-medicationadministration
Title: "US Quality Core MedicationAdministration"
Description: "Profile of MedicationAdministration for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys qma-1
* . ^mustSupport = false
* status ^short = "in-progress | not-done | on-hold | completed | entered-in-error | stopped | unknown"
* medication[x] only CodeableConcept or Reference(USQualityCoreMedication)
* medication[x] from $vsac-medication-clinical-drug (preferred)
  * ^short = "What was administered"
  * ^condition = "qma-1"
  * ^binding.description = "The set of RxNorm codes to represent medications"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate medications"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the medication."
    * ^condition = "qma-1"
* subject only Reference(USQualityCorePatient)
  * ^short = "Who received medication"
* context only Reference(USQualityCoreEncounter or EpisodeOfCare)
  * ^short = "Encounter or Episode of Care administered as part of"
* effective[x] ^short = "Start and end time of administration"
* request only Reference(USQualityCoreMedicationRequest)
  * ^short = "Request administration performed against"
* dosage ^short = "Details of how medication was taken"
  * ^definition = "Describes the medication dosage information details e.g. dose, rate, site, route, etc."
  * ^mustSupport = false
  * route from SNOMEDCTRouteCodes (preferred)
    * ^short = "Path of substance into body"
  * dose ^short = "Amount of medication per dose"
* performer.actor ^short = "Who performed the medication administration"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationAdministration
