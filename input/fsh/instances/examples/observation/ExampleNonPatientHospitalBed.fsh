Instance: example-non-patient-hospital-bed
InstanceOf: USQualityCoreNonPatientObservation
Title: "Hospital Bed Availability (physical object) Observation Example"
Description: "Example of hospital bed availability nonpatient observation"
Usage: #example
* status = #final
* category = $sct#49062001 "Device (physical object)"
* code = $sct#91537007 "Hospital bed, device (physical object)"
* subject.display = "Hospital Bed"
* effectiveDateTime = "2023-07-07"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueCodeableConcept = $sct#735333005 "Equipment available (finding)"
