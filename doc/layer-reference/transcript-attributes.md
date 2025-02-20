---
title: Transcript attributes
permalink: /doc/transcript-attributes
parent: Detailed field guides
nav_order: 20
last_modified_date: 2025-02-18T13:33:58-05:00
---

# Field guide: {{ page.title }}
{:.no_toc}

{% include page_toc.html collapsible=true open=true %}

{% assign transcript_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'transcript'" %}
{% for attrib in transcript_attr %}
  {% include attribute-entry.html attribute=attrib %}
{% endfor %}
