Profile: USQualityCoreServiceRequested
Parent: USQualityCoreServiceRequest
Id: us-quality-core-servicerequested
Title: "US Quality Core ServiceRequested"
Description: "Positive profile of ServiceRequest for decision support/quality metrics. Indicates that a service is proposed, planned, or ordered."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status from USQualityCorePositiveRequestStatus (required)
  * ^short = "draft | active | on-hold | completed"
* doNotPerform 0..1
* doNotPerform only boolean
* doNotPerform = false (exactly)
  * ^short = "True if service/procedure should not be performed"
* authoredOn ^short = "Date request signed"
* code ^short = "What is being requested/ordered"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* reasonCode ^short = "Explanation/Justification for procedure or service"
* reasonReference ^short = "Explanation/Justification for service or service"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreServiceRequested
