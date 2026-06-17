Instance: rejected-example
InstanceOf: USQualityCoreTaskRejected
Title: "TaskRejected example rejecting a proposal using a value set"
Description: "Example of a task rejecting a proposal that identifies the requested activity with a value set"
Usage: #example
* identifier
  * system = "http://www.acme.org/tasks"
  * value = "19009"
* status = #rejected
* statusReason = $sct#275936005 "Patient noncompliance - general (situation)"
* intent = #proposal
* code = $task-code#fulfill "Fulfill the focal request"
* focus.reference = "ServiceRequest/proposal-example"
* for.reference = "Patient/example"
* executionPeriod
  * start = "2018-06-11"
  * end = "2018-06-11"