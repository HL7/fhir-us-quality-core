Instance: laboratory-result-observation-example-blood-glucose
InstanceOf: USQualityCoreObservationLab
Title: "Glucose Laboratory Result Observation Example"
Description: "Example of a glucose laboratory result observation"
Usage: #example
* meta
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-name"
    * valueString = "Blood Glucose Example"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-description"
    * valueMarkdown = "This is a blood glucose example for the *US Quality Core Observation Lab Profile*."
  * versionId = "1165"
  * lastUpdated = "2016-03-09T15:29:58.328+00:00"
* status = #final
* category[us-core] = $observation-category#laboratory "Laboratory"
  * text = "Laboratory"
* code = $loinc#2339-0 "Glucose Bld-mCnc"
  * text = "Glucose Bld-mCnc"
* subject
  * reference = "Patient/example"
  * display = "Amy Shaw"
* effectiveDateTime = "2005-07-05"
* performer
  * reference = "Organization/example-1"
  * display = "Hendricks Country Hospital"
* valueQuantity
  * value = 76.0
  * system = "http://unitsofmeasure.org"
  * unit = "mg/dL"
* referenceRange
  * low = 40.0 'mg/dL' "mg/dL"
  * high = 109.0 'mg/dL' "mg/dL"
  * type = http://terminology.hl7.org/CodeSystem/referencerange-meaning#normal "Normal Range"
    * text = "Normal Range"
