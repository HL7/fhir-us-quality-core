Instance: example-of-us-quality-core-claim-response
InstanceOf: USQualityCoreClaimResponse
Title: "ClaimResponse example"
Description: "Example of a vision claim response"
Usage: #example
* id = "example"
* status = #active
* type = $claim-type#vision
* use = #preauthorization
* patient.reference = "Patient/example"
* created = "2018-02-24"
* insurer.reference = "Organization/example"
* requestor.reference = "Practitioner/example"
* request.reference = "Claim/example"
* outcome = #queued
* item
  * itemSequence = 1
  * adjudication
    * category = $adjudication#submitted
    * amount
      * value = 235.40
      * currency = #USD