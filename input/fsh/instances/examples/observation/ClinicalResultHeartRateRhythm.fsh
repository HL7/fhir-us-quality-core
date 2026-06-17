Instance: clinical-result-heart-rate-rhythm
InstanceOf: USQualityCoreObservationClinicalResult
Title: "Heart rate rhythm clinical result observation example"
Description: "Example of a Heart rate rhythm clinical result observation"
Usage: #example
* meta
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-name"
    * valueString = "Heart rate rhythm Example"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-description"
    * valueMarkdown = "This is a Heart rate rhythm Example for the *Clinical Result Observation Profile*."
* status = #final
* category = $observation-category#exam "Exam"
  * text = "Exam"
* code = $loinc#8884-9 "Heart rate rhythm"
  * text = "Heart rate rhythm"
* subject.reference = "Patient/example"
* encounter.display = "Cardiology Consult"
* effectiveDateTime = "2021-11-10T16:48:57.246958-08:00"
* performer
  * reference = "Practitioner/example"
  * display = "Practitioner"
* valueString = "Regular (R)"