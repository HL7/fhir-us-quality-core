Instance: example-non-patient-mechanical-ventilator
InstanceOf: USQualityCoreNonPatientObservation
Title: "Mechanical Ventilator Availability (physical object) Observation Example"
Description: "Example of mechanical ventilator availability nonpatient observation"
Usage: #example
* status = #final
* category = $sct#49062001 "Device (physical object)"
* code = $sct#449071006 "Mechanical ventilator (physical object)"
* subject.display = "Ventilator"
* effectiveDateTime = "2023-07-07"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueCodeableConcept = $sct#735333005 "Equipment available (finding)"
