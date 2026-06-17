Instance: example-pregnancies
InstanceOf: USQualityCoreSimpleObservation
Title: "Number of pregnancies obeservation example"
Description: "Example number of pregnancies Observation"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#11996-6 "Pregnancies"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2023-10-22T06:30:00+05:00"
  * end = "2023-10-22T08:30:10+05:00"
* issued = "2023-10-22T07:30:10+05:00"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueInteger = 4
