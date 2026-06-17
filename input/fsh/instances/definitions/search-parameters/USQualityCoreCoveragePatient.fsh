Instance: us-quality-core-coverage-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-coverage-patient"
* version = "1.0.0"
* name = "USQualityCoreCoveragePatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core Coverage Patient Search Parameter"
* code = #patient
* base = #Coverage
* type = #reference
* expression = "Coverage.beneficiary"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true