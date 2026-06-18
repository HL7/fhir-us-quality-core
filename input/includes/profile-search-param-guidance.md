{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}
{% assign search = profile_notes.search %}
{% assign search_params = search.searchParams %}
{% assign search_combinations = search.searchCombinations %}

{% if search and search.hasSearchParameters %}
### Search Parameter Expectations

The following search parameters are defined for the underlying `{{ search.resource }}` resource in the [US Quality Core Server CapabilityStatement](CapabilityStatement-us-quality-core-server.html).

{% if search_params.size > 0 %}
**Individual Search Parameters**

{: .usqc-generated-table .usqc-search-param-table}
| Name | Expectation |
|---|---|
{% for search_param in search_params -%}
| `{{ search_param.name }}` | {{ search_param.expectation }} |
{% endfor %}
{% endif %}

{% if search_combinations.size > 0 %}
**Search Parameter Combinations**

{: .usqc-generated-table .usqc-search-param-table}
| Name | Expectation |
|---|---|
{% for combination in search_combinations -%}
| `{{ combination.name }}` | {{ combination.expectation }} |
{% endfor %}
{% endif %}
{% endif %}
