Instance: us-quality-core-device-request-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-device-request-patient"
* version = "1.0.0"
* name = "USQualityCoreDeviceRequestPatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core DeviceRequest Patient Search Parameter"
* code = #patient
* base = #DeviceRequest
* type = #reference
* expression = "DeviceRequest.subject.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true