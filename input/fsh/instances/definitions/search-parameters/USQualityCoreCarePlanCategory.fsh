Instance: us-quality-core-care-plan-category
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-care-plan-category"
* version = "1.0.0"
* name = "USQualityCoreCarePlanCategory"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core CarePlan Category Search Parameter"
* code = #category
* base = #CarePlan
* type = #token
* expression = "CarePlan.category"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true