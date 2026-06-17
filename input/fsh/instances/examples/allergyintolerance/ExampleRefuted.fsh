Instance: example-refuted
InstanceOf: USQualityCoreAllergyIntolerance
Title: "AllergyIntolerance refuted example"
Description: "Example of a clinical assessment record of an allergy that has been refuted"
Usage: #example
* identifier
  * system = "http://acme.com/ids/patients/risks"
  * value = "49476534"
* clinicalStatus = $allergyintolerance-clinical#inactive
* verificationStatus = $allergyintolerance-verification#refuted
* type = #allergy
* category = #food
* code = $sct#227493005 "Cashew nuts"
* patient
  * reference = "Patient/example"
* recordedDate = "2014-10-09T14:58:00+11:00"
* recorder
  * reference = "Practitioner/example"
* asserter
  * reference = "Patient/example"
