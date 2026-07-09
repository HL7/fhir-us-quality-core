{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

{% if profile_notes and profile_notes.usCore %}
Because this profile is derived directly or indirectly from US Core, systems are also expected to support the Must Support and Additional USCDI requirements specified by the US Core profile this profile inherits from. For more information about those requirements, refer to the [{{ profile_notes.usCore.title | escape }}]({{ site.data.fhir.ver.uscore }}/StructureDefinition-{{ profile_notes.usCore.id | escape }}.html#mandatory-and-must-support-data-elements). The [Formal Views](#profile) section also provides the formal summary, definitions, terminology requirements, and mandatory element requirements.
{% endif %}
