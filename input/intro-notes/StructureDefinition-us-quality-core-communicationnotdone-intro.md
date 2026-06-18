The Communication profile defines the conformance expectations for a Communication event, regardless of whether it is a positive or negative statement.

The CommunicationDone and CommunicationNotDone profiles represent the positive and negative statements for a communication event.

To create an expression indicating existence of a communication, use the profile [USQualityCoreCommunicationDone](StructureDefinition-us-quality-core-communicationdone.html); to specifically request information that a communication intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreCommunicationNotDone](StructureDefinition-us-quality-core-communicationnotdone.html).

For a more complete discussion of representation of negation within US Quality Core and quality improvement artifacts, see the [Negation in US Quality Core](us-quality-core-general-requirements.html#negation-in-us-quality-core) topic.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-communicationnotdone" %}

{% include profile-us-core-guidance.md profile="us-quality-core-communicationnotdone" %}
