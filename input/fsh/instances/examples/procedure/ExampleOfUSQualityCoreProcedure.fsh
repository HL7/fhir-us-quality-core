Instance: example-of-us-quality-core-procedure
InstanceOf: USQualityCoreProcedure
Title: "Procedure general example"
Description: "Appendectomy Procedure example (using the General Profile)"
Usage: #example
* id = "example"
* extension
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Procedure.recorded"
  * valueDateTime = "2013-04-05T09:35:00-04:00"
* status = #completed
* code = $sct#80146002 "Excision of appendix (procedure)"
  * text = "Excision of appendix (procedure)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* performedPeriod
  * start = "2013-04-05T09:20:00-04:00"
  * end = "2013-04-05T10:30:00-04:00"
* performer.actor
  * reference = "Practitioner/example"
  * display = "Dr Cecil Surgeon"
* reasonCode = $sct#21522001 "Abdominal pain (finding)"
* bodySite = $sct#66754008 "Appendix structure"
* report.reference = "DiagnosticReport/example"