Instance: us-quality-core-device-request-do-not-perform
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-device-request-do-not-perform"
* version = "1.0.0"
* name = "USQualityCoreDeviceRequestDoNotPerform"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core DeviceRequest do-not-perform Search Parameter"
* code = #do-not-perform
* base = #DeviceRequest
* type = #token
* expression = "DeviceRequest.modifierExtension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-DeviceRequest.doNotPerform').value"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true