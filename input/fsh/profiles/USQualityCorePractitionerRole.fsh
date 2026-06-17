Profile: USQualityCorePractitionerRole
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole|9.0.0
Id: us-quality-core-practitionerrole
Title: "US Quality Core PractitionerRole"
Description: "Profile of PractitionerRole for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier 1..*
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Business Identifiers that are specific to a role/location"
  * use 1..1
  * use only code
    * ^short = "usual | official | temp | secondary | old (If known)"
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
* active 1..1
  * ^short = "Whether this practitioner role record is in active use"
* period 1..1
  * ^short = "The period during which the practitioner is authorized to perform in these role(s)"
* practitioner only Reference(USQualityCorePractitioner)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Practitioner that is able to provide the defined services for the organization"
* organization only Reference(USQualityCoreOrganization)
  * ^short = "Organization where the roles are available"
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.30 (extensible)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Roles which this practitioner may perform"
  * ^binding.description = "Indicates specific responsibility of an individual within the care team, such as Primary physician, Team coordinator, Caregiver, etc."
* specialty from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.1066 (extensible)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Specific specialty of the practitioner"
* location only Reference(USQualityCoreLocation)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) The location(s) at which this practitioner provides care"
* healthcareService ^condition = "us-core-13"
* telecom ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Contact details that are specific to the role/location/service"
  * ^condition = "pd-1"
  * system 1..1
  * system only code
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) phone | fax | email | pager | url | sms | other"
  * value 1..1
  * value only string
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The actual contact point details"
* endpoint ^short = "Technical endpoints providing access to services operated for the practitioner with this role"
  * ^condition = "pd-1"