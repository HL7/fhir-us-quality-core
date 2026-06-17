Profile: USQualityCoreCommunicationRequest
Parent: CommunicationRequest
Id: us-quality-core-communicationrequest
Title: "US Quality Core CommunicationRequest"
Description: "Profile of CommunicationRequest for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* category from CommunicationCategory (preferred)
  * ^short = "Message category"
* doNotPerform ^short = "True if request is prohibiting action"
* subject only Reference(USQualityCorePatient)
  * ^short = "Focus of message"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter created as part of"
* recipient only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitioner or USQualityCoreRelatedPerson or Group or USQualityCoreCareTeam)
  * ^short = "Message recipient"
* sender only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitioner or USQualityCoreRelatedPerson)
  * ^short = "Message sender"