Instance: example-of-us-quality-core-organization
InstanceOf: USQualityCoreOrganization
Title: "Organization example"
Description: "HL7 Organization example"
Usage: #example
* id = "example"
* identifier
  * use = #temp
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "8635143786"
* active = true
* type = $organization-type#team "Organizational team"
* name = "Health Level Seven International"
* telecom[0]
  * system = #phone
  * value = "(+1) 734-677-7777"
* telecom[+]
  * system = #fax
  * value = "(+1) 734-677-6622"
* telecom[+]
  * system = #email
  * value = "hq@HL7.org"
* address
  * line = "3300 Washtenaw Avenue, Suite 227"
  * city = "Ann Arbor"
  * state = "MI"
  * postalCode = "48104"
  * country = "USA"