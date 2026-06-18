Profile: USQualityCorePractitioner
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner|9.0.0
Id: us-quality-core-practitioner
Title: "US Quality Core Practitioner"
Description: "Profile of Practitioner for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier 1..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "An identifier for the person as this agent"
  * ^comment = "NPI must be supported as the identifier system in the US, Tax id is allowed, Local id is allowed in addition to another identifier supplied by a jurisdictional authority such as a practitioner's *Drug Enforcement Administration (DEA)* number."
* identifier contains ein 0..1
  * system 1..1
  * system only uri
    * ^short = "The namespace for the identifier value"
  * value 1..1
  * value only string
    * ^short = "The value that is unique"
* identifier[NPI] ^short = "An identifier for the person as this agent"
  * ^patternIdentifier.system = "http://hl7.org/fhir/sid/us-npi"
  * ^condition[0] = "us-core-16"
  * ^condition[+] = "us-core-17"
  * system ^short = "The namespace for the identifier value"
  * value ^short = "The value that is unique"
* identifier[NCSBNID] MS
* identifier[ein] only Identifier
  * ^short = "There is not a general Tax Identifier Numer (TIN) OID. There is an SSN, a PTIN, and an ITIN, but no TIN generally. So the only slice specified here is EIN, if consumers determine a need for an SSN, submit a comment to that effect."
  * ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.4"
  * system 1..1
  * system only uri
    * ^short = "The namespace for the identifier value"
  * use 1..1
  * use only code
    * ^short = "usual | official | temp | secondary | old (If known)"
  * value 1..1
  * value only string
    * ^short = "The value that is unique"
* identifier[ein].system 1..1
* identifier[ein].system only uri
* identifier[ein].system ^short = "The namespace for the identifier value"
* identifier[ein].value 1..1
* identifier[ein].value only string
* identifier[ein].value ^short = "The value that is unique"
* name ^short = "The name(s) associated with the practitioner"
  * family ^short = "Family name (often called 'Surname')"
* telecom ^short = "A contact detail for the practitioner (that apply to all roles)"
  * system ^short = "phone | fax | email | pager | url | sms | other"
  * value ^short = "The actual contact point details"
* address ^short = "Address(es) of the practitioner"
  * line ^short = "Street name, number, direction & P.O. Box etc."
  * city ^short = "Name of city, town etc."
  * state ^short = "Sub-unit of country (abbreviations ok)"
  * postalCode ^short = "US Zip Codes"
  * country ^short = "Country (e.g. can be ISO 3166 2 or 3 letter code)"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCorePractitioner
