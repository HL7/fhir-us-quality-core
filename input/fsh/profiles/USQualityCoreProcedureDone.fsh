Profile: USQualityCoreProcedureDone
Parent: USQualityCoreProcedure
Id: us-quality-core-proceduredone
Title: "US Quality Core Procedure Done"
Description: "Positive profile of Procedure for decision support/quality metrics. Indicates that a procedure is being or was performed."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status from USQualityCorePositiveEventStatus (required)
  * ^short = "preparation | in-progress | on-hold | stopped | completed"
* code ^short = "What procedure"
* extension[recorded] ^short = "When the procedure was first captured in the subject's record"
* partOf ^short = "Part of referenced event"
* performed[x] ^short = "When the procedure was performed"
* reasonCode ^short = "Coded reason procedure performed"
* reasonReference ^short = "The justification that the procedure was performed"
* statusReason ^short = "Reason for current status"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreProcedureDone
