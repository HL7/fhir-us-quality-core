Instance: negation-example-of-us-quality-core-medication-administration-not-done
InstanceOf: USQualityCoreMedicationAdministrationNotDone
Title: "MedicationAdministration negation with value set example"
Description: "Example of medication not administered using a value set to indicate what was not administered"
Usage: #example
* id = "negation-example"
* status = #not-done
* statusReason = $sct#183966005 "Drug treatment not indicated (situation)"
* medicationCodeableConcept
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.80.16"
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
