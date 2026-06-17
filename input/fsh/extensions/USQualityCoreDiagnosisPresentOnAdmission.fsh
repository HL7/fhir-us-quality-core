Extension: USQualityCoreDiagnosisPresentOnAdmission
Id: us-quality-core-diagnosis-present-on-admission
Title: "US Quality Core Diagnosis Present on Admission"
Description: "Indicator of whether the Encounter diagnosis was present at the time of admission."
Context: Encounter.diagnosis
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . 1..1
  * ^short = "onAdmission"
  * ^definition = "Indicator of whether the Encounter diagnosis was present at the time of admission."
* url only uri
* value[x] only CodeableConcept
* value[x] from USQualityCorePresentOnAdmission (required)
  * ^binding.description = "Indicator of whether the Encounter diagnosis was present at the time of admission"