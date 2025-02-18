---
title: Participant attributes
permalink: /doc/participant-attributes
parent: Detailed field guides
nav_order: 30
last_modified_date: 2025-02-18T13:33:57-05:00
---

# Field guide: {{ page.title }}
{:.no_toc}

{% include page_toc.html collapsible=true open=true %}

{% assign participant_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'participant'" %}
{% for attrib in participant_attr %}
  {% include attribute-entry.html attribute=attrib %}
{% endfor %}
