Profile: USQualityCoreCommunicationNotDone
Parent: USQualityCoreCommunication
Id: us-quality-core-communicationnotdone
Title: "US Quality Core Communication Not Done"
Description: "Negation profile of Communication for decision support/quality metrics. Indicates that the communication was not performed for a reason."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* extension contains EventRecorded named event-recorded 1..1
* extension[event-recorded] ^short = "Captures the recorded date of the communication"
* status 1..1
* status only code
* status = #not-done (exactly)
  * ^short = "not-done"
* statusReason 1..1
* statusReason from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Reason for current status"