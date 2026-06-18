The MedicationRequest profile defines the conformance expectations for a MedicationRequest, regardless of whether it is a positive or negative statement. The MedicationRequested and MedicationNotRequested profiles represent the positive and negative statements for a medication order.

To create an expression indicating the existence of a medication request, use the profile [USQualityCoreMedicationRequested](StructureDefinition-us-quality-core-medicationrequested.html); to specifically request information that a MedicationRequest intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreMedicationProhibited](StructureDefinition-us-quality-core-medicationprohibited.html).

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-medicationrequest" %}

{% include profile-us-core-guidance.md profile="us-quality-core-medicationrequest" %}
