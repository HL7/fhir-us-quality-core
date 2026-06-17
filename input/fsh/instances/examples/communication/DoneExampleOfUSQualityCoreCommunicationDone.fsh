Instance: done-example-of-us-quality-core-communication-done
InstanceOf: USQualityCoreCommunicationDone
Title: "CommunicationDone example"
Description: "Example of a notification sent to a patient about an abnormal test result (using the Positive Communication profile)"
Usage: #example
* id = "done-example"
* partOf
  * display = "Serum Potassium Observation"
* status = #on-hold
* statusReason = $communication-not-done-reason#recipient-unavailable
* category = $communication-category#alert
  * text = "Alert"
* medium = $v3-ParticipationMode#WRITTEN "written"
  * text = "written"
* subject.reference = "Patient/example"
* topic.text = "Hyperkalemia"
* encounter.reference = "Encounter/example"
* sent = "2014-12-12T18:01:10-08:00"
* received = "2014-12-12T18:01:11-08:00"
* recipient.reference = "Practitioner/example"
* sender
  * reference = "Organization/example-1"
  * display = "Hendricks County Hospital"
* payload[0].contentString = "Patient 1 has a very high serum potassium value (7.2 mmol/L on 2014-Dec-12 at 5:55 pm)"
* payload[+].contentReference
  * display = "Serum Potassium Observation"
