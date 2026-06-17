Instance: example-of-us-quality-core-body-structure
InstanceOf: USQualityCoreBodyStructure
Title: "BodyStructure example"
Description: "Example of a BodyStructure resource to identify a mass in the spleen"
Usage: #example
* id = "example"
* identifier
  * system = "http://example.org/bodystructure/identifiers"
  * value = "12345"
* active = true
* morphology = $sct#4147007 "Mass (morphologic abnormality)"
  * text = "Splenic mass"
* location = $sct#78961009 "Splenic structure (body structure)"
  * text = "Splenic mass"
* description = "7 cm maximum diameter"
* image
  * contentType = #application/dicom
  * url = "http://imaging.acme.com/wado/server?requestType=WADO&amp;wado_details"
* patient.reference = "Patient/example"