Alias: $v3-ObservationInterpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation

Instance: example-of-us-quality-core-simple-observation
InstanceOf: USQualityCoreSimpleObservation
Title: "Observation example"
Description: "Example of Decreased Hemoglobin Observation"
Usage: #example
* id = "example"
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
  * valueCodeableConcept = $sct#33586001 "Sitting position (finding)"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = $loinc#30350-3 "Hemoglobin [Mass/volume] in Venous blood"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* effectivePeriod
  * start = "2013-04-02T10:30:10+01:00"
  * end = "2013-04-05T10:30:10+01:00"
* issued = "2013-04-03T15:30:10+01:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueQuantity = 7.2 'g/dL' "g/dl"
* interpretation = $v3-ObservationInterpretation#L "Low"
  * text = "Below low normal"
* bodySite = $sct#308046002 "Superficial forearm vein"
* method = $sct#120220003 "Injection to forearm"
* derivedFrom.reference = "Observation/example"
* component[0]
  * code
    * coding[0] = $loinc#8480-6 "Systolic blood pressure"
    * coding[+] = $sct#271649006 "Systolic blood pressure"
  * valueQuantity = 107 'mm[Hg]' "mmHg"
  * interpretation = $v3-ObservationInterpretation#N "Normal"
    * text = "Normal"
* component[+]
  * code = $loinc#8462-4 "Diastolic blood pressure"
  * valueQuantity = 60 'mm[Hg]' "mmHg"
  * interpretation = $v3-ObservationInterpretation#L "Low"
    * text = "Below low normal"
