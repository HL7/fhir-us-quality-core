{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

{% if profile_notes %}
### USCDI+ Quality Element Support Expectations

Systems are expected to support this profile as part of implementing USCDI+ Quality V2 in FHIR and meeting the conformance requirements of this guide.

The following elements are specifically relevant to USCDI+ Quality V2 data classes and elements. Systems are expected to support these elements as applicable to their role in US Quality Core data exchange. See the [Must Support](must-support.html) section of this guide for more information. These elements are flagged as (USCDI+ Quality) in the formal profile views.

**USCDI+ Quality Elements:**

{: .table-bordered .usqc-generated-table .usqc-profile-uscdi-quality-elements}
| Profile element | Description | USCDI+ Quality Data Element(s) |
|---|---|---|
{% for element in profile_notes.uscdiQualityElements -%}
{%- assign element_path = element.path | replace: "|", "&#124;" -%}
{%- assign element_short = element.short | replace: "|", "&#124;" -%}
{%- capture data_elements -%}{%- for item in element.dataElements -%}{%- assign data_class = item.class | replace: "|", "&#124;" -%}{%- assign data_name = item.name | replace: "|", "&#124;" -%}[{{ data_class }}: {{ data_name }}]({{ item.path }}){%- unless forloop.last %}, {% endunless -%}{%- endfor -%}{%- endcapture -%}
| `{{ element_path }}` | {{ element_short }} | {{ data_elements | strip }} |
{% endfor %}
{% endif %}
