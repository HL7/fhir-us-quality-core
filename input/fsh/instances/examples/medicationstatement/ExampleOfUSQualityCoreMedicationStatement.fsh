Instance: example-of-us-quality-core-medication-statement
InstanceOf: USQualityCoreMedicationStatement
Title: "MedicationStatment example"
Description: "Penicillin MedicationStatement Example"
Usage: #example
* id = "example"
* status = #active
* medicationReference.reference = "Medication/example"
* subject.reference = "Patient/example"
* effectiveDateTime = "2012-06-01T14:30:00+14:00"
* dateAsserted = "2012-05-14T15:00:00+14:00"
* informationSource.reference = "Practitioner/example"
* derivedFrom.reference = "MedicationRequest/example"
* dosage
  * timing.repeat
    * frequency = 3
    * period = 1
    * periodUnit = #d
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate.doseQuantity = 10 'ml' "ml"