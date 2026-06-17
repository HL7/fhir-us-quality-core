Instance: elective-example
InstanceOf: USQualityCoreServiceRequest
Title: "ServiceRequest elective example"
Description: "Elective procedure ServiceRequest example"
Usage: #example
* status = #completed
* intent = #order
* code = $sct#442338001 "Bypass of stomach (procedure)"
  * text = "Stomach Bypass"
* subject = Reference(Patient/example)
* authoredOn = "2015-03-30"
* requester.display = "Dr. Beverly Crusher"
* performer = Reference(Practitioner/example) "Dr Cecil Surgeon"
