Instance: us-quality-core-medication-dispense-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-dispense-patient"
* version = "1.0.0"
* name = "USQualityCoreMedicationDispensePatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core MedicationDispense Patient Search Parameter"
* code = #patient
* base = #MedicationDispense
* type = #reference
* expression = "MedicationDispense.subject.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true