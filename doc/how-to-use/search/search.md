---
title: Searching the corpus 
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2025-10-24T13:31:17-04:00
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

[^patterns]: The term _patterns_ is used throughout these pages because you can match exact words, affixes, individual sound segments, stress, part of speech, and much more!

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

- The <span class="keyterm">search matrix</span> (highlighted in **red**{:.hl-1} above).
  - This is where you specify patterns to search.
  - Made up of one or more <span class="keyterm">pattern inputs</span>.
- The <span class="keyterm">layer picker</span> (highlighted in **blue**{:.hl-2} above).
  - This is where you can add and subtract pattern inputs from the search matrix.
- The <span class="keyterm">search button</span> (highlighted in **green**{:.hl-3} above).
  - Click this to begin your search (or press `Enter`/`Return` while in a text box).
- The <span class="keyterm">tabs</span> (highlighted in **purple**{:.hl-4} above). This is where you can...
  - [Filter searches by specific participants and transcripts]({{ '/doc/search-filters-and-options' | relative_url }}).
  - Configure your search with different [search options]({{ '/doc/search-filters-and-options' | relative_url }}).

Once you enter a pattern into the search matrix and click _Search_, a <span class="keyterm">progress bar</span> pops up (highlighted in **orange**{:.hl-5} below):

{% include screengrab.html src="search/overview-progress.png" %}

#### Search matrix and pattern inputs
{: .no_toc}

{: .note .no-collapse}
> Feel free to skip this section if you want to jump into [your first search]({{ '/doc/your-first-search' | relative_url }})!

The search matrix is made up of one or more <span class="keyterm">pattern inputs</span>.
When you first load the search page, you'll only see a pattern input for the <span class="layer">orthography</span> layer (like in the previous images).
You can make more pattern inputs appear by [selecting layers]({{ '/doc/search-other-layers' | relative_url }}) in the layer picker and/or widening the search matrix to [multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}).

Not all layers' pattern inputs look alike.
To demonstrate all the possible features, here's what the search matrix looks like when you select <span class="layer">overlap</span>, <span class="layer">turn</span>, <span class="layer">syllables</span>, <span class="layer">foll_pause</span>, <span class="layer">orthography</span>, and <span class="layer">segment</span> in the layer picker:

{% include screengrab.html src="search/matrix.png" %}

This search matrix has 6 different pattern inputs, one for each selected layer.
Let's break down what we're seeing:

- Most important of all, <span class="keyterm">input boxes</span> (marked `Regular expression`, `Minimum`, or `Maximum`) let you specify a pattern for that layer.
  - Appearance depends on the layer's [data type]({{ '/doc/layer-typology#data-type' | relative_url }}):
    - Text layers (like <span class="layer">overlap</span>) and phonological layers (like <span class="layer">syllables</span>) have one input box marked `Regular expression`.
    - Numeric layers (like <span class="layer">foll_pause</span>) have two: `Minimum` and `Maximum`.
    - Timing-only layers (like <span class="layer">turn</span>) have none.
- The {% include labbcat-icon.html src="add.svg" %} buttons let you change the width of the search matrix.
  - The large {% include labbcat-icon.html src="add.svg" %} button to the right of the pattern inputs [widens the search matrix by another word]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}).
  - For layers with segment [scope]({{ '/doc/layer-typology#scope' }}) (like <span class="layer">segment</span>), there's also a small {% include labbcat-icon.html src="add.svg" %} button that lets you search for [multiple segments within a word]({{ '/doc/search-segments#searching-for-multiple-segments-within-a-word' | relative_url }}).
- The _matches_ dropdown lets you search for the [opposite of a pattern]({{ '/doc/inverted-matches' | relative_url }}) or [missing annotations]({{ '/doc/view-transcript#missing-annotations' | relative_url }}).
  {%- comment %}TODO: Add missing annotations to inverted-matches{% endcomment %}
- The {% include labbcat-icon.html src="expand-down.svg" %} button opens a [symbol picker]({{ '/doc/search-other-layers#symbol-picker' | relative_url}}), which helps with inputting patterns for layers that have specific [notation systems]({{ '/doc/layer-typology#notation-system' }}) (like <span class="layer">overlap</span>, <span class="layer">syllables</span>, and <span class="layer">segment</span>).
  {%- comment %}TODO: Add a under-the-hood listing layers with a symbol picker{% endcomment %}
- The {% include labbcat-icon.html src="target.svg" %} icon lets you define the "token of interest" when searching [across words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), [within words]({{ '/doc/search-segments' | relative_url }}), or [across layers]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), given that annotations differ by both [scope]({{ '/doc/layer-typology#scope' }}) and [alignment]({{ '/doc/layer-typology#alignment-and-horizontal-peers' }}).
  {%- comment %}TODO: Add a under-the-hood listing layers with a target icon{% endcomment %}
- The {% include labbcat-icon.html src="lock-unlocked.svg" %}{:style="opacity:0.5;"} icon lets you [anchor a pattern]({{ '/doc/anchoring-searches' | relative_url }}) to the beginning or end another layer's [scope]({{ '/doc/layer-typology#scope' }}).
  {%- comment %}TODO: Add a under-the-hood listing layers with a target icon{% endcomment %}
- Black lines at the top of a pattern input indicate that the layer has either span or phrase [scope]({{ '/doc/layer-typology#scope' }}) (like <span class="layer">overlap</span> and <span class="layer">turn</span>).
