Instance: us-quality-core-medication-request-intent
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-request-intent"
* version = "1.0.0"
* name = "USQualityCoreMedicationRequestIntent"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core MedicationRequest intent Search Parameter"
* code = #intent
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.intent"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true