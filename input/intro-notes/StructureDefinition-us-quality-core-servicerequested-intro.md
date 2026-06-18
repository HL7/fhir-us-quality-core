The ServiceRequest profile defines the conformance expectations for a ServiceRequest, regardless of whether it is a positive or negative statement. The ServiceRequested and ServiceNotRequested profiles represent the positive and negative statements for a service request.

To create an expression indicating the existence of a service request, use the profile [USQualityCoreServiceRequested](StructureDefinition-us-quality-core-servicerequested.html); to specifically request information that a ServiceRequest intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreServiceProhibited](StructureDefinition-us-quality-core-serviceprohibited.html).

Note that the doNotPerform and statuses indicating positive intent are implied by the use of the ServiceRequested profile.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-servicerequested" %}

{% include profile-us-core-guidance.md profile="us-quality-core-servicerequested" %}
