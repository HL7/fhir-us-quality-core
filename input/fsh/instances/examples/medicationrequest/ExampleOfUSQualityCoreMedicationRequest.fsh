Instance: example-of-us-quality-core-medication-request
InstanceOf: USQualityCoreMedicationRequest
Title: "MedicationRequest general example"
Description: "Penicillin MedicationRequest Example (using the General Profile)"
Usage: #example
* id = "example"
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
    * doseQuantity = 5 'ml' "ml"
* dispenseRequest.quantity = 100 'ml' "ml"