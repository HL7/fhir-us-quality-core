Instance: example-of-us-quality-core-encounter
InstanceOf: USQualityCoreEncounter
Title: "Encounter example"
Description: "Example of an Encounter"
Usage: #example
* id = "example"
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* type = $cpt#99223 "Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 75 minutes must be met or exceeded."
* subject.reference = "Patient/example"
* diagnosis.condition.reference = "Condition/appendicitis-example"