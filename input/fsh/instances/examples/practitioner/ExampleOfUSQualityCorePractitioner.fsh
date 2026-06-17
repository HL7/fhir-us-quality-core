Instance: example-of-us-quality-core-practitioner
InstanceOf: USQualityCorePractitioner
Title: "Practitioner example"
Description: "Referring Practitioner example"
Usage: #example
* id = "example"
* identifier
  * use = #temp
  * system = "urn:oid:2.16.840.1.113883.4.4"
  * value = "Practitioner-23"
* active = true
* name
  * family = "Careful"
  * given = "Adam"
  * prefix = "Dr"
* address
  * use = #home
  * line = "534 Erewhon St"
  * city = "PleasantVille"
  * state = "UT"
  * postalCode = "84414"
* qualification
  * identifier
    * system = "http://example.org/UniversityIdentifier"
    * value = "12345"
  * code = http://terminology.hl7.org/CodeSystem/v2-0360#BS "Bachelor of Science"
    * text = "Bachelor of Science"
  * period.start = "1995"
  * issuer.display = "Example University"