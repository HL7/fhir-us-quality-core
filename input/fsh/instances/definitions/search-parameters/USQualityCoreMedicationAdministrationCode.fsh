Instance: us-quality-core-medication-administration-code
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-administration-code"
* version = "1.0.0"
* name = "USQualityCoreMedicationAdministrationCode"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core MedicationAdministration Code Search Parameter"
* code = #code
* base = #MedicationAdministration
* type = #token
* expression = "MedicationAdministration.medication.as(CodeableConcept)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true