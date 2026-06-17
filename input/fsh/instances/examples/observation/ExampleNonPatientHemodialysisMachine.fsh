Instance: example-non-patient-hemodialysis-machine
InstanceOf: USQualityCoreNonPatientObservation
Title: "Hemodialysis Machine Availability (physical object) Observation Example"
Description: "Example of hempdialysis machine availability nonpatient observation"
Usage: #example
* status = #final
* category = $sct#49062001 "Device (physical object)"
* code = $sct#36965003 "Hemodialysis machine, device (physical object)"
* subject.display = "Hemodialysis machine"
* effectiveDateTime = "2023-07-07"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueCodeableConcept = $sct#735333005 "Equipment available (finding)"
