Instance: example-of-us-quality-core-communication-request
InstanceOf: USQualityCoreCommunicationRequest
Title: "CommunicationRequest example"
Description: "Example of a request to provide additional information for a claim"
Usage: #example
* id = "example"
* identifier
  * system = "http://example.org/insurer/123456"
  * value = "ABC123"
* basedOn.display = "EligibilityRequest"
* replaces.display = "prior CommunicationRequest"
* groupIdentifier.value = "12345"
* status = #active
* category = $communication-category#notification
* priority = #routine
* medium = $v3-ParticipationMode#WRITTEN "written"
  * text = "written"
* encounter.reference = "Encounter/example"
* payload.contentString = "Please provide the accident report and any associated pictures to support your Claim #DEF5647."
* occurrenceDateTime = "2016-06-10T11:01:10-08:00"
* authoredOn = "2016-06-10T11:01:10-08:00"
* requester.reference = "Practitioner/example"
* recipient.reference = "Organization/example"
* sender.reference = "Patient/example"