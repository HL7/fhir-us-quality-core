Profile: USQualityCoreTaskDone
Parent: USQualityCoreTask
Id: us-quality-core-taskdone
Title: "US Quality Core Task Done"
Description: "Positive profile of Task for decision support/quality metrics. Indicates a task that with a positive status"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status 1..1
* status from USQualityCorePositiveTaskStatus (required)
  * ^short = "draft | requested | received | accepted | ready | in-progress | on-hold | completed"