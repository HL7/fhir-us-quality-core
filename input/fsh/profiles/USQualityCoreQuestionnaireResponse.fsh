Profile: USQualityCoreQuestionnaireResponse
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-questionnaireresponse|9.0.0
Id: us-quality-core-questionnaireresponse
Title: "US Quality Core QuestionnaireResponse"
Description: "The US Quality Core QuestionnaireResponse Profile is based upon the US Core QuestionnaireResponse Profile and sets minimum expectations for the QuestionnaireResponse resource to record, search, and fetch retrieve captures the responses to form/survey and defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* questionnaire 1..1
  * ^short = "Form being answered"
* subject 1..
* subject only Reference(USQualityCorePatient)
  * ^short = "The subject of the questions"
  * ^comment = "-"
* author only Reference(USQualityCorePractitioner or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitionerRole or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreRelatedPerson)
  * ^short = "Person who received and recorded the answers"
* item ^short = "Groups and questions"
  * linkId ^short = "Pointer to specific item from Questionnaire"
  * answer.value[x] 0..1
  * answer.value[x] only Coding or string or decimal or date or dateTime or integer or Quantity
    * ^short = "Single-valued answer to the question"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreQuestionnaireResponse
