Instance: myringotomy-example
InstanceOf: USQualityCoreServiceRequest
Title: "ServiceRequest Myringotomy Procedure example"
Description: "ServiceRequest for Myringotomy Procedure example"
Usage: #example
* status = #on-hold
* intent = #order
* category = $sct#387713003 "Surgical Procedure"
* priority = #routine
* code = $sct#172676009 "Myringotomy and insertion of short-term tympanic ventilation tube (procedure)"
* subject.reference = "Patient/example"
* encounter.reference = "Encounter/example"
* occurrencePeriod
  * start = "2014-02-13"
  * end = "2014-02-13"
* asNeededBoolean = true
* authoredOn = "2014-02-14"
* performerType = $sct#417887005 "Pediatric otolaryngology"
* reasonCode = $sct#65363002 "Otitis media"
