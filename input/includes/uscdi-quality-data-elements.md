{% assign scope_key = include.scope | default: "inScope" %}
{% assign section = site.data.generated.uscdi_quality_scope.dataElements[scope_key] %}

{: .usqc-generated-table .usqc-uscdi-quality-data-elements}
| USCDI+ Quality Data Class / Element | {{ include.us_quality_core_header }} | {{ include.us_core_header }} |
|---|---|---|
{% for group in section.groups -%}
| **{{ group.name }}** | | |
{% for item in group.elements -%}
{% capture element_name -%}{{ item.name }}{% if item.notes != "" %} [(see note)](#{{ item.noteId }}){% endif %}{%- endcapture -%}
{% capture us_quality_core_profiles -%}{% if item.usQualityCore.size > 0 -%}{% for profile in item.usQualityCore -%}[{{ profile.title }}]({{ profile.path }}){% unless forloop.last %}, {% endunless %}{% endfor -%}{% else -%}&mdash;{% endif -%}{%- endcapture -%}
{% capture us_core_profiles -%}{% if item.usCore.size > 0 -%}{% for profile in item.usCore -%}[{{ profile.title }}]({{ site.data.fhir.ver.uscore }}/StructureDefinition-{{ profile.id }}.html){% unless forloop.last %}, {% endunless %}{% endfor -%}{% else -%}&mdash;{% endif -%}{%- endcapture -%}
| {{ element_name | strip }} | {{ us_quality_core_profiles | strip }} | {{ us_core_profiles | strip }} |
{% endfor -%}
{% endfor %}

{% if section.notes.size > 0 %}
#### Notes

{% for item in section.notes %}
##### {{ item.class }}: {{ item.name }}

{{ item.notes }}

{% endfor %}
{% endif %}
