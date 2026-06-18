Profile: USQualityCoreCoverage
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage|9.0.0
Id: us-quality-core-coverage
Title: "US Quality Core Coverage"
Description: "Profile of Coverage for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^short = "Member ID and other identifiers"
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* identifier[memberid] ^short = "Member ID"
  * type ^short = "Member Number identifier type"
* status ^short = "active | cancelled | draft | entered-in-error"
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591 (extensible)
  * ^short = "Coverage category such as medical or accident"
  * ^binding.description = "Categories of types of health care payor entities as defined by the US Public Health Data Consortium SOP code system"
  * ^short = "Owner of the policy"
* subscriberId 0..1
  * ^short = "ID assigned to the subscriber"
* beneficiary only Reference(USQualityCorePatient)
  * ^short = "Plan beneficiary"
* relationship ^short = "Beneficiary relationship to the subscriber"
* period ^short = "Coverage start and end dates"
* policyHolder
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-patient"
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-organization"
  * ^type[0].targetProfile[2] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-relatedperson"
* payor 1..1
* payor only Reference(USQualityCorePatient or USQualityCoreOrganization or USQualityCoreRelatedPerson)
  * ^short = "Issuer of the policy"
* class ^short = "Additional coverage classifications"
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.description = "Slice based on value pattern"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* class[group] ^short = "Group"
  * value ^short = "Group Identifier"
  * name ^short = "Human readable description of the type and value"
* class[plan] ^short = "Plan"
  * value ^short = "Plan Number"
  * name ^short = "Plan Name"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreCoverage
