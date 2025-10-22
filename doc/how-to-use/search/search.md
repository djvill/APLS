---
title: Searching the corpus 
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2025-10-22T16:37:02-04:00
---

# {{ page.title }}
{:.no_toc}

<!-- 
can generally use more screengrabs throughout (probably after the new UI is live)
also the deictic descriptions of certain features will have to be updated once the new UI is live
-->

APLS provides powerful search capabilities for finding linguistic patterns[^patterns] in the interview data.
It all starts from the <span class="apls-page">Search</span> page: <https://apls.pitt.edu/labbcat/search>.
Once you create a search, you can [export the results]({{ '/doc/export-data' | relative_url }}) in a variety of formats.

[^patterns]: The term _patterns_ is used throughout this page because the search function is capable of matching exact words, affixes, individual sound segments, stress, part of speech, and much more!

Because the <span class="apls-page">Search</span> page has many options that will be of interest to a variety of different researchers, these documentation pages are more focused on giving users an understanding of the <span class="apls-page">Search</span> page capabilities through "Try it!" tutorials.
If you would like to understand the data structure that the <span class="apls-page">Search</span> page relies on, read the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) and [Layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation pages.

If you are looking for information on the <span class="apls-page">Search results</span> page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation page.

{% include page_toc.html collapsible=true %}

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

### Page layout

The following image shows the <span class="apls-page">Search</span> page when you first load it:

{% include screengrab.html src="search/overview.png" %}

- The <span class="keyterm">search matrix</span> (highlighted in **red**{:.hl-1} above). This is where you can search for...
  - single-word patterns, either by [orthography]({{ '/doc/your-first-search' | relative_url }}) or [other linguistic features]({{ '/doc/search-other-layers' | relative_url }})
  - [individual speech sounds]({{ '/doc/search-segments' | relative_url }})
  - patterns across [multiple words and/or linguistic features]({{ '/doc/search-complex-patterns' | relative_url }})
- The <span class="keyterm">tabs</span> (highlighted in **blue**{:.hl-2} above). This is where you can...
  - [Filter searches by specific participants and transcripts]({{ '/doc/search-filters-and-options' | relative_url }})
  - Configure your search with different [search options]({{ '/doc/search-filters-and-options' | relative_url }})

Once you enter a pattern into the search matrix and click _Search_, a <span class="keyterm">progress bar</span> pops up (highlighted in **green**{:.hl-3} below):

{% include screengrab.html src="search/overview-progress.png" %}


The search matrix itself has two parts:

{% include screengrab.html src="search/matrix-layout.png" %}

- The <span class="keyterm">layer picker</span> (highlighted in **purple**{:.hl-4} above).
  - This is where you choose layers to search.
- The <span class="keyterm">pattern input field(s)</span> (highlighted in **orange**{:.hl-5} above).
  - This is where you specify patterns to search.
  - More fields appear when you...
    - [select multiple layers]({{ '/doc/search-complex-patterns#searching-multiple-layers' | relative_url }}) in the layer picker, and/or
    - widen the search to [multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}).
