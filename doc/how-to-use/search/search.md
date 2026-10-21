---
title: Searching the corpus 
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2026-10-21T16:20:43-04:00
---

# {{ page.title }}
{:.no_toc}

<!-- 
can generally use more screengrabs throughout (probably after the new UI is live)
also the deictic descriptions of certain features will have to be updated once the new UI is live
-->

APLS provides powerful search capabilities for finding linguistic patterns in the interview data.
It all starts from the <span class="apls-page">Search</span> page: <https://apls.pitt.edu/labbcat/search>.
Once you create a search, you can [export the results]({{ '/doc/export-data' | relative_url }}) in a variety of formats.

{: .note}
> If you are looking for information on the <span class="apls-page">Search **results**</span> page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation page.

Because the <span class="apls-page">Search</span> page has many options that will be of interest to a variety of different researchers, these documentation pages are more focused on giving users an understanding of the <span class="apls-page">Search</span> page capabilities through "Try it!" tutorials.
If you would like to understand the data structure that the <span class="apls-page">Search</span> page relies on, read the [Layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation page.


{% comment %}
<!-- To replace the following section -->
## Search gallery

Here's a selection of searches to give you a flavor of what's possible with APLS's search capabilities:

<span
  id="expand-ex"
  class="btn"
  style="display: inline-block;"
  onclick="document.querySelectorAll('blockquote > details').forEach(a => a.setAttribute('open', '')); document.getElementById('expand-ex').style.display = 'none'; document.getElementById('collapse-ex').style.display = 'inline-block';"
  >Expand all examples</span>
<span
  id="collapse-ex"
  class="btn"
  style="display: none;"
  onclick="document.querySelectorAll('blockquote > details').forEach(a => a.removeAttribute('open')); document.getElementById('collapse-ex').style.display = 'none'; document.getElementById('expand-ex').style.display = 'inline-block';"
  >Collapse all examples</span>

<!-- Then a bunch of -->
- [Search for a single word]({{ '/doc/your-first-search' | relative_url }})
  
  <!-- Something similar to _includes/compare-ui.html -->
  <!-- {% include compare-ui.html file="layer-picker/search" title_suffix="Search page" caption='The layer picker when first loading the <span class="apls-page">Search</span> page' %} -->


{% endcomment %}

## What you can do on the <span class="apls-page">Search</span> page

The <span class="apls-page">Search</span> page allows you to...
- [Search APLS data for specific patterns]({{ '/doc/your-first-search' | relative_url }}).
  - These patterns can target: 
    - [single words]({{ '/doc/search-other-layers#searching-text-layers' | relative_url }})
    - [part-of-speech tags]({{ '/doc/search-other-layers#using-part-of-speech-tags' | relative_url }})
    - [phonological features]({{ '/doc/search-other-layers#searching-phonological-layers' | relative_url }})
    - [segments within words]({{ '/doc/search-segments' | relative_url }})
      - Such as finding [all instances of a specific vowel]({{ '/doc/search-segments#searching-for-a-single-segment' | relative_url }}) or [all instances of a consonant cluster]({{ '/doc/search-segments#searching-for-multiple-segments-within-a-word' | relative_url }}).
    - [multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }})
    - [multiple layers]({{ '/doc/search-complex-patterns#searching-multiple-layers' | relative_url }})
      - Such as finding [a specific word tagged as a certain part-of-speech]({{ '/doc/search-complex-patterns#searching-multiple-layers' | relative_url }}).
    - [multiple words and layers]({{ '/doc/search-complex-patterns#searching-multiple-words-and-layers' | relative_url }})
- [Filter searches by specific participants and transcripts]({{ '/doc/search-filters-and-options' | relative_url }})
- Configure your search with different [search options]({{ '/doc/search-filters-and-options' | relative_url }})

<!-- 
I have two notes that I *think* are possible ideas for the search gallery that will go on this page?
1. searching orthography for matches of `.*ing` and part_of_speech for non-matches of `VBG`
2. searching orthography for matches of `.*a.*` and phonemes for non-matches of `.*[1@Q\$\{#].*`
these could also go on the "Searching complex patterns" page but that already has a lot of try-its
-->

[Next page: **Your first search - orthography**]({{ '/doc/your-first-search' | relative_url }}){: .btn .next-page }
