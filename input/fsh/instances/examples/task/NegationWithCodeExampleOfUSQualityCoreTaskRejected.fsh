Instance: negation-with-code-example-of-us-quality-core-task-rejected
InstanceOf: USQualityCoreTaskRejected
Title: "TaskRejected with code example"
Description: "Example of task not done using a code"
Usage: #example
* id = "negation-with-code-example"
* identifier
  * system = "http://www.acme.org/tasks"
  * value = "19009"
* status = #rejected
* statusReason = $sct#275936005 "Patient noncompliance - general (situation)"
* intent = #proposal
* code = $sct#430193006 "Medication reconciliation (procedure)"
* focus.reference = "Procedure/example"
* for.reference = "Patient/example"
* executionPeriod
  * start = "2018-06-11"
  * end = "2018-06-11"