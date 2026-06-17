Instance: proposal-example
InstanceOf: USQualityCoreServiceRequested
Title: "ServiceRequest positive example with a value set"
Description: "Request for Intermittent pneumatic compression devices using a value set example (using the Positive Profile)"
Usage: #example
* status = #active
* intent = #proposal
* category = $sct#387713003 "Surgical Procedure"
* priority = #urgent
* code
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.214"
  * text = "Value Set: Intermittent pneumatic compression devices (IPC)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* occurrenceDateTime = "2013-04-05"
* authoredOn = "2013-04-04"