Profile: USQualityCoreTaskRejected
Parent: Task
Id: us-quality-core-taskrejected
Title: "US Quality Core Task Rejected"
Description: "Profile of TaskRejected for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* basedOn ^short = "Request fulfilled by this task"
* status 1..1
* status only code
* status = #rejected (exactly)
  * ^short = "The potential performer who claimed ownership of the task has decided not to execute it prior to performing any action"
* statusReason 1..1
* statusReason from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Reason for current status"
  * ^mustSupport = false
* code ^short = "Task Type"
* focus only Reference(Resource)
  * ^short = "What task is acting on"
  * ^mustSupport = false
* for only Reference(USQualityCorePatient)
  * ^short = "Beneficiary of the Task"
  * ^mustSupport = false
* executionPeriod 1..1
  * ^short = "The time action first taken meets expectation of the rejected use case."
* reasonCode ^short = "Why task is needed"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreTaskRejected
