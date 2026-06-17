ValueSet: USQualityCorePositiveEventStatus
Id: us-quality-core-positive-event-status
Title: "Positive Event Status"
Description: "This value set defines the set of codes that indicate a positive event status (i.e. codes that indicate an event is in preparation, progress, on-hold, stopped, or has completed)"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of event statuses in FHIR that indicate a positive status (i.e. all the codes from the http://hl7.org/fhir/event-status code system that indicate an event is in preparation, progress, on-hold, stopped, or has completed)."
* EventStatus#preparation "Preparation"
* EventStatus#in-progress "In Progress"
* EventStatus#on-hold "On Hold"
* EventStatus#stopped "Stopped"
* EventStatus#completed "Completed"