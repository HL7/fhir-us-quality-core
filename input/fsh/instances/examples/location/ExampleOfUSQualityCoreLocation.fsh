Instance: example-of-us-quality-core-location
InstanceOf: USQualityCoreLocation
Title: "Location example"
Description: "Example of Location of a provider - south wing of Mean Joe Greene University Medical Center"
Usage: #example
* id = "example"
* identifier
  * use = #temp
  * system = "http://example.org"
  * value = "B1-S.F2"
* status = #active
* name = "South Wing, second floor"
* alias[0] = "Mean Joe Greene University Medical Center, South Wing, second floor"
* alias[+] = "BU MC, SW, F2"
* description = "Second floor of the Old South Wing, formerly in use by Psychiatry"
* mode = #instance
* type = $v3-RoleCode#HOSP "Hospital"
* telecom[0]
  * system = #phone
  * value = "2328"
  * use = #work
* telecom[+]
  * system = #fax
  * value = "2329"
  * use = #work
* telecom[+]
  * system = #email
  * value = "secondwing@meanjoegreeneuniversitymedicalcenter.com"
* telecom[+]
  * system = #url
  * value = "http://example.org/southwing"
  * use = #work
* address
  * use = #work
  * line = "Iron Curtain 75, Building A"
  * city = "Pittsburgh"
  * state = "PA"
  * postalCode = "15016"
  * country = "US"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wi "Wing"
* position
  * longitude = -83.6945691
  * latitude = 42.25475478
  * altitude = 0
* managingOrganization.reference = "Organization/example"