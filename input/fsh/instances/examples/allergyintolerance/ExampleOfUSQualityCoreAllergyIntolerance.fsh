Instance: example-of-us-quality-core-allergy-intolerance
InstanceOf: USQualityCoreAllergyIntolerance
Title: "AllergyIntolerance example"
Description: "Example of a clinical assessment record of an allergy"
Usage: #example
* id = "example"
* identifier
  * system = "http://acme.com/ids/patients/risks"
  * value = "49476534"
* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #food
* criticality = #high
* code = $sct#227493005 "Cashew nuts"
* patient
  * reference = "Patient/example"
* onsetDateTime = "2004"
* recordedDate = "2014-10-09T14:58:00+11:00"
* recorder
  * reference = "Practitioner/example"
* asserter
  * reference = "Patient/example"
* lastOccurrence = "2012-06-02T01:45:31+00:00"
* note
  * text = "The criticality is high becasue of the observed anaphylactic reaction when challenged     with cashew extract."
* reaction[0]
  * substance = $rxnorm#1160593 "cashew nut allergenic extract Injectable Product"
  * manifestation = $sct#39579001 "Anaphylactic reaction"
  * description = "Challenge Protocol. Severe reaction to subcutaneous cashew extract. Epinephrine administered"
  * onset = "2012-06-12"
  * severity = #severe
  * exposureRoute = $sct#34206005 "Subcutaneous route"
* reaction[+]
  * manifestation = $sct#64305001 "Urticaria"
  * onset = "2004"
  * severity = #moderate
  * note
    * text = "The patient reports that the onset of urticaria was within 15 minutes of eating cashews."
