Alias: $medicationrequest-status = http://hl7.org/fhir/CodeSystem/medicationrequest-status

ValueSet: USQualityCorePositiveMedicationRequestStatus
Id: us-quality-core-positive-medication-request-status
Title: "Positive MedicationRequest Status"
Description: "This value set defines the set of codes that indicate a positive medication request status (i.e. codes that a medication is proposed, planned, or ordered)"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of medication request statuses in FHIR that indicate a positive status (i.e. all the codes from the http://terminology.hl7.org/CodeSystem/medicationrequest-status code system that indicate a medication is proposed, planned, or ordered)."
* $medicationrequest-status#active "Active"
* $medicationrequest-status#on-hold "On Hold"
* $medicationrequest-status#cancelled "Cancelled"
* $medicationrequest-status#completed "Completed"
* $medicationrequest-status#stopped "Stopped"
* $medicationrequest-status#draft "Draft"