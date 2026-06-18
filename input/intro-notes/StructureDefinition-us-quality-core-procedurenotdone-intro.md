The Procedure profile defines the conformance expectations for a Procedure, regardless of whether it is a positive or negative statement. The ProcedureDone and ProcedureNotDone profiles represent the positive and negative statements for a procedure.

To create an expression indicating existence of a procedure, use the profile [USQualityCoreProcedureDone](StructureDefinition-us-quality-core-proceduredone.html); to specifically request information that a procedure intentionally did not occur for a medical, patient or system reason, use the profile [USQualityCoreProcedureNotDone](StructureDefinition-us-quality-core-procedurenotdone.html).

For a more complete discussion of representation of negation within US Quality Core and quality improvement artifacts, see the [Negation in US Quality Core](us-quality-core-general-requirements.html#negation-in-us-quality-core) topic.

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-procedurenotdone" %}

{% include profile-us-core-guidance.md profile="us-quality-core-procedurenotdone" %}
