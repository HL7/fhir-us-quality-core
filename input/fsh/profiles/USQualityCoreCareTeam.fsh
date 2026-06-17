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
* participant ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Members of the team"
  * role only CodeableConcept
  * role SU
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Type of involvement"
    * ^base.path = "CareTeam.participant.role"
    * ^base.min = 0
    * ^base.max = "*"
    * ^isModifier = false
  * member only Reference(USQualityCorePatient or USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization or USQualityCoreCareTeam or USQualityCoreRelatedPerson)
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Who is involved"