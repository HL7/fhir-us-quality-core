The MedicationDispense profile defines the conformance expectations for a MedicationDispense event, regardless of whether it is a positive or negative statement. The MedicationDispenseDone and MedicationDispenseDeclined profiles represent the positive and negative statements for a MedicationDispense event.

To create an expression indicating existence of a MedicationDispense event, use the profile [USQualityCoreMedicationDispenseDone](StructureDefinition-us-quality-core-medicationdispensedone.html); to specifically request information that a MedicationDispense intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreMedicationDispenseDeclined](StructureDefinition-us-quality-core-medicationdispensedeclined.html).

For a more complete discussion of representation of negation within US Quality Core and quality improvement artifacts, see the [Negation in US Quality Core](us-quality-core-general-requirements.html#negation-in-us-quality-core) topic.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-medicationdispensedeclined" %}

{% include profile-us-core-guidance.md profile="us-quality-core-medicationdispensedeclined" %}
