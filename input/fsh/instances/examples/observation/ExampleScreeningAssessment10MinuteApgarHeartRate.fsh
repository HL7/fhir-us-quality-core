Instance: example-screening-assessment-10-minute-apgar-heart-rate
InstanceOf: USQualityCoreObservationScreeningAssessment
Title: "10 minute Apgar Heart Rate Observation Screening Assessment Example"
Description: "Example of a 10 minute Apgar Heart Rate Observation Screening Assessment"
Usage: #example
* meta
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-name"
    * valueString = "10 minute Apgar Heart Rate Screening Assessment Example"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-description"
    * valueMarkdown = "This example of a US Quality Core Observation Screening Assessment Profile illustrates its use to directly capture individual screening assessment items as an observation. It is not derived from a FHIR QuestionnaireResponse."
* status = #final
* category[survey] = $observation-category#survey "Survey"
  * text = "Survey"
* code = $loinc#32402-0 "10 minute Apgar Heart Rate"
  * text = "Apgar respiratory effort score"
* subject.reference = "Patient/infant-example"
* effectiveDateTime = "2016-05-18T22:33:22+00:00"
* performer.reference = "Practitioner/example"
* valueCodeableConcept
  * coding = $loinc#LA6718-6 "At least 100 beats per minute"
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/itemWeight"
      * valueDecimal = 2
  * text = "2. At least 100 beats per minute"
