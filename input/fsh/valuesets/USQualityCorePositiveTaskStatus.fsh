ValueSet: USQualityCorePositiveTaskStatus
Id: us-quality-core-positive-task-status
Title: "Positive Task Status"
Description: "This value set defines the set of codes that indicate a positive task status"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of task statuses in FHIR that indicate a positive status."
* TaskStatus#draft "Draft"
* TaskStatus#requested "Requested"
* TaskStatus#received "Received"
* TaskStatus#accepted "Accepted"
* TaskStatus#ready "Ready"
* TaskStatus#in-progress "In Progress"
* TaskStatus#on-hold "On Hold"
* TaskStatus#completed "Completed"