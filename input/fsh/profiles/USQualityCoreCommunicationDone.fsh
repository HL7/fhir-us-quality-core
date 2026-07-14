Profile: USQualityCoreCommunicationDone
Parent: USQualityCoreCommunication
Id: us-quality-core-communicationdone
Title: "US Quality Core CommunicationDone"
Description: "Positive profile of Communication for decision support/quality metrics. Indicates that the communication was performed (as opposed to the not done profile)."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* status from USQualityCorePositiveEventStatus (required)
  * ^short = "preparation | in-progress | on-hold | stopped | completed"
* category ^short = "Message category"
* sent ^short = "When sent"
* subject ^short = "Focus of message"
* topic ^short = "Description of the purpose/content"
* topic.extension[codeOptions] ^short = "Url of a value set of candidate topics"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreCommunicationDone
