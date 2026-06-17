Instance: us-quality-core-condition-category
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-condition-category"
* version = "1.0.0"
* name = "USQualityCoreConditionCategory"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core Condition Category Search Parameter"
* code = #category
* base = #Condition
* type = #token
* expression = "Condition.category"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true