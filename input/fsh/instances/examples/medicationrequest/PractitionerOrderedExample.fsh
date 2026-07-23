Instance: practitioner-ordered-example
InstanceOf: USQualityCoreMedicationRequest
Title: "MedicationRequest Practitioner Ordered Example"
Description: "Practitioner Ordered Example"
Usage: #example
* status = #active
* intent = #order
* medicationReference.reference = "Medication/example"
* subject.reference = "Patient/example"
* authoredOn = "2015-03-25T19:32:52-05:00"
* requester.reference = "Practitioner/example"
* dosageInstruction
  * timing.repeat
    * frequency = 5
    * period = 2
    * periodUnit = #d
  * site = $sct#447964005
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 10 'mL' "mL"
* dispenseRequest.quantity = 1000 'mL' "mL"