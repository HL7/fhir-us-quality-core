Instance: us-quality-core-adverse-event-event
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-event"
* version = "1.0.0"
* name = "USQualityCoreAdverseEventEvent"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core AdverseEvent Event Search Parameter"
* code = #event
* base = #AdverseEvent
* type = #token
* expression = "AdverseEvent.event"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true