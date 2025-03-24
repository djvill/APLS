---
title: Participant attributes
permalink: /doc/participant-attributes
parent: Detailed field guides
nav_order: 30
last_modified_date: 2025-03-24T12:20:49-04:00
---

# Field guide: {{ page.title }}
{:.no_toc}

This page contains information on <span class="keyterm">participant attributes</span>.
For more information about how attributes work, and what the columns in the following tables mean, read the [attribute typology]({{ '/doc/attribute-typology' | relative_url }}).

{% include page_toc.html collapsible=true open=true %}

{% assign participant_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'participant'" %}
{% for attrib in participant_attr %}
  {% include attribute-entry.html attribute=attrib %}
{% endfor %}
