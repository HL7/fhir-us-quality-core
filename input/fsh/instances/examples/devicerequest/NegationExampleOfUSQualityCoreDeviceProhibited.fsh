Instance: negation-example-of-us-quality-core-device-prohibited
InstanceOf: USQualityCoreDeviceProhibited
Title: "DeviceRequest negation with value set example"
Description: "Example of a request not to employ any of a class of medical devices"
Usage: #example
* id = "negation-example"
* modifierExtension[doNotPerform]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DeviceRequest.doNotPerform"
  * valueBoolean = true
* status = #completed
* intent = #original-order
* codeCodeableConcept
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.230"
  * text = "Value Set: Venous Foot Pumps (VFP)"
* subject.reference = "Patient/example"
* authoredOn = "2016-04-05T09:20:00-04:00"
* reasonCode = $sct#182890002 "Patient requests alternative treatment"
