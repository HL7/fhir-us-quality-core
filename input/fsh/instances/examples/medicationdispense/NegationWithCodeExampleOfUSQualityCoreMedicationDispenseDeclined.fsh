Instance: negation-with-code-example-of-us-quality-core-medication-dispense-declined
InstanceOf: USQualityCoreMedicationDispenseDeclined
Title: "MedicationDispense negation with code example"
Description: "Example of medication not dispensed using a code to indicate the reason"
Usage: #example
* id = "negation-with-code-example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.recorded"
  * valueDateTime = "2017-01-17"
* status = #declined
* statusReasonCodeableConcept = $sct#183966005 "Drug treatment not indicated (situation)"
* medicationCodeableConcept = $rxnorm#1000087 "alcaftadine 2.5 MG/ML [Lastacaft]"
* subject.reference = "Patient/example"
* authorizingPrescription.reference = "MedicationRequest/example"
* dosageInstruction
  * timing.repeat
    * frequency = 3
    * period = 1
    * periodUnit = #d
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 5 'ml' "ml"