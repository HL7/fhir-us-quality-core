Instance: example-of-us-quality-core-service-request
InstanceOf: USQualityCoreServiceRequest
Title: "ServiceRequest general example"
Description: "Request for Appendectomy ServiceRequest example (using the General Profile)"
Usage: #example
* id = "example"
* status = #completed
* intent = #order
* category = $sct#387713003 "Surgical Procedure"
* priority = #urgent
* code = $sct#80146002 "Excision of appendix (procedure)"
  * text = "Excision of appendix (procedure)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* occurrencePeriod
  * start = "2013-04-05"
  * end = "2013-04-05"
* asNeededBoolean = true
* authoredOn = "2013-04-04"
* reasonCode = $sct#21522001 "Abdominal pain (finding)"
* bodySite = $sct#66754008 "Appendix structure"