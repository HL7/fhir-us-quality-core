Alias: $provider-taxonomy = http://nucc.org/provider-taxonomy

Instance: example-of-us-quality-core-practitioner-role
InstanceOf: USQualityCorePractitionerRole
Title: "PractitionerRole example"
Description: "PractitionerRole example"
Usage: #example
* id = "example"
* identifier
  * use = #temp
  * system = "http://www.acme.org/practitionerroles"
  * value = "31"
* active = true
* period.start = "1995"
* practitioner
  * reference = "Practitioner/example"
  * display = "Dr Adam Careful"
* organization.reference = "Organization/example"
* code = $provider-taxonomy#261Q00000X "Clinic/Center"
* specialty = $provider-taxonomy#122300000X "Dentist"
* location.reference = "Location/example"
* telecom
  * system = #phone
  * value = "801-123-4567"