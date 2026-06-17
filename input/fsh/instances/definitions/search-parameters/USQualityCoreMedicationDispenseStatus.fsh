Instance: us-quality-core-medication-dispense-status
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-dispense-status"
* version = "1.0.0"
* name = "USQualityCoreMedicationDispenseStatus"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core MedicationDispense Status Search Parameter"
* code = #status
* base = #MedicationDispense
* type = #token
* expression = "MedicationDispense.status"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true