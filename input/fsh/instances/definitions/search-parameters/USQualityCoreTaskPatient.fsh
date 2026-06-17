Instance: us-quality-core-task-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-task-patient"
* version = "1.0.0"
* name = "USQualityCoreTaskPatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core Task patient Search Parameter"
* code = #patient
* base = #Task
* type = #reference
* expression = "Task.for.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true