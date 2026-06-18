Profile: USQualityCoreLocation
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-location|9.0.0
Id: us-quality-core-location
Title: "US Quality Core Location"
Description: "Profile of Location for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^short = "Unique business identifier for facility or location."
* status 0..1
* status only code
* status = #active (exactly)
  * ^short = "active | suspended | inactive"
  * ^definition = "The status property covers the general availability of the resource, not the current value which may be covered by the operationStatus, or by a schedule/slots if they are configured for the location."
* name ^short = "Name by which a facility or location is known."
* type ^short = "Category of service or resource available in a location."
  * ^definition = "Indicates the type of function performed at the location."
* telecom ^short = "Contact details of the location"
* address ^short = "Physical location"
* managingOrganization only Reference(USQualityCoreOrganization)
  * ^short = "Organization responsible for provisioning and upkeep"
* partOf
  * ^mustSupport = false
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreLocation
