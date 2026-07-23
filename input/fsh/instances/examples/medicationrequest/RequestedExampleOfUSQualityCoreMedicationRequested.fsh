Instance: requested-example-of-us-quality-core-medication-requested
InstanceOf: USQualityCoreMedicationRequested
Title: "MedicationRequest positive example"
Description: "Penicillin MedicationRequest Example (using the Positive Profile)"
Usage: #example
* id = "requested-example"
* status = #active
* intent = #order
* medicationReference.reference = "Medication/example"
* subject.reference = "Patient/example"
* authoredOn = "2015-03-25T19:32:52-05:00"
* requester.reference = "Practitioner/example"
* dosageInstruction
  * timing
    * repeat
      * frequency = 3
      * period = 1
      * periodUnit = #d
  * site = $sct#447964005
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 5 'mL' "mL"
* dispenseRequest.quantity = 100 'mL' "mL"