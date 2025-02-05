---
title: Detailed field guide
permalink: /doc/detailed-field-guide
parent: Layer reference
nav_order: 20
last_modified_date: 2025-02-05T16:53:43-05:00
---

# Layers: {{ page.title }}
{:.no_toc}

{% assign layers = site.layers | where_exp: "item", "item.synced.project != 'temp'" | where_exp: "item", "item.synced.project != 'testing'" %}

{% comment %}Spoof TOC because {:toc} tag doesn't work with headings in span.layer{% endcomment %}
<details markdown="block">
  <summary>On this page</summary>
  {: .text-delta }
  
  {% for layer in layers %}
  {%- assign layer_name = layer.path | remove: "_layers/" | remove: ".md" -%}
  1. [{{ layer_name }}](#{{ layer_name }})
  {% endfor %}
  
</details>

{% for layer in layers %}
{% assign layer_name = layer.path | remove: "_layers/" | remove: ".md" %}

## <span class="layer">{{ layer_name }}</span>

_{{ layer.synced.short_description }}_
{: .text-gamma .fw-600 }

{% include layer-props.html layers=layer excl_name=true %}

More details coming soon!

{% comment %}
{{ layer.content }}
{% endcomment %}

{% endfor %}
