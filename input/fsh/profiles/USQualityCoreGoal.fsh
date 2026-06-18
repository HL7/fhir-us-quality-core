Profile: USQualityCoreGoal
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-goal|9.0.0
Id: us-quality-core-goal
Title: "US Quality Core Goal"
Description: "Profile of Goal for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* description ^short = "Code or text describing goal"
* subject 1..1
* subject only Reference(USQualityCorePatient)
  * ^short = "Who this goal is intended for"
  * ^comment = "Should include US Quality Core Organization, but the base profile only allows USCore-Patient derivatives."
* start[x] 0..1 SU
* start[x] only date or CodeableConcept
* start[x] from GoalStartEvent (preferred)
  * ^short = "When goal pursuit begins"
  * ^definition = "The date or event after which the goal should begin being pursued."
  * ^requirements = "Goals can be established prior to there being an intention to start pursuing them; e.g. Goals for post-surgical recovery established prior to surgery."
  * ^base.path = "Goal.start[x]"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "GoalStartEvent"
  * ^binding.description = "Codes describing events that can trigger the initiation of a goal."
* target ^short = "Target outcome for the goal"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreGoal
