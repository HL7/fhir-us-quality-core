Instance: example-of-us-quality-core-task
InstanceOf: USQualityCoreTask
Title: "Task general example"
Description: "Task example (using the General Profile)"
Usage: #example
* id = "example"
* identifier
  * system = "http://www.acme.org/tasks"
  * value = "19009"
* status = #accepted
* intent = #proposal
* priority = #routine
* code = $cpt#99483
  * text = "Medication Reconciliation"
* for.reference = "Patient/example"
* executionPeriod
  * start = "2018-06-11"
  * end = "2018-06-11"