Profile: USQualityCoreFamilyMemberHistory
Parent: FamilyMemberHistory
Id: us-quality-core-familymemberhistory
Title: "US Quality Core FamilyMemberHistory"
Description: "Profile of Family Member History for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* patient only Reference(USQualityCorePatient)
  * ^short = "Patient history is about"
* date ^short = "When history was recorded or last updated"
* relationship from http://terminology.hl7.org/ValueSet/v3-FamilyMember (preferred)
  * ^short = "Relationship to the subject"
* age[x] ^short = "(approximate) age"
* deceased[x] ^short = "Dead? How old/when?"
* condition ^mustSupport = false
  * extension contains
      http://hl7.org/fhir/StructureDefinition/familymemberhistory-abatement|5.2.0 named condition-abatement 0..1 and
      http://hl7.org/fhir/StructureDefinition/familymemberhistory-severity|5.2.0 named condition-severity 0..1
  * extension[condition-abatement] ^mustSupport = false
  * extension[condition-severity] ^mustSupport = false
  * extension[condition-severity].value[x] from http://hl7.org/fhir/ValueSet/condition-severity (preferred)
    * ^binding.description = "Valueset to identify the severity of the problem"
  * code from http://hl7.org/fhir/ValueSet/condition-code (extensible)
    * ^short = "Condition suffered by relation"
    * ^binding.description = "Identification of the Condition or diagnosis."
  * onset[x] ^mustSupport = false
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreFamilyMemberHistory
