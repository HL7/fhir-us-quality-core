Instance: us-quality-core-adverse-event-subject
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-subject"
* version = "1.0.0"
* name = "USQualityCoreAdverseEventSubject"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core AdverseEvent Subject Search Parameter"
* code = #subject
* base = #AdverseEvent
* type = #reference
* expression = "AdverseEvent.subject.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true