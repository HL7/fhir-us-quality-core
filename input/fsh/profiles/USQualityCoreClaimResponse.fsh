Profile: USQualityCoreClaimResponse
Parent: ClaimResponse
Id: us-quality-core-claimresponse
Title: "US Quality Core ClaimResponse"
Description: "The US Quality Core ClaimResponse profile is used to provide the results of the adjudication and/or authorization of a set of healthcare-related products and services for a patient against the patient's insurance coverages, or to respond with what the adjudication would be for a supplied set of products or services should they be actually supplied to the patient. It identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the ClaimResponse resource when using this profile"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* status = #active (exactly)
  * ^short = "active | cancelled | draft | entered-in-error"
* type ^short = "More granular claim type"
* use = #preauthorization (exactly)
  * ^short = "claim | preauthorization | predetermination"
  * ^definition = "A code to indicate whether the nature of the request is: to request adjudication of products and services previously rendered; or requesting authorization and adjudication for provision in the future; or requesting the non-binding adjudication of the listed products and services which could be provided in the future."
* patient only Reference(USQualityCorePatient)
  * ^short = "The recipient of the products and services"
* created ^short = "Response creation date"
* insurer only Reference(USQualityCoreOrganization)
  * ^short = "Party responsible for reimbursement"
* requestor only Reference(USQualityCorePractitioner or USQualityCoreOrganization or USQualityCorePractitionerRole)
  * ^short = "Party responsible for the claim"
* request only Reference(USQualityCoreClaim)
  * ^short = "Id of resource triggering adjudication"
* item ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension.valueString = "Item"
  * ^short = "Adjudication for claim line items"
  * adjudication 1..*
    * ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
    * ^extension.valueString = "Adjudication"
    * ^short = "Adjudication details"
    * category only CodeableConcept
    * category = $adjudication#submitted
      * ^short = "This code is fixed to 'submitted' to indicate that the adjudication result is on what was submitted."
    * amount ^short = "Monetary amount"
  * detail.detailSequence ^short = "Claim detail instance identifier"