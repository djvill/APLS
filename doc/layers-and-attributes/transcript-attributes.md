---
title: Transcript attributes
permalink: /doc/transcript-attributes
parent: Detailed field guides
nav_order: 20
last_modified_date: 2025-03-24T12:20:49-04:00
---

# Field guide: {{ page.title }}
{:.no_toc}

This page contains information on <span class="keyterm">transcript attributes</span>.
For more information about how attributes work, and what the columns in the following tables mean, read the [attribute typology]({{ '/doc/attribute-typology' | relative_url }}).

{% include page_toc.html collapsible=true open=true %}

{% assign transcript_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'transcript'" %}
{% for attrib in transcript_attr %}
  {% include attribute-entry.html attribute=attrib %}
{% endfor %}
