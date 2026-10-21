---
title: <span class="apls-page">Search</span> page layout
contributors: Dan Villarreal
permalink: /doc/search-page-layout
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 15
last_modified_date: 2026-10-21T16:20:43-04:00
---

# {{ page.title }}
{:.no_toc}

The following image shows the <span class="apls-page">Search</span> page when you first load it:

{% include screengrab.html src="search/overview.png" layout=true %}

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

{% include screengrab.html src="search/overview-progress.png" layout=true %}

## Pattern input features
{:.no_toc}

The <span class="keyterm">search matrix</span> is made up of one or more <span class="keyterm">pattern inputs</span>.
When you first load the search page, you'll only see a pattern input for the <span class="layer">orthography</span> layer (highlighted in **red**{:.hl-1} below).

{% include screengrab.html src="search/overview_one-outline.png" %}

You can make more pattern inputs appear by [selecting layers]({{ '/doc/search-other-layers' | relative_url }}) in the layer picker and/or widening the search matrix to [multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}).

Not all layers' pattern inputs look alike.
To demonstrate all the possible features, here's what the search matrix looks like when you select <span class="layer">overlap</span>, <span class="layer">turn</span>, <span class="layer">syllables</span>, <span class="layer">foll_pause</span>, <span class="layer">orthography</span>, and <span class="layer">segment</span> in the layer picker:

{% include screengrab.html src="search/matrix.png" layout=true %}

This search matrix has 6 different pattern inputs, one for each selected layer.
Let's break down what we're seeing:

- Most important of all, <span class="keyterm">input boxes</span> (highlighted in **red**{:.hl-1} above) let you specify a pattern for that layer.
  - Appearance depends on the layer's [data type]({{ '/doc/layer-typology#data-type' | relative_url }}):
    - Text layers (like <span class="layer">overlap</span>) and phonological layers (like <span class="layer">syllables</span>) have one input box marked `Regular expression` or `Regular expression (A≠a)`.
      - `(A≠a)` means that the pattern is case-sensitive (as in, the character `A` is not treated the same as the character `a`). Otherwise, the pattern is case-insensitive.
    - Numeric layers (like <span class="layer">foll_pause</span>) have two: `Minimum` and `Maximum`.
    - Timing-only layers (like <span class="layer">turn</span>) have none.
- The _matches_ dropdowns (highlighted in **blue**{:.hl-2} above) let you search for the [opposite of a pattern]({{ '/doc/inverted-matches' | relative_url }}) or [missing annotations]({{ '/doc/view-transcript#missing-annotations' | relative_url }}).
  {%- comment %}TODO: Add missing annotations to inverted-matches{% endcomment %}
- The {% include labbcat-icon.html src="add.svg" %} buttons let you change the width of the search matrix.
  - The large {% include labbcat-icon.html src="add.svg" %} button to the right of the pattern inputs (highlighted in **green**{:.hl-3} above) [widens the search matrix by another word]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}).
  - For layers with segment [scope]({{ '/doc/layer-typology#scope' }}) (like <span class="layer">segment</span>), there's also a small {% include labbcat-icon.html src="add.svg" %} button (highlighted in **purple**{:.hl-4} above) that lets you search for [multiple segments within a word]({{ '/doc/search-segments#searching-for-multiple-segments-within-a-word' | relative_url }}).
- The {% include labbcat-icon.html src="expand-down.svg" %} buttons (highlighted in **orange**{:.hl-5} above) open a [symbol picker]({{ '/doc/search-other-layers#symbol-picker' | relative_url}}), which helps with inputting patterns for layers that have specific [notation systems]({{ '/doc/layer-typology#notation-system' }}) (like <span class="layer">overlap</span>, <span class="layer">syllables</span>, and <span class="layer">segment</span>).
  {%- comment %}TODO: Add a under-the-hood listing layers with a symbol picker{% endcomment %}
- The {% include labbcat-icon.html src="target.svg" %} icons (highlighted in **brown**{:.hl-7} above) let you define the "token of interest" when searching [across words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), [within words]({{ '/doc/search-segments' | relative_url }}), or [across layers]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), given that annotations differ by both [scope]({{ '/doc/layer-typology#scope' }}) and [alignment]({{ '/doc/layer-typology#alignment-and-horizontal-peers' }}).
  {%- comment %}TODO: Add a under-the-hood listing layers with a target icon{% endcomment %}
- The {% include labbcat-icon.html src="lock-unlocked.svg" %}{:style="opacity:0.5;"} icons (highlighted in **pink**{:.hl-8} above) let you [anchor a pattern]({{ '/doc/anchoring-searches' | relative_url }}) to the beginning or end another layer's [scope]({{ '/doc/layer-typology#scope' }}).
  {%- comment %}TODO: Add a under-the-hood listing layers with anchor icons{% endcomment %}
- Black lines at the top of a pattern input (highlighted in **yellow**{:.hl-6} above) indicate that the layer has either span or phrase [scope]({{ '/doc/layer-typology#scope' }}) (like <span class="layer">overlap</span> and <span class="layer">turn</span>).
