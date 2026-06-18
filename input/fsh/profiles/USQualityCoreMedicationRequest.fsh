Invariant: mrq-1
Description: "To indicate what medication, either a reference to a Medication, or either at least one coding in the medication or a codeOperations extension shall be provided"
* severity = #error
* expression = "(medication is Reference).not() implies medication.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor medication.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreMedicationRequest
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|9.0.0
Id: us-quality-core-medicationrequest
Title: "US Quality Core MedicationRequest"
Description: "Profile of MedicationRequest for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys mrq-1
* . ^short = "Ordering of medication for patient or group"
* extension[medicationAdherence] 0..*
* extension[medicationAdherence] ^short = "Reported adherence to prescribed medication instructions."
* extension[medicationAdherence] ^mustSupport = false
* extension[medicationAdherence] ^type[0].profile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication-adherence|9.0.0"
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown"
* intent ^short = "proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option"
* doNotPerform 0..1
* doNotPerform only boolean
  * ^short = "True if the order is not to provide the medication"
* reported[x] only boolean or Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCorePatient or USQualityCoreRelatedPerson)
* reported[x] MS
  * ^short = "Reported rather than primary record"
* medication[x] from $vsac-medication-clinical-drug (extensible)
  * ^binding.strength = #preferred
  * ^short = "Medication to be taken"
  * ^condition = "mrq-1"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate medications"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the medication."
    * ^condition = "mrq-1"
* subject only Reference(USQualityCorePatient)
  * ^short = "Who or group medication request is for"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter created as part of encounter/admission/stay"
* authoredOn 0..1
  * ^short = "When request was initially authored"
* requester only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCorePatient)
  * ^short = "Who/What requested the Request"
  * ^comment = "Should include USQualityCoreDevice but the base profile excludes device references."
* reasonCode ^short = "Reason or indication for ordering or not ordering the medication"
* reasonReference 0..*
  * ^short = "US Quality Core Condition or Observation that supports the prescription"
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-encounter-diagnosis"
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-problems-health-concerns"
  * ^type[0].targetProfile[2] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-simple-observation"
* dosageInstruction ^short = "How medication should be taken"
  * text ^short = "Free text dosage instructions e.g. SIG"
  * timing ^short = "When medication should be administered"
    * repeat ^short = "When the event is to occur"
      * bounds[x] ^short = "Length/Range of lengths, or (Start and/or end) limits"
      * frequency ^short = "Event occurs frequency times per period"
      * frequencyMax ^short = "Event occurs frequencyMax times per period"
      * period ^short = "Event occurs frequency times per period"
      * periodMax ^short = "Upper limit of period (3-4 hours)"
      * periodUnit ^short = "s | min | h | d | wk | mo | a - unit of time (UCUM)"
  * asNeeded[x] ^short = "Take \"as needed\" (for x)"
  * route ^short = "How drug should enter body"
  * doseAndRate ^short = "Amount of medication administered"
    * dose[x] ^short = "Amount of medication per dose"
* dispenseRequest ^short = "Medication supply authorization"
  * initialFill 0..0
  * dispenseInterval ^short = "Minimum period of time between dispenses"
  * validityPeriod ^short = "Time period supply is authorized for"
  * numberOfRepeatsAllowed ^short = "Number of refills authorized"
  * quantity ^short = "Amount of medication to supply per dispense"
  * expectedSupplyDuration ^short = "Number of days supply per dispense"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationRequest
