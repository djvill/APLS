---
title: Quick reference card
layout: default
permalink: /doc/quick-reference-card
parent: Layer reference
nav_order: 40
last_modified_date: 2024-11-20T18:19:34-05:00
---

# Layers: {{ page.title }}
{:.no_toc}

{% assign layers = site.layers %}
{% assign layers = layers | where_exp: "item", "item.synced.project != 'temp'" | where_exp: "item", "item.synced.project != 'testing'" %}

To understand what each of these properties mean, check out the [layer typology]({{ '/doc/typology' | relative_url }}).

<table class="layer-props">
  <thead>
    <tr>
      <th>Layer</th>
      <th>Scope</th>
      <th>Alignment</th>
      <th>Vertical peers</th>
      <th>Data type</th>
      <th>Primary notation</th>
      <th>Alignment-dependent</th>
      <th>Project</th>
    </tr>
  </thead>
  <tbody>
    {% for layer in layers %}
      <tr>
        <td><span class="layer">{{ layer.path | remove: "_layers/" | remove: ".md" }}</span></td>
        <td>{{ layer.synced.scope | capitalize }}</td>
        <td>{{ layer.synced.alignment | capitalize }}</td>
        <td>{{ layer.synced.vertical_peers | capitalize }}</td>
        <td>{{ layer.synced.data_type | capitalize }}</td>
        <td>{{ layer.notation.primary }}</td>
        <td>{{ layer.alignment_dependent | capitalize }}</td>
        <td>{{ layer.synced.project }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>

