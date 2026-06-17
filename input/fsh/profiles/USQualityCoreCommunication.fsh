Invariant: com-1
Description: "to indicate what communication, either at least one coding in the topic or a codeOptions extension shall be provided"
* severity = #error
* expression = "topic.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor (topic.coding.exists() or topic.text.exists())"

Profile: USQualityCoreCommunication
Parent: Communication
Id: us-quality-core-communication
Title: "US Quality Core Communication"
Description: "Profile of Communication for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys com-1
* . ^mustSupport = false
* status ^short = "preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown"
* subject only Reference(USQualityCorePatient or Group)
  * ^short = "Focus of message"
* topic from http://terminology.hl7.org/ValueSet/communication-topic|1.0.0 (preferred)
  * ^short = "Description of the purpose/content"
  * ^condition = "com-1"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate topics"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the purpose or content of the communication."
    * ^condition = "com-1"
* sent ^short = "When sent"
* received ^short = "When received"
* recipient only Reference(USQualityCoreCareTeam or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitioner or USQualityCoreRelatedPerson or Group)
  * ^short = "Message recipient"
* sender only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitioner or USQualityCoreRelatedPerson)
  * ^short = "Message sender"
