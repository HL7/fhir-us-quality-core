Instance: example-of-us-quality-core-device-use-statement
InstanceOf: USQualityCoreDeviceUseStatement
Title: "DeviceUseStatement example"
Description: "Example of a record of device use by a patient"
Usage: #example
* id = "example"
* identifier
  * system = "http://example.org/identifiers"
  * value = "51ebb7a9-4e3a-4360-9a05-0cc2d869086f"
* status = #active
* subject.reference = "Patient/example"
* device.display = "ECG device"