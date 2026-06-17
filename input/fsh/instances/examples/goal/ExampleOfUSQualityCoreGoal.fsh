Instance: example-of-us-quality-core-goal
InstanceOf: USQualityCoreGoal
Title: "Goal example"
Description: "Example of weight loss goal/objective for a patient"
Usage: #example
* id = "example"
* identifier.value = "123"
* lifecycleStatus = #on-hold
* category = http://terminology.hl7.org/CodeSystem/goal-category#dietary
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
  * text = "high"
* description = $loinc#50064-5 "Ideal body weight"
  * text = "Target body weight is 160 to 180 lbs."
* subject
  * reference = "Patient/example"
  * display = "Peter James Chalmers"
* startDate = "2015-04-05"
* target
  * measure = $loinc#3141-9 "Weight Measured"
  * detailRange
    * low = 160 '[lb_av]' "lbs"
    * high = 180 '[lb_av]' "lbs"
  * dueDate = "2016-04-05"
* statusDate = "2016-02-14"
* statusReason = "Patient wants to defer weight loss until after honeymoon."
* expressedBy
  * reference = "Patient/example"
  * display = "Peter James Chalmers"
* addresses.display = "obesity condition"
* outcomeReference
  * reference = "Observation/example"
  * display = "Body Weight Measured"