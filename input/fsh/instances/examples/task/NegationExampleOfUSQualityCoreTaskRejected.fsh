Instance: negation-example-of-us-quality-core-task-rejected
InstanceOf: USQualityCoreTaskRejected
Title: "TaskRejected with value set example"
Description: "Example of task not done using a value set"
Usage: #example
* id = "negation-example"
* identifier
  * system = "http://www.acme.org/tasks"
  * value = "19009"
* status = #rejected
* statusReason = $sct#275936005 "Patient noncompliance - general (situation)"
* intent = #proposal
* code
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/codeOptions"
    * valueCanonical = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1096.11"
  * text = "Interventions Related to Medication Management, Medication Reconciliation"
* focus.reference = "Procedure/example"
* for.reference = "Patient/example"
* executionPeriod
  * start = "2018-06-11"
  * end = "2018-06-11"