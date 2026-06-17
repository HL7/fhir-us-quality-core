Instance: example-of-us-quality-core-immunization-recommendation
InstanceOf: USQualityCoreImmunizationRecommendation
Title: "ImmunizationRecommendation example"
Description: "Example of ImmunizationRecommendation for Hepatitis A vaccine"
Usage: #example
* id = "example"
* identifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1235"
* patient.reference = "Patient/example"
* date = "2015-02-09T11:04:15.817-05:00"
* recommendation
  * vaccineCode = $sct#1010308001 "Vaccine product containing only inactivated whole Hepatitis A virus HM-175 strain antigen (medicinal product)"
  * forecastStatus.text = "Not Complete"
  * dateCriterion[0]
    * code = $loinc#30981-5 "Earliest date to give"
    * value = "2015-12-01T00:00:00-05:00"
  * dateCriterion[+]
    * code = $loinc#30980-7 "Date vaccine due"
    * value = "2015-12-01T00:00:00-05:00"
  * dateCriterion[+]
    * code = $loinc#59778-1 "Date when overdue for immunization"
    * value = "2016-12-28T00:00:00-05:00"
  * description = "First sequence in protocol"
  * series = "Vaccination Series 1"
  * doseNumberPositiveInt = 1
  * supportingImmunization.reference = "Immunization/example"
  * supportingPatientInformation.reference = "Observation/example"