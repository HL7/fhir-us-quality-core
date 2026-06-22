Instance: example-of-us-quality-core-coverage
InstanceOf: USQualityCoreCoverage
Title: "Coverage example"
Description: "Example of a coverage resource used to provide information about an individual's specific plan"
Usage: #example
* id = "example"
* identifier.type = $v2-0203#MB
* status = #active
* policyHolder.reference = "Patient/example"
* subscriber.reference = "Patient/example"
* beneficiary.reference = "Patient/example"
* dependent = "0"
* relationship = $subscriber-relationship#self
* period
  * start = "2011-05-23"
  * end = "2012-05-23"
* payor.reference = "Organization/example"
* order = 9
