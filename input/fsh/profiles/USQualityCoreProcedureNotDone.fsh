Profile: USQualityCoreProcedureNotDone
Parent: USQualityCoreProcedure
Id: us-quality-core-procedurenotdone
Title: "US Quality Core Procedure Not Done"
Description: "Negative profile of Procedure for decision support/quality metrics. Indicates that a procedure was not done for a reason."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* extension[recorded] 1..1
* extension[recorded] only $extension-Procedure.recorded
  * ^short = "When the procedure was first captured in the subject's record"
* partOf ^short = "Part of referenced event"
* status 1..1
* status only code
* status = #not-done (exactly)
  * ^short = "not-done"
* statusReason 1..1
* statusReason from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Reason for the current status"
  * ^binding.description = "The reason the procedure was not done"
* code ^short = "What procedure"
* performed[x] ^short = "When the procedure was performed"
* reasonCode ^short = "Coded reason procedure performed"
* reasonReference ^short = "The justification that the procedure was performed"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreProcedureNotDone
