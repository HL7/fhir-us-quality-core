Instance: example-of-us-quality-core-related-person
InstanceOf: USQualityCoreRelatedPerson
Title: "RelatedPerson example"
Description: "Emergency contact example"
Usage: #example
* id = "example"
* active = true
* patient.reference = "Patient/example"
* relationship = $v2-0131#C
* name
  * use = #official
  * family = "Chalmers"
  * given[0] = "Peter"
  * given[+] = "James"
* telecom
  * system = #phone
  * value = "(03) 5555 6473"
  * use = #work
* gender = #male
* address
  * use = #home
  * line = "534 Erewhon St"
  * city = "PleasantVille"
  * state = "UT"
  * postalCode = "84414"
* photo
  * contentType = #image/jpeg
  * url = "http://example.org/Binary/f012"
* period.start = "2012-03-11"