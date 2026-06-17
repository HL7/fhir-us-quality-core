Instance: example-obstetric-delivery
InstanceOf: USQualityCoreSimpleObservation
Title: "Date and time of obstetric delivery example"
Description: "Example of a obstetric delivery datetime Observation"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#93857-1 "Date and time of obstetric delivery"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2023-10-22T06:30:00+05:00"
  * end = "2023-10-22T08:30:10+05:00"
* issued = "2023-10-22T07:30:10+05:00"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueDateTime = "2023-10-22T07:23:52+05:00"
