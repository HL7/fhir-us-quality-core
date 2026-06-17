Instance: appropriateness-example
InstanceOf: USQualityCoreServiceRequest
Title: "ServiceRequest appropriateness example"
Description: "ServiceRequest appropriateness example"
Usage: #example
* status = #completed
* intent = #order
* code.coding = $cpt#70450 "Computed tomography, head or brain; without contrast material"
* subject = Reference(Patient/example)
* authoredOn = "2015-03-30"
* requester.display = "Dr. Beverly Crusher"
* reasonCode.coding = $sct#330007 "Occipital headache"
