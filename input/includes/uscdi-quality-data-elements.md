{% assign section = site.data.generated.data_elements %}

<table class="usqc-generated-table usqc-uscdi-quality-data-elements">
  <thead>
    <tr>
      <th>USCDI+ Quality Data Class / Element</th>
      <th>Implement with US Quality Core Profile(s)</th>
      <th>Implement with US Core Profile(s)</th>
    </tr>
  </thead>
  <tbody>
{% for group in section.groups %}
    <tr class="usqc-uscdi-quality-class">
      <th colspan="3" scope="colgroup">{{ group.name | escape }}</th>
    </tr>
{% for item in group.elements %}
{% assign profile_rowspan = 2 %}
{% if item.description != "" %}
{% assign profile_rowspan = 3 %}
{% endif %}
    <tr class="usqc-uscdi-quality-element">
      <th scope="row"><span id="{{ item.dataElementId | escape }}"></span>{{ item.name | escape }}{% if item.note != nil %} <a href="#{{ item.noteId | escape }}">(see note)</a>{% endif %}</th>
      <td rowspan="{{ profile_rowspan }}" class="usqc-uscdi-quality-profile-cell">{% if item.profileOverride != nil %}{{ item.profileOverride | markdownify }}{% elsif item.usQualityCore.size > 0 %}<ul class="usqc-profile-list">{% for profile in item.usQualityCore %}<li><a href="{{ profile.path | escape }}">{{ profile.title | escape }}</a></li>{% endfor %}</ul>{% else %}&mdash;{% endif %}</td>
      <td rowspan="{{ profile_rowspan }}" class="usqc-uscdi-quality-profile-cell">{% if item.usCore.size > 0 %}<ul class="usqc-profile-list">{% for profile in item.usCore %}<li><a href="{{ site.data.fhir.ver.uscore }}/StructureDefinition-{{ profile.id | escape }}.html">{{ profile.title | escape }}</a></li>{% endfor %}</ul>{% else %}&mdash;{% endif %}</td>
    </tr>
{% if item.description != "" %}
    <tr class="usqc-uscdi-quality-description">
      <td>{{ item.description | escape }}</td>
    </tr>
{% endif %}
    <tr class="usqc-uscdi-quality-profile-spacer">
      <td>&nbsp;</td>
    </tr>
{% endfor %}
{% endfor %}
  </tbody>
</table>

{% if section.notes.size > 0 %}
#### Notes

{% for item in section.notes %}
##### {{ item.class }}: {{ item.name }}

{{ item.note }}

{% endfor %}
{% endif %}
