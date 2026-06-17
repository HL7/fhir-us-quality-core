Instance: example-delivery-date-estimate
InstanceOf: USQualityCoreSimpleObservation
Title: "Delivery date estimated example"
Description: "Example of a delivery date estimate Observation"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#11778-8 "delivery date estimated"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2023-10-22T06:30:00+05:00"
  * end = "2023-10-22T08:30:10+05:00"
* issued = "2023-10-22T07:30:10+05:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueDateTime = "2024-05-01"