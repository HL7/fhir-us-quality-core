Profile: USQualityCoreClaim
Parent: Claim
Id: us-quality-core-claim
Title: "US Quality Core Claim"
Description: "Profile of Claim for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status only code
* status = #active (exactly)
  * ^short = "active"
* type ^short = "category | discipline"
* use ^short = "claim | preauthorization | predetermination"
* patient only Reference(USQualityCorePatient)
  * ^short = "The recipient of the products and services"
* billablePeriod ^short = "Relevant time frame for the claim"
* created ^short = "Resource creation date"
* provider only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization)
  * ^short = "Party responsible for the claim"
* prescription only Reference(USQualityCoreDeviceRequest or USQualityCoreMedicationRequest or VisionPrescription)
  * ^short = "Prescription authorizing services and products"
* payee.party only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization or USQualityCorePatient or USQualityCoreRelatedPerson)
* referral only Reference(USQualityCoreServiceRequest)
* facility only Reference(USQualityCoreLocation)
* careTeam.provider only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization)
* diagnosis ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension.valueString = "Diagnosis"
  * ^short = "Pertinent diagnosis information"
  * sequence ^short = "Diagnosis instance identifier"
  * diagnosis[x] only CodeableConcept or Reference(USQualityCoreConditionEncounterDiagnosis)
    * ^short = "Nature of illness or problem"
  * type ^short = "Timing or nature of the diagnosis"
  * onAdmission from PresentOnAdmissionIndicators (required)
    * ^short = "Present on admission"
    * ^binding.description = "Present on admission."
* procedure ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension.valueString = "Procedure"
  * ^short = "Clinical procedures performed"
  * sequence ^short = "Procedure instance identifier"
  * type ^short = "Category of Procedure"
  * procedure[x] only CodeableConcept or Reference(USQualityCoreProcedure)
    * ^short = "Specific clinical procedure"
* insurance.coverage only Reference(USQualityCoreCoverage)
* item.encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounters related to this billed item"