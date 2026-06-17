Instance: appendicitis-example
InstanceOf: USQualityCoreConditionEncounterDiagnosis
Title: "Condition example - appendicitis"
Description: "Example of a condition resource used to record information about an appendicitis"
Usage: #example
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category[us-core] = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* severity = $sct#24484000 "Severe (severity modifier)"
* code = $sct#74400008 "Appendicitis (disorder)"
  * text = "Appendicitis"
* bodySite = $sct#66754008 "Appendix structure"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* onsetDateTime = "2012-05-24T00:00:00+00:00"
* recordedDate = "2012-05-24T00:00:00+00:00"
