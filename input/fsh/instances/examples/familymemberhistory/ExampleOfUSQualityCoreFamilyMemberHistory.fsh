Instance: example-of-us-quality-core-family-member-history
InstanceOf: USQualityCoreFamilyMemberHistory
Title: "FamilyMemberHistory example"
Description: "Example of Family Member History for a patient"
Usage: #example
* id = "example"
* status = #completed
* patient
  * reference = "Patient/example"
  * display = "Peter Patient"
* date = "2011-03-18T17:49:10+00:00"
* relationship = $v3-RoleCode#FTH "FATHER"
* condition
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/familymemberhistory-severity"
    * valueCodeableConcept = $sct#399166001 "Fatal"
  * code = $sct#315619001 "Family history of myocardial infarction in male relative of first degree, age known (situation)"
    * text = "Family history of myocardial infarction in male relative of first degree, age known (situation)"
  * outcome = $sct#520004 "Congenital bent nose"
  * onsetAge = 74 'a' "yr"
  * note.text = "Was fishing at the time. At least he went doing something he loved."