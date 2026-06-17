Instance: example-gestation
InstanceOf: USQualityCoreSimpleObservation
Title: "Gestation age at birth observation example"
Description: "Example of a gestation age at birth observation"
Usage: #example
* status = #final
* category = $observation-category#exam "exam"
* code = $loinc#76516-4 "Gestational age--at birth"
* subject.reference = "Patient/example-2"
* encounter.reference = "Encounter/example"
* effectiveDateTime = "2022-04-09"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueQuantity = 37 'wk' "week"
