Instance: negation-example-of-us-quality-core-medication-dispense-declined
InstanceOf: USQualityCoreMedicationDispenseDeclined
Title: "MedicationDispense negation with value set example"
Description: "Example of medication not dispensed using a value set to indicate the reason"
Usage: #example
* id = "negation-example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.recorded"
  * valueDateTime = "2017-01-17"
* status = #declined
* statusReasonCodeableConcept = $sct#183966005 "Drug treatment not indicated (situation)"
* medicationCodeableConcept
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/1.3.6.1.4.1.6997.4.1.2.268.13.35211.1.13.1.999.321"
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
    * doseQuantity = 5 'mL' "mL"
