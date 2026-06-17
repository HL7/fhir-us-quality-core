Instance: example-of-us-quality-core-adverse-event
InstanceOf: USQualityCoreAdverseEvent
Title: "AdverseEvent example"
Description: "Example of an allergic reaction adverse event"
Usage: #example
* id = "example"
* identifier
  * system = "http://acme.com/ids/patients/risks"
  * value = "49476534"
* actuality = #actual
* event
  * coding = $sct#725119006 "Generalized rash (disorder)"
* subject
  * reference = "Patient/example"
* date = "2017-01-29T12:34:56+00:00"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* recorder
  * reference = "Practitioner/example"
* suspectEntity
  * instance.reference = "Medication/example"
