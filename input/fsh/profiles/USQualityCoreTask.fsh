Invariant: tsk-1
Description: "to indicate what, either at least one coding in the code or a codeOptions extension shall be provided"
* severity = #error
* expression = "code.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor code.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreTask
Parent: Task
Id: us-quality-core-task
Title: "US Quality Core Task"
Description: "Profile of Task for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys tsk-1
* . ^mustSupport = false
* basedOn ^short = "Request fulfilled by this task"
* status ^short = "draft | requested | received | accepted | rejected | ready | cancelled | in-progress | on-hold | failed | completed | entered-in-error"
* statusReason ^short = "Reason for current status"
* intent ^short = "unknown | proposal | plan | order | original-order | reflex-order | filler-order | instance"
* priority 1..1
  * ^short = "routine | urgent | asap | stat"
* code 1..1
* code from TaskCode (preferred)
  * ^short = "Task Type"
  * ^condition = "tsk-1"
  * ^binding.description = "Codes to identify what the task involves. These will typically be specific to a particular workflow"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate tasks"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the task."
    * ^condition = "tsk-1"
* focus 0..1
* focus only Reference(Resource)
  * ^short = "What task is acting on"
  * ^mustSupport = false
* for only Reference(USQualityCorePatient)
  * ^short = "Beneficiary of the Task"
  * ^mustSupport = false
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Healthcare event during which this task originated"
  * ^mustSupport = false
* executionPeriod 1..1
  * ^short = "Start and end time of execution"
  * ^mustSupport = false
* reasonCode ^mustSupport = false
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreTask
