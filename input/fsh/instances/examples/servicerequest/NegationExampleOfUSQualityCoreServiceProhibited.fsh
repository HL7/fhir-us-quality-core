Instance: negation-example-of-us-quality-core-service-prohibited
InstanceOf: USQualityCoreServiceProhibited
Title: "ServiceProhibited with value set example"
Description: "Example of request not to provide a service using a value set"
Usage: #example
* id = "negation-example"
* status = #completed
* intent = #order
* category = $sct#387713003 "Surgical Procedure"
* priority = #urgent
* doNotPerform = true
* code
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.214"
  * text = "Value Set: Intermittent pneumatic compression devices (IPC)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* occurrenceDateTime = "2013-04-05"
* authoredOn = "2013-04-04"
* reasonCode = $sct#416406003 "Procedure discontinued (situation)"
* bodySite = $sct#66754008 "Appendix structure"