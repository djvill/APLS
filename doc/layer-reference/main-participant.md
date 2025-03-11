---
title: '<span class="main_participant-attr">main_participant</span>'
permalink: /doc/main_participant
parent: Detailed field guides
nav_order: 40
last_modified_date: 2025-03-11T10:37:59-04:00
---

# Field guide: <span class="main_participant-attr">main_participant</span>
{:.no_toc}

<span class="main_participant-attr">main_participant</span> gets its own category because, unlike all other attributes, it's a property of _both_ the participant _and_ the transcript.
For more information about how attributes work, and what the columns in the following table means, read the [attribute typology]({{ '/doc/attribute-typology' | relative_url }}).

{% assign main_participant_attr = site.attributes | where_exp: "item", "item.synced.attribute == 'main_participant'" %}

{% for attrib in main_participant_attr %}
  {% include attribute-props.html attributes=attrib excl_name=true excl_scope=true excl_descrip=true %}

  {{ attrib.content }}
{% endfor %}
