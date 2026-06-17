Instance: example-odh
InstanceOf: USQualityCoreSimpleObservation
Title: "ODH Observation example"
Description: "Example of occupational data added to observation measure"
Usage: #example
* status = #final
* category = $observation-category#social-history "Social History"
* code = $loinc#21843-8 "History of Usual Occupation"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2020-04-09T06:30:00+05:00"
  * end = "2023-10-22T08:30:10+05:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/PHOccupationalDataForHealthODH#29-2099.06.034077 "Radiology Technician (Radiology Tech) [Radiologic Technicians]"
