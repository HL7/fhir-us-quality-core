Profile: USQualityCoreImmunizationNotDone
Parent: USQualityCoreImmunization
Id: us-quality-core-immunizationnotdone
Title: "US Quality Core Immunization Not Done"
Description: "Negation profile of Communication for decision support/quality metrics. Indicates that the communication was not performed for a reason."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* status only code
* status = #not-done (exactly)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) not-done"
* statusReason 1..1
* statusReason from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Reason not done"
  * ^binding.description = "The reason the service was not requested"
* encounter 0..1
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter the immunization was part of"
* occurrence[x] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Vaccine administration date"
* recorded 0..1
  * ^short = "Documented date Immunization did not occur."
* location 0..1
* location only Reference(USQualityCoreLocation)
  * ^short = "Where the vaccine was administered"