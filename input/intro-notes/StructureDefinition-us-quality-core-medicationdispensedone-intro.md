The MedicationDispense profile defines the conformance expectations for a MedicationDispense event, regardless of whether it is a positive or negative statement. The MedicationDispenseDone and MedicationDispenseDeclined profiles represent the positive and negative statements for a MedicationDispense event.

To create an expression indicating existence of a MedicationDispense event, use the profile [USQualityCoreMedicationDispenseDone](StructureDefinition-us-quality-core-medicationdispensedone.html); to specifically request information that a MedicationDispense intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreMedicationDispenseDeclined](StructureDefinition-us-quality-core-medicationdispensedeclined.html).

Note that the statuses indicating positive intent are implied by the use of the MedicationDispenseDone profile.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-medicationdispensedone" %}

{% include profile-us-core-guidance.md profile="us-quality-core-medicationdispensedone" %}
