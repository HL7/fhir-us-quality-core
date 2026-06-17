Alias: $medicationdispense-status = http://terminology.hl7.org/CodeSystem/medicationdispense-status

ValueSet: USQualityCorePositiveMedicationDispenseStatus
Id: us-quality-core-positive-medication-dispense-status
Title: "Positive MedicationDispense Status"
Description: "This value set defines the set of codes that indicate a positive medication dispense status (i.e. codes that indicate at least some medication was dispensed)"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "This value set was defined to support the set of medication dispense statuses in FHIR that do indicate a positive status (i.e. all the codes from the http://terminology.hl7.org/CodeSystem/medicationdispense-status code system that indicate at least some medication was dispensed)."
* $medicationdispense-status#preparation "Preparation"
* $medicationdispense-status#in-progress "In Progress"
* $medicationdispense-status#on-hold "On Hold"
* $medicationdispense-status#completed "Completed"
* $medicationdispense-status#stopped "Stopped"