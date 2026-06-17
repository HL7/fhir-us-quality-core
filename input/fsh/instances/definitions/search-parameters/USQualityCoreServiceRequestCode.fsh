Instance: us-quality-core-service-request-code
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-code"
* version = "1.0.0"
* name = "USQualityCoreServiceRequestCode"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core ServiceRequest Code Search Parameter"
* code = #code
* base = #ServiceRequest
* type = #token
* expression = "ServiceRequest.code"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true