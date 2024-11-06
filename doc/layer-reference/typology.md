---
title: Typology
layout: default
permalink: /doc/typology
parent: Layer reference
nav_order: 10
last_modified_date: 2024-11-06T09:15:21-05:00
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


### Examples


### Layers by scope

{% assign layers = site.layers | where_exp: "item", "item.synced.project != 'temp' and item.synced.project != 'testing'" %}

{% assign span_layers = layers | where: "synced.scope", "span" %}
{% assign phrase_layers = layers | where: "synced.scope", "phrase" %}
{% assign word_layers = layers | where: "synced.scope", "word" %}
{% assign segment_layers = layers | where: "synced.scope", "segment" %}

<table class="layers-by-attr" id="layers-by-scope">
  <thead>
    <tr>
      <th>Span</th>
      <th>Phrase</th>
      <th>Word</th>
      <th>Segment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <ul>{% for layer in span_layers %}<li><span class="layer">{{ layer.path | remove: "_layers/" | remove: ".md" }}</span></li>{% endfor %}</ul>
      </td>
      <td>
        <ul>{% for layer in phrase_layers %}<li><span class="layer">{{ layer.path | remove: "_layers/" | remove: ".md" }}</span></li>{% endfor %}</ul>
      </td>
      <td>
        <ul>{% for layer in word_layers %}<li><span class="layer">{{ layer.path | remove: "_layers/" | remove: ".md" }}</span></li>{% endfor %}</ul>
      </td>
      <td>
        <ul>{% for layer in segment_layers %}<li><span class="layer">{{ layer.path | remove: "_layers/" | remove: ".md" }}</span></li>{% endfor %}</ul>
      </td>
    </tr>
  </tbody>
</table>



## Alignment and horizontal peers

Some annotations take up just part of their scope, and some annotations take up their entire scope.
For example, <span class="layer">syllables</span> annotations can take up just part of their corresponding word (if the word is multisyllabic);
by contrast, each word has just one <span class="layer">frequency_in_corpus</span> annotation.
When annotations take up just part of their scope, we say they have <span class="keyterm">horizontal peers</span>: "peers" because they share a scope with other annotations, "horizontal" because we often conceptualize time on an x-axis (i.e., from left to right).
This distinction is captured by layer <span class="keyterm">alignment</span>.

Layers can have one of three possible alignments:

- <span class="keyterm">Complete interval</span>: Annotations span their entire scope
- <span class="keyterm">Sub-interval(s)</span> (aka <span class="keyterm">horizontal peers</span>): Annotations span part (or all) of their scope
  - There may or may not be gaps between annotations within a scope. For example, there are usually long gaps between <span class="layer">comment</span> annotations within a transcript
- <span class="keyterm">Timepoint</span>: Annotations don't have a start and end time, just a time
  - There aren't currently any timepoint layers in APLS. If we wanted to store vowel measurements in a layer, then we might do so in a timepoint layer (i.e., at the vowel's midpoint).


In APLS, alignment is represented by these symbols: <!-- SYMBOLS -->.
A layer's alignment also affects things like [search]({{ '/doc/search' | relative_url }}) and [export]({{ '/doc/export' | relative_url }}).


### Examples


### Layers by alignment



There aren't currently any timepoint layers in APLS.


## Vertical peers

Some layers allow for <span class="keyterm">vertical peers</span>: 2 or more annotations that occupy an identical timespan.
For example, since the word _the_ can be pronounced [ði] or [ðə] <!-- Maybe pick a word w/ fewer scary IPA symbols? Slash one that's not an allophonic difference but a proper phonemic difference? -->, it is represented on the <span class="layer">dictionary_phonemes</span> layer by two annotations.
Unlike <span class="keyterm">horizontal peers</span>, which divide the timespan of their scope, vertical peers are "vertical" because we can think of them as being "stacked" on top of one another.

In APLS, a layer with vertical peers is represented by this symbol: <!-- SYMBOL -->.
When [viewing a transcript]({{ '/doc/view-transcript' | relative_url }}) in APLS, only one vertical peer is shown;
for example, the <span class="layer">dictionary_phonemes</span> layer only shows <!-- WHICH --> for the word _the_, even though _the_ has two <span class="layer">dictionary_phonemes</span> annotations.
This also affects things like [search]({{ '/doc/search' | relative_url }}) and [export]({{ '/doc/export' | relative_url }}).


### Examples


### Layers by vertical peers



## Data type

[text vs. phono vs. number]
[Mostly important for search]


## Project

[arbitrary categories]
