{% assign scope_key = include.scope | default: "inScope" %}
{% assign profiles = site.data.generated.uscdi_quality_scope.profiles[scope_key] %}

{% for profile in profiles -%}
- [{{ profile.title }}]({{ profile.path }})
{% endfor %}
