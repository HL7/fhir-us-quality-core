Invariant: qim-1
Description: "To indicate what vaccine, either at least one coding in the vaccineCode element or a codeOptions extension shall be provided"
* severity = #error
* expression = "vaccineCode.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor vaccineCode.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreImmunization
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization|9.0.0
Id: us-quality-core-immunization
Title: "US Quality Core Immunization"
Description: "Profile of Immunization for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys qim-1
* . ^mustSupport = false
* status ^short = "completed | not-done | entered-in-error"
* statusReason 0..1
* statusReason from ImmunizationStatusReasonCodes (preferred)
  * ^short = "Reason for status"
* vaccineCode ^short = "Vaccine Product Type (bind to CVX)"
  * ^condition = "qim-1"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate vaccines"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the vaccine."
    * ^condition = "qim-1"
* patient only Reference(USQualityCorePatient)
  * ^short = "Who was immunized"
* encounter 0..1
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter the immunization was part of"
* occurrence[x] ^short = "Vaccine administration date"
* recorded 0..1
  * ^short = "When the immunization was first captured in the subject's record"
* primarySource ^short = "Indicates context the data was recorded in"
* location 0..1
* location only Reference(USQualityCoreLocation)
  * ^short = "Where the vaccine was administered"
* lotNumber ^short = "Vaccine lot number"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreImmunization
