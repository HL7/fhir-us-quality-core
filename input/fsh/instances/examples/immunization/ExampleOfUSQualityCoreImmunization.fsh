Instance: example-of-us-quality-core-immunization
InstanceOf: USQualityCoreImmunization
Title: "Immunization general example"
Description: "Immunization example (using the General Profile)"
Usage: #example
* id = "example"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234"
* status = #completed
* vaccineCode
  * coding[0] = http://hl7.org/fhir/sid/cvx#160 "Influenza A monovalent (H5N1), adjuvanted, National stockpile 2013"
  * coding[+] = http://hl7.org/fhir/sid/ndc#49281012165
* patient.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* occurrenceDateTime = "2013-01-01"
* recorded = "2013-01-10"
* primarySource = true
* location.reference = "Location/example"
* manufacturer.reference = "Organization/example"
* lotNumber = "AAJN11K"
* expirationDate = "2015-02-15"
* site = $v3-ActSite#LA "left arm"
* route = $v3-RouteOfAdministration#IM "Injection, intramuscular"
* doseQuantity = 5 'mg'
* performer[0]
  * function = $v2-0443#OP
  * actor.reference = "Practitioner/example"
* performer[+]
  * function = $v2-0443#AP
  * actor.reference = "Practitioner/example"
* note.text = "Notes on adminstration of vaccine"
* reasonCode = $sct#429060002
* reaction
  * date = "2013-01-10"
  * detail.reference = "Observation/example"
  * reported = true
* protocolApplied
  * series = "Vaccination Series 1"
  * authority.reference = "Organization/example"
  * targetDisease = $sct#1857005
  * doseNumberPositiveInt = 1
  * seriesDosesPositiveInt = 2
