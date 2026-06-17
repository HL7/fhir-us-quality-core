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
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "(USCDI+ Quality) An identifier for the person as this agent"
  * ^comment = "NPI must be supported as the identifier system in the US, Tax id is allowed, Local id is allowed in addition to another identifier supplied by a jurisdictional authority such as a practitioner's *Drug Enforcement Administration (DEA)* number."
* identifier contains ein 0..1
  * system 1..1
  * system only uri
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The namespace for the identifier value"
  * value 1..1
  * value only string
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The value that is unique"
* identifier[NPI] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) An identifier for the person as this agent"
  * ^patternIdentifier.system = "http://hl7.org/fhir/sid/us-npi"
  * ^condition[0] = "us-core-16"
  * ^condition[+] = "us-core-17"
  * system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The namespace for the identifier value"
  * value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The value that is unique"
* identifier[ein] only Identifier
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) There is not a general Tax Identifier Numer (TIN) OID. There is an SSN, a PTIN, and an ITIN, but no TIN generally. So the only slice specified here is EIN, if consumers determine a need for an SSN, submit a comment to that effect."
  * ^patternIdentifier.system = "urn:oid:2.16.840.1.113883.4.4"
  * system 1..1
  * system only uri
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The namespace for the identifier value"
  * use 1..1
  * use only code
    * ^short = "usual | official | temp | secondary | old (If known)"
  * value 1..1
  * value only string
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The value that is unique"
* identifier[ein] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
* identifier[ein] ^extension.valueBoolean = true
* identifier[ein].system 1..1
* identifier[ein].system only uri
* identifier[ein].system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
* identifier[ein].system ^extension.valueBoolean = true
* identifier[ein].system ^short = "(USCDI+ Quality) The namespace for the identifier value"
* identifier[ein].value 1..1
* identifier[ein].value only string
* identifier[ein].value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
* identifier[ein].value ^extension.valueBoolean = true
* identifier[ein].value ^short = "(USCDI+ Quality) The value that is unique"
* name ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) The name(s) associated with the practitioner"
  * family ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Family name (often called 'Surname')"
* telecom ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) A contact detail for the practitioner (that apply to all roles)"
  * system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) phone | fax | email | pager | url | sms | other"
  * value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The actual contact point details"
* address ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Address(es) of the practitioner"
  * line ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Street name, number, direction & P.O. Box etc."
  * city ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Name of city, town etc."
  * state ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Sub-unit of country (abbreviations ok)"
  * postalCode ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) US Zip Codes"
  * country ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Country (e.g. can be ISO 3166 2 or 3 letter code)"
