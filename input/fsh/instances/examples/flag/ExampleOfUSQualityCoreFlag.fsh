Instance: example-of-us-quality-core-flag
InstanceOf: USQualityCoreFlag
Title: "Flag example"
Description: "Warning/Notification when providing care example"
Usage: #example
* id = "example"
* identifier.value = "12345"
* status = #inactive
* category = http://terminology.hl7.org/CodeSystem/flag-category#admin "Administrative"
* code = $sct#165002 "Accident-prone"
  * text = "Patient is accident prone"
* subject
  * reference = "Patient/example"
  * display = "Peter Patient"
* period
  * start = "2024-01-17"
  * end = "2024-12-01"
* author
  * reference = "Practitioner/example"
  * display = "Nancy Nurse"