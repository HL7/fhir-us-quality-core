Instance: negation-with-code-example-of-procedure
InstanceOf: USQualityCoreProcedureNotDone
Title: "ProcedureNotDone with code example"
Description: "Example of procedure not done using a code"
Usage: #example
* id = "negation-with-code-example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Procedure.recorded"
  * valueDateTime = "2013-04-05T10:30:00-04:00"
* status = #not-done
* statusReason = $sct#35688006 "Complication of medical care (disorder)"
* code.coding = $sct#348681001 "Graduated compression elastic hosiery (physical object)"
  * version = "http://snomed.info/sct/731000124108"
* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* reasonCode = $sct#182890002 "Patient requests alternative treatment"
