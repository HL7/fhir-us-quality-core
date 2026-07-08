{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

{% if profile_notes %}
### USCDI+ Quality Element Support Expectations

Systems are expected to support this profile as part of implementing USCDI+ Quality V2 in FHIR and meeting the conformance requirements of this guide.

The following elements are specifically relevant to USCDI+ Quality V2 data classes and elements. Systems are expected to support these elements as applicable to their role in US Quality Core data exchange. See the [Must Support](must-support.html) section of this guide for more information. These elements are flagged as (USCDI+ Quality) in the formal profile views.

**USCDI+ Quality Elements:**

{: .usqc-uscdi-quality-elements}
{% for element in profile_notes.uscdiQualityElements -%}
{% assign element_short = element.short | replace: "|", "&#124;" -%}
- {{ element.path }}: {{ element_short }}
{% endfor %}
{% endif %}
