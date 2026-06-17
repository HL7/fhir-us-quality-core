Instance: done-example-of-us-quality-core-medication-dispense-done
InstanceOf: USQualityCoreMedicationDispenseDone
Title: "MedicationDispense positive example"
Description: "Penicillin MedicationDispense Example (using the Positive Profile)"
Usage: #example
* id = "done-example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.recorded"
  * valueDateTime = "2017-01-17"
* status = #completed
* medicationReference.reference = "Medication/example"
* subject.reference = "Patient/example"
* performer.actor.reference = "Practitioner/example"
* authorizingPrescription.reference = "MedicationRequest/example"
* quantity = 100 'ml' "ml"
* daysSupply = 30 'd' "Day"
* whenPrepared = "2012-05-30T16:20:00+00:00"
* whenHandedOver = "2012-05-31T10:20:00+00:00"
* destination.reference = "Location/example"
* receiver.reference = "Patient/example"
* dosageInstruction
  * timing
    * repeat
      * frequency = 3
      * period = 1
      * periodUnit = #d
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 5 'ml' "ml"
* substitution
  * wasSubstituted = false
  * type = $v3-substanceAdminSubstitution#N "none"
    * text = "No substitution occurred or is permitted."