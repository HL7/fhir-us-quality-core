Instance: us-quality-core-observation-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-patient"
* version = "1.0.0"
* name = "USQualityCoreObservationPatient"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core Observation Patient Search Parameter"
* code = #patient
* base = #Observation
* type = #reference
* expression = "Observation.subject.where(resolve() is Patient)"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true