---
title: Typology
layout: default
permalink: /doc/typology
parent: Layer reference
nav_order: 10
last_modified_date: 2025-01-09T11:37:45-05:00
---

# Layers: {{ page.title }}
{:.no_toc}

The <span class="keyterm">layers</span> in APLS can be categorized along some important properties, in terms of how they appear, how they're generated, how they can be searched, and other properties.
This page outlines those categories.

{% include page_toc.html collapsible=true %}


## Scope

Not all annotations in a transcript are equally "wide" (in duration).
Some layers contain annotations that pertain to individual words (e.g., <span class="layer">part_of_speech</span>), others to individual speech sounds (e.g., <span class="layer">segment</span>), and others to multiple words (e.g., <span class="layer">redaction</span>).
This distinction is captured by layer <span class="keyterm">scope</span>.

Layers can have one of four possible scopes, defined by how long (in time) they can span.
From longest to shortest, these are:

| Scope | Meaning | Notes |
|-------|---------|-------|
| Span  | Annotations can span beyond an individual turn of talk, up to the length of the entire transcript | |
| Phrase | Annotations can span beyond an individual word, up to the length of an entire turn | |
| Word   | Annotations _usually_ span the length of a word | Some word layers (like <span class="layer">syllables</span>) have annotations that span just _part_ of a word. These annotations are called <span class="keyterm">horizontal peers</span>, discussed [below](#alignment-and-horizontal-peers) |
| Segment | Annotations span the length of a speech sound | |
{: .layer-props }

### What you'll see in APLS

- [Individual transcript pages]({{ '/doc/view-transcript' | relative_url }})
  - You can usually tell what each layer's scope is by just glancing at the transcript. For example: 
  ![]({{ '/assets/screengrab/transcript-layer-scope.png' | relative_url }}){: .screengrab }
    - The <span class="layer">noise</span> annotations aren't bounded by a single line, so <span class="layer">noise</span> is clearly a <span class="keyterm">span layer</span>. (Note that transcripts always display the <span class="layer">noise</span> and <span class="layer">comment</span> layers.)
    - Both <span class="layer">overlap</span> and <span class="layer">speech_rate</span> have annotations that span multiple words, so they are clearly <span class="keyterm">phrase layers</span>. You can tell where these annotations start and end because of the colored arcs above each line.
    - Each <span class="layer">foll_pause</span> annotation is lined up above each <span class="layer">word</span> annotation, so <span class="layer">foll_pause</span> is clearly a <span class="keyterm">word layer</span>
    - <span class="keyterm">Segment layers</span> like <span class="layer">segment</span> aren't quite as obvious as the other scopes, but you can tell them apart because they're plain text rather than links, and they're always underneath <span class="layer">word</span>
    - Finally, note that layers are always in scope order from longest to shortest
  
- [Search]({{ '/doc/search' | relative_url }})
  - In the layered search matrix, layers are organized into columns by scope:
  ![]({{ '/assets/screengrab/search-matrix.png' | relative_url }}){: .screengrab }
  Only a few layers appear when you first load the search page, but you can select <span class="keyterm">projects</span> to show more (see [below](#project)).
  
- [Exporting data]({{ '/doc/export-data' | relative_url }})
  - Layers are organized into columns by scope
  - Depending on how you're exporting data, there might be additional columns. For example, when [exporting a formatted transcript]({{ '/doc/export-data#export-formatted-transcript' | relative_url }}), you can also export participant and transcript attributes:
  ![]({{ '/assets/screengrab/transcripts-export-format.png' | relative_url }}){: .screengrab }


### Layers by scope

{% include layer-table.html property="scope" categories="span,phrase,word,segment" exclude_proj="temp,testing" %}


## Alignment and horizontal peers

Some annotations take up just part of their scope, and some annotations take up their entire scope.
For example, <span class="layer">syllables</span> annotations can take up just part of their corresponding word (if the word is multisyllabic);
by contrast, each word has just one <span class="layer">frequency_in_corpus</span> annotation.
When annotations take up just part of their scope, we say they have <span class="keyterm">horizontal peers</span>: "peers" because they share a scope with other annotations, "horizontal" because we often conceptualize time on an x-axis (i.e., from left to right).
This distinction is captured by layer <span class="keyterm">alignment</span>.

Layers can have one of three possible alignments:

| Alignment | Symbol[*](#fn:align){: .footnote } | Meaning | Notes |
|-----------|--------|---------|-------|
| Complete interval | ![]({{ '/assets/img/alignment-0.svg' | relative_url }}) | Annotations always span their entire scope | |
| Sub-interval | ![]({{ '/assets/img/alignment-2.svg' | relative_url }}) | Annotations can span part of their scope, or their entire scope<br>Annotations that share their scope with other annotations are called <span class="keyterm">horizontal peers</span> | There may or may not be gaps between annotations within a scope. For example, there are usually long gaps between <span class="layer">comment</span> annotations within a transcript |
| Timepoint | ![]({{ '/assets/img/alignment-1.svg' | relative_url }}) | Annotations don't have a start and end time, just a time | There aren't currently any timepoint layers in APLS. If we wanted to store vowel measurements in a layer, then we might do so in a timepoint layer (i.e., at the vowel's midpoint) |
{: .layer-props }

<a id="fn:align"/>\* Used on [individual transcript pages]({{ '/doc/view-transcript' | relative_url }}) and the [search]({{ '/doc/search' | relative_url }}) page


### What you'll see in APLS

- [Individual transcript pages]({{ '/doc/view-transcript' | relative_url }})
  - In the layer selector, the symbols ![]({{ '/assets/img/alignment-0.svg' | relative_url }}){: style="height:1rem;" } ![]({{ '/assets/img/alignment-2.svg' | relative_url }}){: style="height:1rem;" } ![]({{ '/assets/img/alignment-1.svg' | relative_url }}){: style="height:1rem;" } denote alignments
  - When multiple annotations share a word, they crowd into the space above the word (with spaces separating labels). For example:
    ![]({{ '/assets/screengrab/transcript-layer-alignment.png' | relative_url }}){: .screengrab }
    - Most words in this line have one <span class="layer">part_of_speech</span> annotation, but _don't_ and _it's_ each have two (_n't_ is an adverb, and _'s_ is a present-tense 3rd-person-singular verb)
    - Most words in this line are monosyllabic and just have one <span class="layer">syllables</span> annotation, but _Family_ has three <span class="layer">syllables</span> annotations and _Dollar_ has two.

- [Search]({{ '/doc/search' | relative_url }})
  - In the layer selector, the symbols ![]({{ '/assets/img/alignment-0.svg' | relative_url }}){: style="height:1rem;" } ![]({{ '/assets/img/alignment-2.svg' | relative_url }}){: style="height:1rem;" } ![]({{ '/assets/img/alignment-1.svg' | relative_url }}){: style="height:1rem;" } denote alignments
  - [Like with cross-scope search, you can do anchoring] [But you can't do e.g. multiple syllables within a word]

- [Exporting data]({{ '/doc/export-data' | relative_url }})



### Layers by alignment

Since alignment is relative to the layer's scope, these are broken down by scope too:

{% include layer-table.html property="alignment" categories="complete interval,sub-interval" row_property="scope" row_categories="span,phrase,word,segment" exclude_proj="temp,testing" %}

There aren't currently any timepoint layers in APLS.


## Vertical peers

Some layers allow for <span class="keyterm">vertical peers</span>: 2 or more annotations that occupy an identical timespan.
For example, the <span class="layer">dictionary_phonemes</span> layer represents _all possible_ phonemic representations of a word, while the <span class="layer">phonemes</span> layer represents the speech sounds _actually in_ a word.
<!-- Maybe pick a word w/ fewer scary IPA symbols? Slash one that's not an allophonic difference but a proper phonemic difference? -->
Since the word _the_ can be pronounced /ði/ or /ðə/, _the_ has two annotations on the <span class="layer">dictionary_phonemes</span> layer---but since only one of these is how the word was _actually pronounced_, _the_ only has one <span class="layer">phonemes</span> annotation.

Unlike <span class="keyterm">horizontal peers</span>, which divide the timespan of their scope, we can think of vertical peers as being "stacked" on top of one another within the same timespan.

| Allow for vertical peers? | Symbol[*](#fn:peers){: .footnote } | Meaning |
|---------------------------|--------|---------|
| True                      | ![]({{ '/assets/img/vertical-peers.svg' | relative_url }}) | A single timespan _may_ contain multiple annotations |
| False                     | (none) | A single timespan can contain at most one annotation |
{: .layer-props .no-keyterm }

<a id="fn:peers"/>\* Used on [individual transcript pages]({{ '/doc/view-transcript' | relative_url }})


### What you'll see in APLS

- [Individual transcript pages]({{ '/doc/view-transcript' | relative_url }})
  - In the layer selector, the symbol ![]({{ '/assets/img/vertical-peers.svg' | relative_url }}){: style="height:1rem;"} denotes layers that allow for vertical peers
  - **Only one vertical peer is visible on the transcript page**
    - For example, the <span class="layer">dictionary_phonemes</span> layer only shows `ðə` for the word _the_, even though _the_ has two <span class="layer">dictionary_phonemes</span> annotations
    - To check whether an annotation has vertical peers, view the transcript fragment in Praat instead

- [Transcript fragments]({{ '/doc/transcript-praat' | relative_url }})

- [Search]({{ '/doc/search' | relative_url }})

- [Exporting data]({{ '/doc/export-data' | relative_url }})





### Layers by vertical peers

{% include layer-table.html property="vertical_peers" categories="true,false" exclude_proj="temp,testing" %}


## Data type

Different layers contain different kinds of annotations.
For example, <span class="layer">foll_segment</span> annotations are speech sounds, while <span class="layer">foll_pause</span> annotations are numbers.
This distinction is captured by a layer's <span class="keyterm">data type</span>:

| Data type | Symbol[*](#fn:data-type){: .footnote } | Meaning | Notes |
|-----------|--------|---------|-------|
| Phonological layers | ![]({{ '/assets/img/word_layer_D.png' | relative_url }}) | Annotations are labeled with speech sounds | Some phonological layers' annotations are _individual_ sounds (like <span class="layer">segment</span>); others' are _sequences_ of sounds (like <span class="layer">syllables</span>). |
| Numeric layers | ![]({{ '/assets/img/word_layer_N.png' | relative_url }}) | Annotations are labeled with a measurement | Some numeric layers' annotations are counts (like <span class="layer">frequency_in_corpus</span>); others' are decimal numbers (like <span class="layer">foll_pause</span>). |
| Text layers | ![]({{ '/assets/img/word_layer_T.png' | relative_url }}) | Annotations are labeled with text | Most text layers' annotations are normal English spelling (like <span class="layer">word</span>) or lowercase English spelling (like <span class="layer">orthography</span>) |
| Timing-only layers | (none) | Annotations don't have a label, only a start/end time | The two timing-only layers represent temporal subdivisions of a transcript: <span class="layer">turn</span> and <span class="layer">utterance</span> |
{: .layer-props }

<a id="fn:data-type"/>\* Used on [individual transcript pages]({{ '/doc/view-transcript' | relative_url }})


### What you'll see in APLS

This distinction is mostly important for [search]({{ '/doc/search' | relative_url }}).

- [Individual transcript pages]({{ '/doc/view-transcript' | relative_url }})
  - In the layer selector, alignment is denoted by the symbols in the previous table

- [Search]({{ '/doc/search' | relative_url }})


### Layers by data type

{% include layer-table.html property="data_type" categories="phonological,numeric,text,timing-only" exclude_proj="temp,testing" %}


## Notation system

While [data type](#data-type) describes the _kinds_ of annotation that different layers contain, <span class="keyterm">notation systems</span> are what those annotations actually _look like_.
In other words, notation systems are the _details_ of how layers represent their data.
For example, the <span class="layer">phonemes</span> layer represents speech sounds as symbols in the [DISC phonemic alphabet]({{ '/doc/notation-systems#disc-alphabet' | relative_url }}), such as `fIS` for the word _fish_.

Almost all layers have a <span class="keyterm">primary notation system</span>.
(The exceptions are the <span class="keyterm">timing-only layers</span>, <span class="layer">turn</span> and <span class="layer">utterance</span>, since their annotations don't have labels---see [above](#data-type).)
Some layers have <span class="keyterm">additional notation</span>, depending on what their annotations need to represent.
For example, the <span class="layer">syllables</span> layer uses the [DISC phonemic alphabet]({{ '/doc/notation-systems#disc-alphabet' | relative_url }}) for speech sounds _plus_ [stress markers]({{ '/doc/notation-systems#disc-extensions' | relative_url }}) for stress, such as `'fIS` for the word _fish_.

Here are brief descriptions of primary notation systems, with links to more details on the [notation systems]({{ '/doc/notation-systems' | relative_url }}) page if applicable:

| Primary notation | Description       |
|------------------|-------------------|
| Boolean          | `True` or `False` |
| Count            | Positive whole numbers |
| DISC             | [DISC phonemic alphabet]({{ '/doc/notation-systems#disc-alphabet' | relative_url }}) |
| Decimal          | Decimal numbers |
| [English spelling]({{ '/doc/notation-systems#english-spelling' | relative_url }}) | |
| [English spelling]({{ '/doc/notation-systems#english-spelling' | relative_url }}) (lowercase) | |
| [Stress markers]({{ '/doc/notation-systems#disc-extensions' | relative_url }}) | `'` (primary stress)<br>`"` (secondary stress)<br>`0` (unstressed) |
| [Treebank part-of-speech tags]({{ '/doc/notation-systems#treebank-pos' | relative_url }}) | |
{: .layer-props .no-keyterm }

Here are additional notations:

| Additional notation | Brief description |
|---------------------|-------------------|
| [DISC pause]({{ '/doc/notation-systems#disc-extensions' | relative_url }}) | `.`               |
| Hesitation marker   | `~` (at the end of an incomplete word) |
| Morpheme boundary   | `+` |
| [Stress markers]({{ '/doc/notation-systems#disc-extensions' | relative_url }}) | `'` (primary stress)<br>`"` (secondary stress)<br>`0` (unstressed) |
| [Syllable boundary]({{ '/doc/notation-systems#disc-extensions' | relative_url }}) | `-` |
| Transcription pause/question markers | `.` (short pause)<br>`-` (long pause)<br>`?` (question) |
{: .layer-props .no-keyterm }

### What you'll see in APLS

- [Search]({{ '/doc/search' | relative_url }})
  - [More about how users will interact w/ notation systems than what they'll see]


### Layers by notation system

**Primary** notation system:

{% include layer-table.html property="notation.primary" categories="Boolean,Count,DISC,Decimal,English spelling,English spelling (lowercase),Stress markers,Treebank part-of-speech tags" exclude_proj="temp,testing" not_synced=true no_caps=true %}


**Additional** notation:

{% include layer-table.html property="notation.additional" categories="DISC pause,Hesitation marker,Morpheme boundary,Stress markers,Syllable boundary,Transcription pause/question markers" not_synced=true no_caps=true %}


## Alignment dependency

Some layers need information about individual speech sounds: which sounds are in a word, and where these sounds begin and end.
For example, a word's <span class="layer">phonemes</span> annotation is only possible if the word has <span class="layer">segment</span> annotations.
Other layers (like <span class="layer">part_of_speech</span>) don't depend on <span class="layer">segment</span> annotations.
This distinction is captured by <span class="keyterm">alignment dependency</span>:

| Alignment-dependent? | Meaning |
|----------------------|---------|
| True                 | Annotations are only present if the line contains <span class="layer">segment</span> annotations---in other words, if the line is <span class="keyterm">aligned</span> |
| False                | Annotations can be present even if the line is not <span class="keyterm">aligned</span> |
{: .layer-props .no-keyterm }

<!--
In APLS, <span class="keyterm">alignment</span> is generally on a line-by-line basis, meaning that most lines are either completely aligned or completely _not_ aligned.
Lines that are completely _not_ aligned won't have _any_ annotations on alignment-dependent layers.
-->

A layer can be alignment-dependent even if the <span class="layer">segment</span> layer isn't an input to the layer.
For example, <span class="layer">speech_rate</span> (a phrase layer) takes <span class="layer">syllables</span> as input, which takes <span class="layer">segment</span> as input;
if <span class="layer">segment</span> has no annotations in a turn, then <span class="layer">syllables</span> won't have any annotations, which means <span class="layer">speech_rate</span> won't have any annotations.


### What you'll see in APLS

- [Individual transcript pages]({{ '/doc/view-transcript' | relative_url }})
  - [Whole turns w/ big chunks of no annotations]

- [Search]({{ '/doc/search' | relative_url }})
  - [False negatives in search because turn isn't aligned]


### Layers by alignment dependency

{% include layer-table.html property="alignment_dependent" categories="true,false" exclude_proj="temp,testing" not_synced=true %}


## Project

Different layers pertain to different levels of linguistic representation.
For example, <span class="layer">morphemes</span> annotations pertain to how words are represented in the lexicon, while <span class="layer">speech_rate</span> annotations pertain to the timing of a particular line of speech.
As a result, APLS categorizes layers into <span class="keyterm">projects</span>:

| Project   | Meaning | Notes |
|-----------|---------|-------|
| syntax    | Annotations pertain to syntactic structure | |
| lexicon   | Annotations pertain to how words are represented in the lexicon | |
| timing    | Annotations pertain to timing/rhythm of speech and speaker turns | |
| phonology | Annotations pertain to the speech sounds in a word | All of these layers are <span class="keyterm">phonological layers</span>, see [data type](#data-type) above |
| imported  | Annotations were imported from the original transcription | |
| temp      | Annotations are either metadata on how other layers were generated, or their only job is to provide data for other layers | |
| testing   | Test layers that aren't "ready for prime time" | |
| (none)    | Layers whose check-boxes are always shown by default on the [search]({{ '/doc/search' | relative_url }}) and [transcript]({{ '/doc/view-transcript' | relative_url }}) pages | |
{: .layer-props .no-keyterm }


### What you'll see in APLS

The main reason projects exist is to reduce visual clutter on the [search]({{ '/doc/search' | relative_url }}) and [transcript]({{ '/doc/view-transcript' | relative_url }}) pages.
When the page loads, only a few layers are selectable (those without a project): [IMAGE]
Click a layer's project to make the layer selectable: [IMAGE]

Unlike other layer properties, projects don't affect _anything_ about how layers are represented, how you need to search for them, export them, etc.
<!-- So while these categories are somewhat arbitrary, -->


### Layers by project

{% include layer-table.html property="project" categories="(none),syntax,lexicon,timing,phonology,imported,temp,testing" no_caps=true %}

Note: "temp" and "testing" layers aren't meaningful for end-users, so they've been omitted from the other "layers by property" tables on this page.