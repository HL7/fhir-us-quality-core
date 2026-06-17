Alias: $medication-admin-status = http://terminology.hl7.org/CodeSystem/medication-admin-status

ValueSet: USQualityCorePositiveMedicationAdministrationStatus
Id: us-quality-core-positive-medication-administration-status
Title: "Positive MedicationAdministration Status"
Description: "This value set defines the set of codes that indicate a positive medication administration status (i.e. codes that indicate at least some medication is being or was administered)"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of medication administration statuses in FHIR that indicate a positive status (i.e. all the codes from the http://terminology.hl7.org/CodeSystem/medication-admin-status code system that indicate at least some medication is being or was administered)."
* $medication-admin-status#in-progress "In Progress"
* $medication-admin-status#on-hold "On Hold"
* $medication-admin-status#completed "Completed"
* $medication-admin-status#stopped "Stopped"