Instance: negation-with-code-example-of-us-quality-core-device-prohibited
InstanceOf: USQualityCoreDeviceProhibited
Title: "DeviceRequest negation with code example"
Description: "Example of a request not to employ a specific medical device"
Usage: #example
* id = "negation-with-code-example"
* modifierExtension[doNotPerform]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DeviceRequest.doNotPerform"
  * valueBoolean = true
* status = #completed
* intent = #original-order
* codeCodeableConcept.coding = $sct#442023007 "Venous foot pump, device (physical object)"
  * version = "http://snomed.info/sct/731000124108"
* subject.reference = "Patient/example"
* authoredOn = "2016-04-05T09:20:00-04:00"
* reasonCode = $sct#182890002 "Patient requests alternative treatment"
