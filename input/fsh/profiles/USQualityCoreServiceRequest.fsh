Invariant: srq-1
Description: "To indicate what service, either at least one coding in the code or a codeOptions extension shall be provided"
* severity = #error
* expression = "code.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor code.coding.exists()"

Profile: USQualityCoreServiceRequest
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest|9.0.0
Id: us-quality-core-servicerequest
Title: "US Quality Core ServiceRequest"
Description: "Profile of ServiceRequest for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys srq-1
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* doNotPerform 0..1
* doNotPerform only boolean
  * ^short = "True if service/procedure should not be performed"
* code ^short = "What is being requested/ordered"
  * ^condition = "srq-1"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate services"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the service."
    * ^condition = "srq-1"
* subject only Reference(USQualityCorePatient)
  * ^short = "Individual or Entity the service is ordered for"
* encounter only Reference(USQualityCoreEncounter)
* occurrence[x] only dateTime or Period or Timing
  * ^short = "When service should occur"
* authoredOn 0..1
  * ^short = "Date request signed"
* requester only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization or USQualityCorePatient or USQualityCoreRelatedPerson or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0)
* reasonCode ^short = "Explanation/Justification for procedure or service"
* reasonReference 0..*
  * ^short = "Explanation/Justification for service or service"
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-encounter-diagnosis"
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-problems-health-concerns"
  * ^type[0].targetProfile[2] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-diagnosticreport-note"
  * ^type[0].targetProfile[3] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference|9.0.0"
  * ^type[0].targetProfile[4] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-simple-observation"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreServiceRequest
