Instance: example-frailty
InstanceOf: USQualityCoreSimpleObservation
Title: "Frailty observation example"
Description: "Example of a frailty observation measure"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#99354-3 "Mobility device or aid is regularly used"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2013-04-02T10:30:10+01:00"
  * end = "2013-04-05T10:30:10+01:00"
* issued = "2013-04-03T15:30:10+01:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueCodeableConcept = $sct#105503008 "Dependence on wheelchair (finding)"