{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

{% if profile_notes %}
{% if profile_notes.hasUscdiQualityElements %}
{% include uscdi-quality-elements-guidance.md %}

**USCDI+ Quality Elements:**

{: .usqc-uscdi-quality-elements}
{% for element in profile_notes.uscdiQualityElements -%}
{% assign element_short = element.short | replace: "|", "&#124;" -%}
- {{ element.path }}: {{ element_short }}
{% endfor %}
{% else %}
{% include uscdi-quality-no-elements-guidance.md %}
{% endif %}
{% endif %}
