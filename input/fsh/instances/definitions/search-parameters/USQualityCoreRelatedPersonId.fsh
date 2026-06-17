Instance: us-quality-core-related-person-id
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-related-person-id"
* version = "1.0.0"
* name = "USQualityCoreRelatedPersonId"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core RelatedPerson Id Search Parameter"
* code = #_id
* base = #RelatedPerson
* type = #token
* expression = "Resource.id"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true