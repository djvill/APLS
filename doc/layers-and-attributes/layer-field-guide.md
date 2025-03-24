---
title: Layers
permalink: /doc/layer-field-guide
parent: Detailed field guides
nav_order: 10
last_modified_date: 2025-03-24T12:22:15-04:00
---

# Field guide: {{ page.title }}
{:.no_toc}

This page contains detailed descriptions of annotation <span class="keyterm">layers</span>.
For more information about how layers work, and what the columns in the following tables mean, read the [layer typology]({{ '/doc/layer-typology' | relative_url }}).

{: .note .no-collapse }
> Layers in the "temp" project aren't meaningful for end-users, so they're not included on this page

{% include page_toc.html collapsible=true open=true %}

{% assign layers = site.layers | where_exp: "item", "item.synced.project != 'temp'" %}
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
