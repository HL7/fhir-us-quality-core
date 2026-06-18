Invariant: prc-1
Description: "to indicate what procedure, either at least one coding in the code or a codeOptions extension shall be provided"
* severity = #error
* expression = "code.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor code.coding.exists()"

Profile: USQualityCoreProcedure
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure|9.0.0
Id: us-quality-core-procedure
Title: "US Quality Core Procedure"
Description: "Profile of Procedure for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys prc-1
* . ^mustSupport = false
* implicitRules ^short = "A set of rules under which this content was created"
* extension contains $extension-Procedure.recorded named recorded 1..1
* extension[recorded] ^short = "When the procedure was first captured in the subject's record"
* basedOn 0..*
* basedOn only Reference(USQualityCoreCarePlan or USQualityCoreServiceRequest)
  * ^short = "A request for this procedure"
  * ^mustSupport = false
* partOf ^short = "Part of referenced event"
* status ^short = "preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown"
* statusReason ^short = "Reason for current status"
* code ^short = "What procedure"
  * ^condition = "prc-1"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate procedures"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the procedure."
    * ^condition = "prc-1"
* subject only Reference(USQualityCorePatient)
  * ^short = "Who the procedure was performed on"
* performed[x] ^short = "When the procedure was performed"
* performer.actor only Reference(USQualityCorePractitioner or USQualityCoreOrganization or USQualityCorePatient or USQualityCoreRelatedPerson)
  * ^mustSupport = false
* reasonCode ^short = "Coded reason procedure performed"
// SUSHI retains inherited targetProfile array entries unless each slot is overwritten.
* reasonReference
  * ^short = "The justification that the procedure was performed"
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-encounter-diagnosis"
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-problems-health-concerns"
  * ^type[0].targetProfile[2] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-diagnosticreport-note"
  * ^type[0].targetProfile[3] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference|9.0.0"
  * ^type[0].targetProfile[4] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference|9.0.0"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreProcedure
