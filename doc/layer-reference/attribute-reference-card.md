---
title: Attributes
permalink: /doc/attribute-reference-card
parent: Quick reference cards
nav_order: 20
last_modified_date: 2025-02-19T10:56:58-05:00
---

# Quick reference card: {{ page.title }}
{:.no_toc}

To understand what each of these properties mean, check out the [attribute typology]({{ '/doc/attribute-typology' | relative_url }}).

{% assign transcript_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'transcript'" %}
{% assign participant_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'participant'" %}
{% assign main_participant_attr = site.attributes | where_exp: "item", "item.synced.attribute == 'main_participant'" %}
{% assign attributes = transcript_attr | concat: participant_attr | concat: main_participant_attr %}
{% include attribute-props.html attributes=attributes %}
