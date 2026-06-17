Instance: example-of-us-quality-core-medication
InstanceOf: USQualityCoreMedication
Title: "Medication example"
Description: "Example of Alemtuzumab Medication"
Usage: #example
* id = "example"
* contained = org-6
* code = $rxnorm#1594660 "alemtuzumab 10 MG/ML [Lemtrada]"
* manufacturer.reference = "#org-6"
* form = $sct#385219001 "Conventional release solution for injection (dose form)"
* ingredient
  * itemCodeableConcept = $sct#129472003 "Alemtuzumab (substance)"
  * strength
    * numerator = 12 'mg'
    * denominator = 1.2 'mL'
* batch
  * lotNumber = "9494788"
  * expirationDate = "2017-05-22"

Instance: org-6
InstanceOf: USQualityCoreOrganization
Usage: #inline
* identifier
  * use = #temp
  * system = "http://hl7.org/fhir/sid/us-npi"
  * value = "8635143786"
* active = true
* name = "Genzyme"
* telecom
  * system = #url
  * value = "https://www.sanofigenzyme.com/"
  * use = #work
* address
  * use = #work
  * city = "Cambridge"
  * state = "MA"
  * country = "USA"
