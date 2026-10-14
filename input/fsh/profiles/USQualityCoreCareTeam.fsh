Profile: USQualityCoreCareTeam
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-careteam|9.0.0
Id: us-quality-core-careteam
Title: "US Quality Core CareTeam"
Description: "Profile of CareTeam for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* subject only Reference(USQualityCorePatient)
  * ^short = "Who the care team is for."
* participant ^short = "Members of the team"
  * role only CodeableConcept
  * role SU
    * ^short = "Type of involvement"
    * ^base.path = "CareTeam.participant.role"
    * ^base.min = 0
    * ^base.max = "*"
    * ^isModifier = false
  * member only Reference(USQualityCorePatient or USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization or USQualityCoreCareTeam or USQualityCoreRelatedPerson)
    * ^short = "Who is involved"
// Elementdefinition-type-must-support flags on Reference target profiles.
* subject ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type[0].targetProfile[0].extension.valueBoolean = true
* participant.member ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[0].extension.valueBoolean = false
* participant.member ^type[0].targetProfile[1].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[1].extension.valueBoolean = true
* participant.member ^type[0].targetProfile[2].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[2].extension.valueBoolean = true
* participant.member ^type[0].targetProfile[3].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[3].extension.valueBoolean = false
* participant.member ^type[0].targetProfile[4].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[4].extension.valueBoolean = false
* participant.member ^type[0].targetProfile[5].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* participant.member ^type[0].targetProfile[5].extension.valueBoolean = true
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreCareTeam
