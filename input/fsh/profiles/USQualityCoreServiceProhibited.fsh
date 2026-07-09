Profile: USQualityCoreServiceProhibited
Parent: USQualityCoreServiceRequest
Id: us-quality-core-serviceprohibited
Title: "US Quality Core Service Prohibited"
Description: "Negation profile of ServiceRequest for decision support/quality metrics. Indicates a request not to provide a service"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* status from USQualityCorePositiveRequestStatus (required)
  * ^short = "draft | active | on-hold | completed"
* doNotPerform 1..1
* doNotPerform only boolean
* doNotPerform = true (exactly)
  * ^short = "True if service/procedure should not be performed"
* code ^short = "What is being requested/ordered"
* authoredOn 1..1
  * ^short = "Date request signed"
* reasonCode only CodeableConcept
* reasonCode from http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code (extensible)
  * ^short = "Explanation/Justification for procedure or service"
  * ^binding.extension.extension[0].url = "purpose"
  * ^binding.extension.extension[=].valueCode = #extensible
  * ^binding.extension.extension[+].url = "valueSet"
  * ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/quality-core/ValueSet/us-quality-core-negation-reason-codes"
  * ^binding.extension.extension[+].url = "key"
  * ^binding.extension.extension[=].valueId = "3fdfb5b5-0d5e-4b02-bda5-562629399813"
  * ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* reasonReference ^short = "Explanation/Justification for service or service"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreServiceProhibited
