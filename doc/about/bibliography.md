---
title: Bibliography
permalink: /doc/bibliography
parent: About APLS
nav_order: 25
last_modified_date: 2026-03-03T15:26:18-05:00
---

# {{ page.title }}
{:.no_toc}

This page includes lists of published academic work that...

- are based on the [original fieldwork](#publications-based-on-original-fieldwork) from which APLS data is drawn
- [use APLS](#publications-that-use-apls)
- are [about APLS itself](#publications-about-apls-itself)

For information about how you should cite APLS in your own work, see [this page]({{ '/doc/citing-contributing' | relative_url }}).

{% include page_toc.html collapsible=true %}

## Publications based on original fieldwork

{: .note .no-collapse }
> APLS includes just a subset of the audio files from this fieldwork (see the [Pittsburgh interviews]({{ '/doc/pittsburgh-interviews' | relative_url }}) page).
> As a result, specific interview excerpts discussed in these publications may not be in APLS, and specific findings discussed in these publications may not replicate in APLS.

{% for entry in site.data.bibliography.original_fieldwork %}
  {% include cite.html style="unified" ref=entry %}
{% endfor %}


## Publications that use APLS


## Publications that are about APLS itself

<style>
#publications-based-on-original-fieldwork ~ p {
  text-indent: 3em hanging;
}
</style>
