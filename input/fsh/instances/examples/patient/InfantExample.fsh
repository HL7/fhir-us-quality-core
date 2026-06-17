Instance: infant-example
InstanceOf: USQualityCorePatient
Title: "Infant patient example"
Description: "Infant patient example"
Usage: #example
* identifier
  * use = #usual
  * type = $v2-0203#MR "Medical Record Number"
    * text = "Medical Record Number"
  * system = "http://example.org"
  * value = "1032703"
* active = true
* name
  * family = "Example"
  * given = "Infant"
* telecom
  * system = #phone
  * value = "555-555-5555"
  * use = #home
* gender = #male
* birthDate = "2020-06-02"
* address
  * line = "49 Meadow St"
  * city = "Mounds"
  * state = "OK"
  * postalCode = "74047"
  * country = "US"