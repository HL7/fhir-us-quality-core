Instance: negation-example-of-us-quality-core-communication-not-done
InstanceOf: USQualityCoreCommunicationNotDone
Title: "Communication negation example"
Description: "Example of a notification that was not sent to a patient and reason why"
Usage: #example
* id = "negation-example"
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/event-recorded"
  * valueDateTime = "2014-12-12T18:01:10-08:00"
* status = #not-done
* statusReason = $sct#184081006 "Patient has moved away (finding)"
* category = $communication-category#alert
  * text = "Alert"
* medium = $v3-ParticipationMode#WRITTEN "written"
  * text = "written"
* subject.reference = "Patient/example"
* topic = http://terminology.hl7.org/CodeSystem/communication-topic#progress-update "Progress Update"
* encounter.reference = "Encounter/example"
* sent = "2014-12-12T18:01:10-08:00"
* received = "2014-12-12T18:01:11-08:00"
* recipient.reference = "Practitioner/example"
* sender
  * reference = "Organization/example-1"
  * display = "Hendricks County Hospital"
* payload.contentString = "Patient example has moved away"
