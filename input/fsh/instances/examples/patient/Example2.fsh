Instance: example-2
InstanceOf: USQualityCorePatient
Title: "65+ Female patient example"
Description: "65+ Female patient example"
Usage: #example
* identifier
  * use = #usual
  * type = $v2-0203#MR
  * system = "http://example.org/patient/identifiers"
  * value = "12345"
  * period.start = "1995-05-06"
  * assigner.display = "Acme Healthcare"
* active = true
* name
  * use = #official
  * family = "Hugankiss"
  * given = "Sarah"
* telecom
  * system = #phone
  * value = "(202) 212 1212"
  * use = #mobile
  * rank = 1
* gender = #female
* birthDate = "1946-09-25"
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
    * valueDateTime = "1946-09-25T14:35:45-05:00"
* deceasedBoolean = false
* address
  * use = #home
  * type = #both
  * text = "1600 Pennslyvania Ave"
  * line = "1600 Pennslyvania Ave"
  * city = "Washington DC"
  * state = "DC"
  * postalCode = "20500"
  * period.start = "1946-12-25"
* contact
  * relationship = $v2-0131#N
  * name
    * family = "du Marché"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
        * valueString = "VV"
    * given = "Bénédicte"
  * telecom
    * system = #phone
    * value = "+33 (237) 998327"
  * address
    * use = #home
    * type = #both
    * line = "534 Erewhon St"
    * city = "PleasantVille"
    * district = "Rainbow"
    * state = "VT"
    * postalCode = "3999"
    * period.start = "1974-12-25"
  * gender = #female
  * period.start = "2012"
* managingOrganization.reference = "Organization/example"