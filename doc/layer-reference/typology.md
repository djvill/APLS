---
title: Typology
layout: default
permalink: /doc/typology
parent: Layer reference
nav_order: 10
last_modified_date: 2024-11-14T09:58:41-05:00
---

# Layers: {{ page.title }}
{:.no_toc}

The <span class="keyterm">layers</span> in APLS can be categorized along some important properties, in terms of how they appear, how they're generated, how they can be searched, and other properties.
This page outlines those categories.

{% include page_toc.html collapsible=true open=true %}


## Scope

Not all annotations in a transcript are equally "wide" (in duration).
Some layers contain annotations that pertain to individual words (e.g., <span class="layer">part_of_speech</span>), others to individual speech sounds (e.g., <span class="layer">segment</span>), and others to multiple words (e.g., <span class="layer">redaction</span>).
This distinction is captured by layer <span class="keyterm">scope</span>.

Layers can have one of four possible scopes, defined by how long (in time) they can span.
From longest to shortest, these are:

- <span class="keyterm">Span layers</span>: Annotations can span beyond an individual turn of talk, up to the length of the entire transcript.
- <span class="keyterm">Phrase layers</span>: Annotations can span beyond an individual word, up to the length of an entire turn.
- <span class="keyterm">Word layers</span>: Annotations _usually_ span the length of a word.
  - Some word layers (like <span class="layer">syllables</span>) have annotations that span just _part_ of a word. These annotations are called <span class="keyterm">horizontal peers</span>, discussed [below](#alignment-and-horizontal-peers).
- <span class="keyterm">Segment layers</span>: Annotations span the length of a speech sound.


### What you'll see in APLS

In APLS, you'll see layer scopes on the search, X, and Y pages. <!-- WITH SCREENSHOTS -->





### Layers by scope

{% include layer-table.html property="scope" categories="span,phrase,word,segment" exclude_proj="temp,testing" %}


## Alignment and horizontal peers

Some annotations take up just part of their scope, and some annotations take up their entire scope.
For example, <span class="layer">syllables</span> annotations can take up just part of their corresponding word (if the word is multisyllabic);
by contrast, each word has just one <span class="layer">frequency_in_corpus</span> annotation.
When annotations take up just part of their scope, we say they have <span class="keyterm">horizontal peers</span>: "peers" because they share a scope with other annotations, "horizontal" because we often conceptualize time on an x-axis (i.e., from left to right).
This distinction is captured by layer <span class="keyterm">alignment</span>.

Layers can have one of three possible alignments:

- <span class="keyterm">Complete interval</span>: Annotations span their entire scope
- <span class="keyterm">Sub-interval</span> (aka <span class="keyterm">horizontal peers</span>): Annotations span part (or all) of their scope
  - There may or may not be gaps between annotations within a scope. For example, there are usually long gaps between <span class="layer">comment</span> annotations within a transcript
- <span class="keyterm">Timepoint</span>: Annotations don't have a start and end time, just a time
  - There aren't currently any timepoint layers in APLS. If we wanted to store vowel measurements in a layer, then we might do so in a timepoint layer (i.e., at the vowel's midpoint).


### What you'll see in APLS

In APLS, alignment is represented by these symbols: <!-- SYMBOLS -->.
A layer's alignment also affects things like [search]({{ '/doc/search' | relative_url }}) and [export]({{ '/doc/export-data' | relative_url }}).




### Layers by alignment

{% include layer-table.html property="alignment" categories="complete interval,sub-interval" exclude_proj="temp,testing" %}

There aren't currently any timepoint layers in APLS.


## Vertical peers

Some layers allow for <span class="keyterm">vertical peers</span>: 2 or more annotations that occupy an identical timespan.
For example, since the word _the_ can be pronounced [ði] or [ðə] <!-- Maybe pick a word w/ fewer scary IPA symbols? Slash one that's not an allophonic difference but a proper phonemic difference? -->, it is represented on the <span class="layer">dictionary_phonemes</span> layer by two annotations.
Unlike <span class="keyterm">horizontal peers</span>, which divide the timespan of their scope, vertical peers are "vertical" because we can think of them as being "stacked" on top of one another.

In APLS, a layer with vertical peers is represented by this symbol: <!-- SYMBOL -->.

### What you'll see in APLS

When [viewing a transcript]({{ '/doc/view-transcript' | relative_url }}) in APLS, only one vertical peer is shown;
for example, the <span class="layer">dictionary_phonemes</span> layer only shows `ðə` for the word _the_, even though _the_ has two <span class="layer">dictionary_phonemes</span> annotations.
This also affects things like [search]({{ '/doc/search' | relative_url }}) and [export]({{ '/doc/export-data' | relative_url }}).




### Layers by vertical peers

{% include layer-table.html property="vertical_peers" categories="true,false" exclude_proj="temp,testing" %}


## Data type

Each layer has one of four different types of data:

- <span class="keyterm">Phonological data</span>: Annotations are labeled with speech sounds
  - Some phonological layers' annotations are individual sounds (like <span class="layer">segment</span>) and others' are strings of sounds (like <span class="layer">syllables</span>)
- <span class="keyterm">Numeric data</span>: Annotations are labeled with a measurement
  - Some numeric layers' annotations are counts (like <span class="layer">frequency_in_corpus</span>), and others' are decimal numbers (like <span class="layer">foll_pause</span>)
- <span class="keyterm">Text data</span>: Annotations are labeled with text
  - Most text layers' annotations are normal English spelling (like <span class="layer">word</span>) or lowercase English spelling (like <span class="layer">orthography</span>)
- <span class="keyterm">Timing only</span>: Annotations don't have a label, only a start/end time
  - The two timing-only layers represent temporal subdivisions of a transcript: <span class="layer">turn</span> and <span class="layer">utterance</span>


In APLS, data type is represented by these symbols: <!-- SYMBOLS -->.


### What you'll see in APLS

This distinction is mostly important for [search]({{ '/doc/search' | relative_url }}).




### Layers by data type

{% include layer-table.html property="data_type" categories="phonological,numeric,text,timing-only" exclude_proj="temp,testing" %}


## Notation system




### What you'll see in APLS


### Layers by notation system

[This is a little complicated because of the primary/additional distinction]


## Alignment dependency

Some layers need information about individual speech sounds: which sounds are in a word, and where these sounds begin and end.
For example, a word's <span class="layer">phonemes</span> annotation is only possible if the word has <span class="layer">segment</span> annotations.
Other layers (like <span class="layer">part_of_speech</span>) don't depend on <span class="layer">segment</span> annotations.
This distinction is captured by <span class="keyterm">alignment dependency</span>:

- <span class="keyterm">Alignment-dependent</span>: Annotations are only present if the layer's scope contains <span class="layer">segment</span> annotations---in other words, if the layer's scope is <span class="keyterm">aligned</span>
- Not <span class="keyterm">alignment-dependent</span>: Annotations can be present even if the layer's scope is not <span class="keyterm">aligned</span>

In APLS, <span class="keyterm">alignment</span> is generally on a line-by-line basis, meaning that most lines are either completely aligned or completely _not_ aligned.
Lines that are completely _not_ aligned won't have _any_ annotations on alignment-dependent layers.

Layers can be alignment-dependent even if the <span class="layer">segment</span> layer isn't a direct input.
For example, <span class="layer">speech_rate</span> (a phrase layer) takes <span class="layer">syllables</span> as input, which takes <span class="layer">segment</span> as input;
if <span class="layer">segment</span> has no annotations in a turn, then <span class="layer">syllables</span> won't have any annotations, which means <span class="layer">speech_rate</span> won't have any annotations.

### What you'll see in APLS




### Layers by alignment dependency

{% include layer-table.html property="alignment_dependent" categories="true,false" exclude_proj="temp,testing" not_synced=true %}


## Project

[arbitrary categories, reduce visual clutter]

### What you'll see in APLS



### Layers by project

{% include layer-table.html property="project" categories="(none),syntax,lexicon,timing,phonology,imported,temp,testing" no_caps=true %}
