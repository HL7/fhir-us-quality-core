Instance: negation-with-code-example-of-us-quality-core-medication-administration-not-done
InstanceOf: USQualityCoreMedicationAdministrationNotDone
Title: "MedicationAdministration negation with code example"
Description: "Example of medication not administered using a code to indicate that a particular medication was not administered"
Usage: #example
* id = "negation-with-code-example"
* status = #not-done
* statusReason = $sct#183966005 "Drug treatment not indicated (situation)"
* medicationCodeableConcept = $rxnorm#1594663 "1.2 ML alemtuzumab 10 MG/ML Injection [Lemtrada]"
* subject.reference = "Patient/example"
* context.reference = "Encounter/example"
* supportingInformation.reference = "Condition/example"
* effectivePeriod
  * start = "2015-01-15T14:30:00+01:00"
  * end = "2015-01-15T14:30:00+01:00"
* request.reference = "MedicationRequest/example"
* note.text = "Patient started Bupropion this morning - will administer in a reduced dose tomorrow"
* dosage
  * route = $sct#47625008 "Intravenous route (qualifier value)"
  * dose = 3 'mg' "mg"