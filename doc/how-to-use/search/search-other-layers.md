---
title: Searching other layers
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search-other-layers
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 40
last_modified_date: 2025-10-23T13:33:12-04:00
---

# {{ page.title }}
{:.no_toc}

You can search more than just the <span class="layer">orthography</span> layer on the <span class="apls-page">Search</span> page.
On this page, we'll discuss the <span class="apls-page">Search</span> page's [layer picker](#selecting-layers-to-search) and how [search patterns look different](#layer-data-types-and-notation-systems) for layers other than <span class="layer">orthography</span>.

{: .note}
> For an overview of how layers work in APLS, start with the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) documentation section.
> In-depth descriptions of the different layers in APLS can be found in the [layer field guide]({{ '/doc/layer-field-guide' | relative_url }}).

{% include page_toc.html collapsible=true %}

## Selecting layers to search

You can select and deselect layers in the layer picker to control which <span class="keyterm">pattern input fields</span> appear in the search matrix.
(By default, the layer picker has the <span class="layer">orthography</span> layer already selected.)
For example, here's what the search matrix looks like when <span class="layer">orthography</span> is deselected and <span class="layer">segment</span> is selected:

{% include screengrab.html src="search/matrix-segment.png" %}

{: .note .no-collapse}
> If you select a layer but don't enter anything into its pattern input field, it doesn't get applied to the search.

The layer picker on the <span class="apls-page">Search</span> page works similarly to the [layer picker on the <span class="apls-page">Transcript</span> page]({{ '/doc/view-transcript#selecting-layers-to-display' | relative_url }}), with a few differences:

- Unlike the <span class="apls-page">Transcript</span> page, <span class="layer">turn</span> and <span class="layer">utterance</span> can be selected, and <span class="layer">word</span> isn't selected by default.
- Layer names don't change color when selected.
- There are no annotation counts or IPA/DISC toggles.

Like the layer picker on the <span class="apls-page">Transcript</span> page, most layers are hidden by default.
To make more layers appear, you have to select the [project]({{ '/doc/layer-typology#project' | relative_url }}) corresponding with that layer in the `Projects` column.
The screengrab below has the projects that are most useful to users toggled on to show all the layers that are useful for searching APLS.

{% include screengrab.html src="search/all-layers.png" %}

{:.note .no-collapse}
> Layers in the `temp` project aren’t meaningful for end-users, so these layers are not discussed on this page.

Hovering over the names of the layers will display a tooltip giving a brief description of that layer.


### Layer picker icons
{: .no_toc }

If _Show layer icons_ is selected, each layer will have either two or three icons to the right of its checkbox in the layer picker.
These icons indicate some of the layer's important properties.
Here's a quick key;
see the [layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation page for more information:

<!-- TODO turn this into an includes so it can be reused on other pages -->
<table class="icon-table">
  <thead>
    <tr>
      <th colspan="2"><a href="{{ '/doc/layer-typology#data-type' | relative_url }}">Data type</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}">Alignment</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#vertical-peers' | relative_url }}">Vertical peers</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-phonological.svg" %}</td>
      <td>Phonological</td>
      <td>{% include labbcat-icon.html src="alignment-0.svg" %}</td>
      <td>Complete interval</td>
      <td>{% include labbcat-icon.html src="vertical-peers.svg" %}</td>
      <td>Allows vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-numeric.svg" %}</td>
      <td>Numeric</td>
      <td>{% include labbcat-icon.html src="alignment-2.svg" %}</td>
      <td>Sub-interval</td>
      <td>(none)</td>
      <td>Doesn't allow vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-text.svg" %}</td>
      <td>Text</td>
      <td rowspan="2" colspan="4"></td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-timing-only.svg" %}</td>
      <td>Timing-only</td>
    </tr>
  </tbody>
</table>

This means that, for example, the <span class="layer">segment</span> layer has phonological data type, complete-interval alignment, and no vertical peers: ![]({{ '/assets/screengrab/transcripts/layer-picker-segment-icons.png' | relative_url }}){:style="height:1.5em; border:.1em solid black;"}.

{: .under-the-hood}
> The _about_ link points to the page section you're reading right now!


## Layer data types and notation systems

Different layers in APLS contain different kinds of annotations: <span class="keyterm">data types</span>.
These differences affect what and how you can search in each layer.

While data type describes the *kinds* of annotation that different layers contain, <span class="keyterm">notation systems</span> are what those annotations actually *look like*.
All layers have a <span class="keyterm">primary notation system</span> (with the exception of timing-only layers because their annotations don't have labels).

The primary notation systems by data type are:
- Phonological
  - DISC phonemic alphabet
  - Stress markers (`'` [primary stress], `"` [secondary stress], `0` [unstressed])
- Text
  - English spelling
  - Treebank part-of-speech tags
  - Boolean (`TRUE` or `FALSE`)
- Numeric
  - Positive whole numbers
  - Decimal numbers
  
You can read more about notation systems on the [Layer typology]({{ '/doc/layer-typology#notation-system' | relative_url }}) and [Layer notation systems]({{ '/doc/layer-notation-systems' | relative_url }}) documentation pages.


### Symbol picker

To make these layers easier to search, layers that don't use English spelling or numbers have an additional part in their pattern input fields: a <span class="keyterm">symbol picker</span>, shown with a {% include labbcat-icon.html src="expand-down.svg" %} icon.
For example, we can see the {% include labbcat-icon.html src="expand-down.svg" %} icon for the <span class="layer">syllables</span> layer, which uses stress markers and the DISC phonemic alphabet:

{% include screengrab.html src="search/syllables.png" %}

To bring up the symbol picker, click the {% include labbcat-icon.html src="expand-down.svg" %} icon:

{% include screengrab.html src="search/symbol-picker.png" %}

This saves you the trouble of needing to memorize things like the DISC alphabet or part-of-speech tags to use all of the <span class="apls-page">Search</span> page's functionalities!

The <span class="layer">syllables</span> symbol picker includes individual IPA symbols (like _θ_), subcategories (like _Diphthongs_), and categories (like _CONSONANT_).
If you click an **IPA** symbol, it will fill (and briefly highlight) the corresponding **DISC** symbol into the pattern input field.
For example, when you click _θ_ for <span class="layer">syllables</span>, APLS fills in this phoneme's DISC symbol, `T`:

{% include screengrab.html src="search/symbol-picker-single.png" %}

You can click multiple symbols/(sub)categories in the label picker to add multiple symbols to the pattern input field.
For example, here's what it looks like when you take the previous image, then click _ɹ_, then _oʊ_:

{% include screengrab.html src="search/symbol-picker-multiple.png" %}

{: .note .no-collapse}
> New symbols are inserted at the end of the pattern by default.
> If you want to add a new symbol earlier in the pattern, put your cursor wherever you want the new symbol, then click the symbol picker.

If you click a subcategory or category in the symbol picker, APLS fills in (and briefly highlights) a [regex character set]({{ '/doc/regex#square-brackets-' | relative_url }}) that matches any member of that (sub)category.
For example, here's what it looks like when you take the previous image, move your cursor before `T`, then click _STRESS_:

{% include screengrab.html src="search/symbol-picker-category.png" %}

Similar to other parts of APLS, you can hover your mouse over the options in these drop-down menus to get a short tooltip description for each symbol.
For phonological layers, consonants that have the same symbol in both IPA and DISC are left off of the symbol picker to save space.
However, you can hover over `Other consonants: Use normal IPA` to see a list of these consonants.


### Searching phonological layers

The phonological layers (and what is included in their symbol pickers) in APLS are:
- <span class="layer">phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">dictionary_phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">stress</span> (stress markers)
- <span class="layer">pronounce</span> (IPA symbols that are not on QWERTY keyboards, stress markers, and syllable boundaries)
- <span class="layer">syllables</span> (IPA symbols that are not on QWERTY keyboards and stress markers)
- <span class="layer">segment</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">foll_segment</span> (IPA symbols that are not on QWERTY keyboards and a pause marker)

{:.note .no-collapse}
> The <span class="layer">segment</span> and <span class="layer">foll_segment</span> layers have additional capabilities that are described in [Searching segments within words]({{ '/doc/search-segments' | relative_url }}).

{: .try-it }
> To find all matches for syllables with /ʊ/ that have secondary stress:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `phonology` project in the layer picker and click the checkbox for the <span class="layer">syllables</span> layer to make the syllables input field appear.
> 1. Open the symbol picker (click {% include labbcat-icon.html src="expand-down.svg" %}) and select `secondary` under the `STRESS` heading.
> 1. Enter `.*` after `"` in the syllables input field.
> 1. Open the symbol picker again ({% include labbcat-icon.html src="expand-down.svg" %}) and select `ʊ` under the `VOWEL` heading.
> 1. Enter `.*` after `".*U` in the syllables input field.
> 1. Click _Search_.


### Searching text layers that use English spelling

As discussed in [Your first search]({{ '/doc/your-first-search' | relative_url }}), you can search the <span class="layer">orthography</span> layer using English spelling.
Other layers that can be searched using English spelling are:
- <span class="layer">lemma</span> 
- <span class="layer">morphemes</span> 
- <span class="layer">lexical</span> 
- <span class="layer">word</span> 
- <span class="layer">comment</span> 
- <span class="layer">noise</span> 
- <span class="layer">redaction</span>  

{:.note}
> The <span class="layer">redaction</span> search targets the comments that are made for redactions on the word layer.
> All redactions are annotated as `___` on the word layer, which is what appears on the <span class="apls-page">Search results</span> page for redactions.
> However, the pattern for <span class="layer">redaction</span> must match the comments in the <span class="layer">redaction</span> layer.
> Therefore, searching for `___` on the <span class="layer">redaction</span> layer won't display any results but searching `.*name.*` will show all redactions that contain "name" in the comment.

### Text layers that use part-of-speech tags

Currently, <span class="layer">part_of_speech</span> is the only layer that uses part-of-speech tags (specifically, Treebank tags).
Like phonological layers, <span class="layer">part_of_speech</span> includes a [symbol picker](#symbol-picker).

{: .try-it }
> To find matches for every superlative adjective in APLS:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer picker and click the checkbox for the <span class="layer">part_of_speech</span> layer to make the part_of_speech input field appear.
> 1. Open the symbol picker (click {% include labbcat-icon.html src="expand-down.svg" %}) and select `JJS`.
> 1. Click _Search_.

### Text layers that use Boolean values

Currently, <span class="layer">overlap</span> is the only layer that uses Boolean values: `TRUE` for speech that is overlapping and `FALSE` for speech that isn't overlapping. 
Like phonological layers, <span class="layer">part_of_speech</span> includes a [symbol picker](#symbol-picker).

### Searching numeric layers

The pattern input fields for numeric layers allow you to define a numerical range you would like to search for.

The following layers use numeric range input fields:
- <span class="layer">frequency_from_celex</span> 
- <span class="layer">frequency_in_corpus</span> 
- <span class="layer">speech_rate</span> 
- <span class="layer">foll_pause</span> 

{: .try-it }
> To find every word that only appears in the corpus once or twice:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `lexicon` project in the layer picker and click the checkbox for the <span class="layer">frequency_in_corpus</span> layer to make the frequency_in_corpus input field appear.
> 1. Enter `1` in the frequency_in_corpus _Minimum_ input field and enter `3` in the frequency_in_corpus _Maximum_ input field.
> 1. Click the _Search_ button.
> - This search will include incomplete words as well.
>   To exclude incomplete words, select _doesn't match_ from the _matches_ drop-down menu and enter `.+~` into the orthography input field.
