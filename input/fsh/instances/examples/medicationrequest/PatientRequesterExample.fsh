Instance: patient-requester-example
InstanceOf: USQualityCoreMedicationRequest
Title: "MedicationRequest Patient Requester Example"
Description: "Patient Requester Example"
Usage: #example
* status = #active
* intent = #plan
* medicationReference.reference = "Medication/example"
* subject.reference = "Patient/example"
* authoredOn = "2015-03-25T19:32:52-05:00"
* requester.reference = "Patient/example"
* dosageInstruction
  * timing.repeat
    * frequency = 4
    * period = 2
    * periodUnit = #d
  * site = $sct#447964005
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 20 'mL' "mL"
* dispenseRequest.quantity = 200 'mL' "mL"