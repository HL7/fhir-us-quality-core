Instance: us-quality-core-encounter-type
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-encounter-type"
* version = "1.0.0"
* name = "USQualityCoreEncounterType"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core Encounter Type Search Parameter"
* code = #type
* base = #Encounter
* type = #token
* expression = "Encounter.type"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true