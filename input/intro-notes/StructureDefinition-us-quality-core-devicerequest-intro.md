The FHIR R4 and the US Quality Core DeviceRequest profile describes the request to use of a device by a patient. The device may be any pertinent device specified in the Device resource. Examples of devices that may be requested include a wheelchair, hearing aids, or an insulin pump. The request may lead to the dispensing of the device to the patient or for use by the patient. Orders or recommendations for use of a device for a patient use the ServiceRequest resource.

The DeviceRequest profile defines the conformance expectations for a DeviceRequest, regardless of whether it is a positive or negative statement. The DeviceRequested and DeviceProhibited profiles derive from DeviceRequest and represent the positive and negative statements for a device request.

To create an expression indicating existence of a request for a device use the profile [USQualityCoreDeviceRequested](StructureDefinition-us-quality-core-devicerequested.html); to specifically request information that a DeviceRequest intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreDeviceProhibited](StructureDefinition-us-quality-core-deviceprohibited.html).

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-devicerequest" %}

{% include profile-us-core-guidance.md profile="us-quality-core-devicerequest" %}
