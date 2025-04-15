---
title: Searching the corpus 
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2025-04-15T13:11:29:z
---

# {{ page.title }}
{:.no_toc}

<!-- 
can generally use more screengrabs throughout (probably after the new UI is live)
also the deictic descriptions of certain features will have to be updated once the new UI is live
-->

APLS provides powerful search capabilities for finding linguistic patterns[^patterns] in the interview data.
It all starts from the _search_ page: <https://apls.pitt.edu/labbcat/search>.
Once you create a search, you can [export the results]({{ '/doc/export-data' | relative_url }}) in a variety of formats.

[^patterns]: The term _patterns_ is used throughout this page because the search function is capable of matching exact words, affixes, individual sound segments, stress, part of speech, and much more!

Because the _search_ page has many options that will be of interest to a variety of different researchers, this documentation page is more focused on giving users an understanding of the _search_ page capabilities through `TRY IT!` tutorials.
If you would like to understand the data structure that the _search_ page relies on, read the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) and [Layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation pages.

If you are looking for information on the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.

{% include page_toc.html collapsible=true %}

## What you can do on the _search_ page

The _search_ page allows you to...
- [Search APLS data for specific patterns]({{ '/doc/your-first-search' | relative_url }}).
  - These patterns can target: 
    - [single words]({{ '/doc/searching-other-layers#searching-text-layers' | relative_url }})
    - [part-of-speech tags]({{ '/doc/searching-other-layers#using-part-of-speech-tags' | relative_url }})
    - [phonological features]({{ '/doc/searching-other-layers#searching-phonological-layers' | relative_url }})
    - [segments within words]({{ '/doc/searching-segments-within-words' | relative_url }})
      - Such as finding [all instances of a specific vowel]({{ '/doc/searching-segments-within-words#searching-for-a-single-segment' | relative_url }}) or [all instances of a consonant cluster]({{ '/doc/searching-segments-within-words#searching-for-multiple-segments-within-a-word' | relative_url }}).
    - [multiple words]({{ '/doc/searching-complex-patterns#searching-multiple-words' | relative_url }})
    - [multiple layers]({{ '/doc/searching-complex-patterns#searching-multiple-layers' | relative_url }})
      - Such as finding [a specific word tagged as a certain part-of-speech]({{ '/doc/searching-complex-patterns#searching-multiple-layers' | relative_url }}).
    - [multiple words and layers]({{ '/doc/searching-complex-patterns#searching-multiple-words-and-layers' | relative_url }})
- [Filter searches by specific participants and transcripts]({{ '/doc/search-filters-and-options' | relative_url }})
- Configure your search with different [search options]({{ '/doc/search-filters-and-options' | relative_url }})

<!-- 
I have two notes that I *think* are possible ideas for the search gallery that will go on this page?
1. searching orthography for matches of `.*ing` and part_of_speech for non-matches of `VBG`
2. searching orthography for matches of `.*a.*` and phonemes for non-matches of `.*[1@Q\$\{#].*`
these could also go on the "Searching complex patterns" page but that already has a lot of try-its
-->

### Layout

<!-- 
this is one section in particular that will need to be updated with the new search page UI
-->

There are five main sections of the _search_ page:
1. [Participants and transcripts filters]({{ '/doc/search-filters-and-options' | relative_url }})
1. [Search options]({{ '/doc/search-filters-and-options#search-options' | relative_url }})
1. [Layer picker]({{ '/doc/searching-other-layers' | relative_url }})
1. [Pattern input fields]({{ '/doc/your-first-search' | relative_url }})
1. [Search progress bar]({{ '/doc/your-first-search#search-results' | relative_url }})

Only the first four sections are displayed when you first load the _search_ page, as shown in the screengrab below.

![]({{ '/assets/screengrab/search/search-page-layout1.png' | relative_url }})

The progress bar only pops up once you actually click _Search_, like in the screengrab below.

![]({{ '/assets/screengrab/search/search-page-layout2.png' | relative_url }})
