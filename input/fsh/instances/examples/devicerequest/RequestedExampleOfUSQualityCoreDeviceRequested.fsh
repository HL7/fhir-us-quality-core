Instance: requested-example-of-us-quality-core-device-requested
InstanceOf: USQualityCoreDeviceRequested
Title: "DeviceRequest positive example"
Description: "Example of a request to employ a medical device (using the Positive Profile)"
Usage: #example
* id = "requested-example"
* status = #completed
* intent = #original-order
* codeCodeableConcept = $sct#86184003 "Electrocardiographic monitor and recorder"
  * text = "ECG"
* subject
  * reference = "Patient/example"
  * display = "Patient/example"