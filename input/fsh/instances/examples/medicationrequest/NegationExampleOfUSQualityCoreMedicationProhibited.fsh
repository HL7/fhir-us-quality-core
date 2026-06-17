Instance: negation-example-of-us-quality-core-medication-prohibited
InstanceOf: USQualityCoreMedicationProhibited
Title: "MedicationProhibited using value set example"
Description: "Example of request not to provide a medication using a value set"
Usage: #example
* id = "negation-example"
* status = #completed
* intent = #order
* category = $medicationrequest-category#community
* doNotPerform = true
* medicationCodeableConcept = $sct#1336006
* subject.reference = "Patient/example"
* authoredOn = "2015-03-25T19:32:52-05:00"
* requester.reference = "Practitioner/example"
* reasonCode = $sct#183966005 "Drug treatment not indicated (situation)"