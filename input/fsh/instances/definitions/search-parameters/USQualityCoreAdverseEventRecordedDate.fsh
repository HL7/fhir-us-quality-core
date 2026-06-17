Instance: us-quality-core-adverse-event-recorded-date
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-recorded-date"
* version = "1.0.0"
* name = "USQualityCoreAdverseEventRecordedDate"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core AdverseEvent recorded-date Search Parameter"
* code = #recorded-date
* base = #AdverseEvent
* type = #date
* expression = "AdverseEvent.recordedDate"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* comparator[0] = #eq
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
* comparator[+] = #ne
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
* comparator[+] = #gt
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
* comparator[+] = #ge
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
* comparator[+] = #lt
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
* comparator[+] = #le
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
* comparator[+] = #sa
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
* comparator[+] = #eb
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
* comparator[+] = #ap
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY