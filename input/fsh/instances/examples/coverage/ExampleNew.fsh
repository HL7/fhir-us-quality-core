Instance: example-new
InstanceOf: USQualityCoreCoverage
Title: "Coverage example - Subscriber ID"
Description: "Example of a coverage resource used to provide information about an individual's specific plan with a Subscriber Id"
Usage: #example
* identifier.type = $v2-0203#MB
* status = #active
* type = $sopt#59 "Other Private Insurance"
* policyHolder.reference = "Patient/example"
* subscriber.reference = "Patient/example"
* subscriberId = "12191"
* beneficiary.reference = "Patient/example"
* dependent = "0"
* relationship = $subscriber-relationship#self
* period
  * start = "2011-05-23"
  * end = "2012-05-23"
* payor.reference = "Organization/example"
* order = 9
