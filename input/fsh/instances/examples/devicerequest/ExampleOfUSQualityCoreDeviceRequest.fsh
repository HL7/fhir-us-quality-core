Instance: example-of-us-quality-core-device-request
InstanceOf: USQualityCoreDeviceRequest
Title: "DeviceRequest general example"
Description: "Request to employ a medical device (using the General Profile)"
Usage: #example
* id = "example"
* status = #completed
* intent = #original-order
* codeCodeableConcept = $sct#86184003 "Electrocardiographic monitor and recorder"
  * text = "ECG"
* subject
  * reference = "Patient/example"
  * display = "Patient/example"