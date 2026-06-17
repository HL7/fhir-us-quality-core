Instance: done-example-of-us-quality-core-medication-administration
InstanceOf: USQualityCoreMedicationAdministration
Title: "MedicationAdministration positive example"
Description: "Intravenous example of MedicationAdministration (using the Positive Profile)"
Usage: #example
* id = "done-example"
* status = #completed
* medicationReference.reference = "Medication/example"
* subject
  * reference = "Patient/example"
  * display = "Donald Duck"
* context.reference = "Encounter/example"
* supportingInformation.reference = "Condition/example"
* effectivePeriod
  * start = "2015-01-15T14:30:00+01:00"
  * end = "2015-01-15T14:30:00+01:00"
* request.reference = "MedicationRequest/example"
* dosage
  * route = $sct#47625008 "Intravenous route (qualifier value)"
  * dose = 3 'mg' "mg"