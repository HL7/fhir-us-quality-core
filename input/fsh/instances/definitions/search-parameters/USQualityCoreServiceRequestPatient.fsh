Instance: us-quality-core-service-request-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-patient"
* version = "1.0.0"
* name = "USQualityCoreServiceRequestPatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core ServiceRequest Patient Search Parameter"
* code = #patient
* base = #ServiceRequest
* type = #reference
* expression = "ServiceRequest.subject.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true