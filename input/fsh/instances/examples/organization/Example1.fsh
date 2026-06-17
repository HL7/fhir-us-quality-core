Instance: example-1
InstanceOf: USQualityCoreOrganization
Title: "Hospital Organization example"
Description: "Hendricks County Hospital example"
Usage: #example
* identifier
  * use = #temp
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "1285243618"
* active = true
* type = $organization-type#prov "Healthcare Provider"
* name = "HENDRICKS COUNTY HOSPITAL"
* telecom[0]
  * system = #phone
  * value = "(+1) 712-456-7777"
* telecom[+]
  * system = #fax
  * value = "(+1) 712-456-6622"
* telecom[+]
  * system = #email
  * value = "staff@countyhospital.org"
* address
  * line = "3300 Washtenaw Avenue, Suite 227"
  * city = "Avon"
  * state = "IN"
  * postalCode = "46123"
  * country = "USA"