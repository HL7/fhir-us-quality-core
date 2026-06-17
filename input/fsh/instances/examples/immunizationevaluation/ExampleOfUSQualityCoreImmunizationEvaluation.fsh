Instance: example-of-us-quality-core-immunization-evaluation
InstanceOf: USQualityCoreImmunizationEvaluation
Title: "ImmunizationEvaluaion example"
Description: "Example of ImmunizationEvaluation"
Usage: #example
* id = "example"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234"
* status = #completed
* patient.reference = "Patient/example"
* date = "2013-01-10"
* authority.reference = "Organization/example"
* targetDisease = $sct#1857005
* immunizationEvent.reference = "Immunization/example"
* doseStatus = http://terminology.hl7.org/CodeSystem/immunization-evaluation-dose-status#valid "Valid"
* series = "Vaccination Series 1"
* doseNumberPositiveInt = 1
* seriesDosesPositiveInt = 3