Profile: USQualityCoreMedication
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication|9.0.0
Id: us-quality-core-medication
Title: "US Quality Core Medication"
Description: "Profile of Medication for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* code ^short = "Codes that identify this medication"
* manufacturer
  * ^mustSupport = false
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-organization"
* ingredient
  * item[x] ^mustSupport = false
  * item[x] ^type[1].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-substance"
  * item[x] ^type[1].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medication"
  * isActive 0..1
  * isActive only boolean
    * ^mustSupport = false
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedication
