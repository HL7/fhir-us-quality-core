Profile: USQualityCoreOrganization
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization|9.0.0
Id: us-quality-core-organization
Title: "US Quality Core Organization"
Description: "Profile of Organization for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^short = "Identifies this organization across multiple systems"
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    ccn 0..1 and
    ein 0..1
* identifier[ccn] only Identifier
  * ^short = "CMS Certification Number"
  * ^patternIdentifier.system = "http://terminology.hl7.org/NamingSystem/CMSCertificationNumber"
  * use 1..1
  * use only code
    * ^short = "usual | official | temp | secondary | old (If known)"
  * value 1..1
  * value only string
    * ^short = "The value that is unique"
* identifier[ein] only Identifier
  * ^short = "Employer Identification Number"
  * ^comment = "There is not a general Tax Identifier Numer (TIN) OID. There is an SSN, a PTIN, and an ITIN, but no TIN generally. So the only slice specified here is EIN, if consumers determine a need for an SSN, submit a comment to that effect."
  * ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.4"
  * use 1..1
  * use only code
    * ^short = "usual | official | temp | secondary | old (If known)"
  * value 1..1
  * value only string
    * ^short = "The value that is unique"
* type from OrganizationType (preferred)
  * ^short = "Kind of organization"
  * ^binding.description = "Used to categorize the organization"
* partOf ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-organization"
* name ^short = "Name used for the organization"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreOrganization
