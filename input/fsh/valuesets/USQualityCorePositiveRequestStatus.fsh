ValueSet: USQualityCorePositiveRequestStatus
Id: us-quality-core-positive-request-status
Title: "Positive Request Status"
Description: "This value set defines the set of codes that indicate a positive request status (i.e. codes that indicate an activity is proposed, planned, or ordered)."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of request statuses in FHIR that indicate a positive status (i.e. all the codes from the http://hl7.org/fhir/request-status code system that indicate an activity is proposed, planned, or ordered)."
* RequestStatus#draft "Draft"
* RequestStatus#active "Active"
* RequestStatus#on-hold "On Hold"
* RequestStatus#revoked "Revoked"
* RequestStatus#completed "Completed"