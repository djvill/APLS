---
title: Quick reference card
permalink: /doc/quick-reference-card
parent: Layer reference
nav_order: 40
last_modified_date: 2025-02-05T14:23:59-05:00
---

# Layers: {{ page.title }}
{:.no_toc}


To understand what each of these properties mean, check out the [layer typology]({{ '/doc/typology' | relative_url }}).

{% assign layers = site.layers | where_exp: "item", "item.synced.project != 'temp'" | where_exp: "item", "item.synced.project != 'testing'" %}
{% include layer-props.html layers=layers %}

{: .note .no-collapse }
> This table omits layers in the "temp" and "testing" projects because they're [not meaningful for end-users]({{ '/doc/typology#project' | relative_url }}).
