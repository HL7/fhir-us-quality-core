Instance: example-preterm-births
InstanceOf: USQualityCoreSimpleObservation
Title: "Number of preterm births obeservation example"
Description: "Example number of preterm births Observation"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#11637-6 "Births.preterm"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2023-10-22T06:30:00+05:00"
  * end = "2023-10-22T08:30:10+05:00"
* issued = "2023-10-22T07:30:10+05:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueInteger = 0