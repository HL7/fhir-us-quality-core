Instance: example-of-us-quality-core-claim
InstanceOf: USQualityCoreClaim
Title: "Claim example"
Description: "Example of a vision claim"
Usage: #example
* id = "example"
* identifier
  * system = "http://example.org/claim"
  * value = "6612346"
* status = #active
* type = $claim-type#vision
* use = #claim
* patient.reference = "Patient/example"
* created = "2014-08-16"
* insurer.reference = "Organization/example"
* provider.reference = "Practitioner/example"
* priority = http://terminology.hl7.org/CodeSystem/processpriority#normal
* prescription.reference = "MedicationRequest/example"
* payee
  * type = http://terminology.hl7.org/CodeSystem/payeetype#provider
  * party.reference = "Practitioner/example"
* careTeam
  * sequence = 1
  * provider.reference = "Practitioner/example"
* diagnosis
  * sequence = 1
  * diagnosisCodeableConcept = http://hl7.org/fhir/sid/icd-10-cm#H44.23
* insurance
  * sequence = 1
  * focal = true
  * coverage.reference = "Coverage/example"
* item
  * sequence = 1
  * careTeamSequence = 1
  * productOrService = $cpt#92014
  * servicedDate = "2014-08-16"
  * unitPrice
    * value = 214.00
    * currency = #USD
  * detail[0]
    * sequence = 1
    * productOrService = $cpt#92340
    * unitPrice
      * value = 100.00
      * currency = #USD
    * net
      * value = 100.00
      * currency = #USD
  * detail[+]
    * sequence = 2
    * productOrService = $cpt#92015
    * quantity.value = 2
    * unitPrice
      * value = 50.00
      * currency = #USD
    * net
      * value = 100.00
      * currency = #USD
  * detail[+]
    * sequence = 3
    * productOrService = $cpt#92370
    * unitPrice
      * value = 200.00
      * currency = #USD
    * factor = 0.07
    * net
      * value = 14.00
      * currency = #USD
