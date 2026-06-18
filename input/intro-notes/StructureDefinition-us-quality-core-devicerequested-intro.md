The DeviceRequest profile defines the conformance expectations for a DeviceRequest, regardless of whether it is a positive or negative statement. The DeviceRequested and DeviceProhibited profiles derive from DeviceRequest and represent the positive and negative statements for a device request.

To create an expression indicating existence of a request for a device use the profile [USQualityCoreDeviceRequested](StructureDefinition-us-quality-core-devicerequested.html); to specifically request information that a DeviceRequest intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreDeviceProhibited](StructureDefinition-us-quality-core-deviceprohibited.html).

Note that the doNotPerform and statuses indicating positive intent are implied by the use of the DeviceRequested profile.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-devicerequested" %}

{% include profile-us-core-guidance.md profile="us-quality-core-devicerequested" %}
