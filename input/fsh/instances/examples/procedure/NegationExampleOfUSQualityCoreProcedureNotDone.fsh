Instance: negation-example-of-us-quality-core-procedure-not-done
InstanceOf: USQualityCoreProcedureNotDone
Title: "ProcedureNotDone with value set example"
Description: "Example of procedure not done using a value set"
Usage: #example
* id = "negation-example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Procedure.recorded"
  * valueDateTime = "2013-04-05T10:30:00-04:00"
* status = #not-done
* statusReason = $sct#35688006 "Complication of medical care (disorder)"
* code
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.214"
  * text = "Value Set: Intermittent pneumatic compression devices (IPC)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* reasonCode = $sct#182890002 "Patient requests alternative treatment"