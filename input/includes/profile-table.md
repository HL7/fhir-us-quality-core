{% assign resources = site.data.generated.profile_table.resources %}

{: .list .usqc-generated-table .usqc-profile-table}
| US Quality Core Profile | US Core Profile | FHIR Resource |
|---|---|---|
{% for resource in resources -%}
| **{{ resource.name }}** | | |
{% for profile in resource.profiles -%}
{% capture indent -%}
{% for level in (0..profile.depth) -%}&emsp; {% endfor -%}
{%- endcapture -%}

{% capture us_quality_core_profile -%}
{% if profile.path -%}
{{ indent }}[{{ profile.title }}]({{ profile.path }})
{% else -%}
&mdash;
{% endif -%}
{%- endcapture -%}

{% capture us_core_profile -%}
{% if profile.usCore -%}
[{{ profile.usCore.title }}]({{ site.data.fhir.ver.uscore }}/StructureDefinition-{{ profile.usCore.id }}.html)
{% else -%}
&mdash;
{% endif -%}
{%- endcapture -%}

{% capture fhir_resource -%}
{% if profile.showResource -%}
&emsp; [{{ resource.name }}]({{ site.data.fhir.path }}{{ resource.path }})
{% else -%}
&mdash;
{% endif -%}
{%- endcapture -%}

| {{ us_quality_core_profile | strip }} | {{ us_core_profile | strip }} | {{ fhir_resource | strip }} |
{% endfor -%}
{% endfor -%}
