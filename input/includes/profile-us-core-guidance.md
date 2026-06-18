{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

{% if profile_notes and profile_notes.hasUsCoreLineage %}
Because this profile is derived directly or indirectly from US Core, systems are also expected to support Must Support requirements and (USCDI) flagged elements inherited through its US Core lineage. The [Formal Views](#profile) section also provides the formal summary, definitions, terminology requirements, and mandatory element requirements.
{% endif %}
