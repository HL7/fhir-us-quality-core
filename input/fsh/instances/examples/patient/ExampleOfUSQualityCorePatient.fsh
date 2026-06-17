Instance: example-of-us-quality-core-patient
InstanceOf: USQualityCorePatient
Title: "Patient example"
Description: "Basic Patient example"
Usage: #example
* id = "example"
* identifier
  * use = #usual
  * type = $v2-0203#MR
  * system = "http://example.org/patient/identifiers"
  * value = "12345"
  * period.start = "2001-05-06"
  * assigner.display = "Acme Healthcare"
* active = true
* name[0]
  * use = #official
  * family = "Chalmers"
  * given[0] = "Peter"
  * given[+] = "James"
* name[+]
  * use = #usual
  * family = "Chalmers"
  * given = "Jim"
* name[+]
  * use = #maiden
  * family = "Windsor"
  * given[0] = "Peter"
  * given[+] = "James"
  * period.end = "2002"
* telecom[0]
  * system = #phone
  * value = "(03) 5555 6473"
  * use = #work
  * rank = 1
* telecom[+]
  * system = #phone
  * value = "(03) 3410 5613"
  * use = #mobile
  * rank = 2
* telecom[+]
  * system = #phone
  * value = "(03) 5555 8834"
  * use = #old
  * period.end = "2014"
* gender = #male
* birthDate = "1974-12-25"
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
    * valueDateTime = "1974-12-25T14:35:45-05:00"
* deceasedBoolean = false
* address
  * use = #home
  * type = #both
  * text = "534 Erewhon St PeasantVille, Utah 84414"
  * line = "534 Erewhon St"
  * city = "PleasantVille"
  * district = "Rainbow"
  * state = "UT"
  * postalCode = "84414"
  * period.start = "1974-12-25"
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
* managingOrganization
  * reference = "Organization/example"
