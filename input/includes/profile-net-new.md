{% assign profile_notes = site.data.generated.profile_notes[include.profile] %}

### Net New in US Quality Core

{% if profile_notes.usCore %}
Additional support and changes from [{{ profile_notes.usCore.title | escape }}]({{ site.data.fhir.ver.uscore }}/StructureDefinition-{{ profile_notes.usCore.id | escape }}.html). Select an element for its full definition.

{% assign new_elements = profile_notes.netNewRequirements %}
{% if new_elements.size > 0 %}
<table class="table table-bordered usqc-generated-table">
  <caption class="assistive-text">Additional support and constraint changes from US Core</caption>
  <thead><tr><th scope="col" style="width:30%">Profile element</th><th scope="col">Change from US Core</th></tr></thead>
  <tbody>
    {% for element in new_elements %}
    <tr>
      <th scope="row"><a href="StructureDefinition-{{ include.profile | escape }}-definitions.html#{{ profile_notes.search.resource | escape }}{% if element.path != empty %}.{{ element.path | escape }}{% endif %}"><code>{{ element.path | default: profile_notes.search.resource | escape }}</code></a></th>
      <td>
        <ul style="margin:0; padding-left:1.25em">
          {% for change in element.changes %}
          <li>{{ change.text | default: change | escape }}{% if change.profiles %} (now {% for profile in change.profiles -%}
              {% if profile.path %}<a href="{{ profile.path | escape }}">{{ profile.title | escape }}</a>{% else %}{{ profile.title | escape }}{% endif %}{% unless forloop.last %}, {% endunless -%}
            {% endfor %}){% endif %}</li>
          {% endfor %}
        </ul>
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>

For nested elements, cardinality applies when the parent element is present.
{% else %}
No differences found in the compared requirements.
{% endif %}
{% else %}
This profile has no US Core base profile. See its [support expectations](#element-conformance-indicators-by-profile-layer).
{% endif %}
