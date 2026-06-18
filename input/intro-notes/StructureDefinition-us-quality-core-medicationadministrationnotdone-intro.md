The MedicationAdministration profile defines the conformance expectations for a MedicationAdministration event, regardless of whether it is a positive or negative statement. The MedicationAdministrationDone and MedicationAdministrationNotDone profiles represent the positive and negative statements for a MedicationAdministration event.

To create an expression indicating existence of a MedicationAdministration, use the profile [USQualityCoreMedicationAdministrationDone](StructureDefinition-us-quality-core-medicationadministrationdone.html); to specifically request information that a MedicationAdministration intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreMedicationAdministrationNotDone](StructureDefinition-us-quality-core-medicationadministrationnotdone.html).

For a more complete discussion of representation of negation within US Quality Core and quality improvement artifacts, see the [Negation in US Quality Core](us-quality-core-general-requirements.html#negation-in-us-quality-core) topic.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-medicationadministrationnotdone" %}

{% include profile-us-core-guidance.md profile="us-quality-core-medicationadministrationnotdone" %}
