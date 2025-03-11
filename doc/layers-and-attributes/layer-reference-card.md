---
title: Layers
permalink: /doc/layer-reference-card
parent: Quick reference cards
nav_order: 10
last_modified_date: 2025-02-13T13:44:05-05:00
---

# Quick reference card: {{ page.title }}
{:.no_toc}

To understand what each of these properties mean, check out the [layer typology]({{ '/doc/typology' | relative_url }}).

{% assign layers = site.layers | where_exp: "item", "item.synced.project != 'temp'" %}
{% include layer-props.html layers=layers %}

{: .note .no-collapse }
> This table omits layers in the "temp" project because they're [not meaningful for end-users]({{ '/doc/typology#project' | relative_url }}).
