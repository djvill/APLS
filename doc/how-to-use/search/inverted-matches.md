---
title: Searching for inverted matches
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/inverted-matches
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 50
last_modified_date: 2025-10-24T13:31:15-04:00
---

# {{ page.title }}
{:.no_toc}

Searching for inverted matches allows you to find results that *don't* match specified parts of your search pattern.
You can choose to do an inverted match search on a layer by using the _matches_ drop-down menu.

{% include page_toc.html collapsible=true %}

## Searching for results that don't match

The _matches_ drop-down menu is located to the left of the input box.
This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

However, a simple search for non-matches could be to find all the words in APLS that are *not* the word "penguins":

{: .try-it }
> To find all instances of words that are not the word "penguins":
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `penguins` into the orthography input box.
> 1. Click the _matches_ drop-down menu for orthography and select _doesn't match_.
> 1. Click the _Search_ button.

Non-matching searches can also be combined with [regex patterns]({{ '/doc/regex' | relative_url }}) to specify a range of values to not match.
For example, you could find all words with _no_ consonants in APLS by using a _doesn't match_ search on the <span class="layer">phonemes</span> layer:

{: .try-it }
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `phonology` project in the layer picker and click the checkbox for the <span class="layer">phonemes</span> layer to make the phonemes pattern input appear.
> 1. Enter `.*` in the phonemes input box.
> 1. Click the drop-down menu button ({% include labbcat-icon.html src="expand-down.svg" %}) and select _CONSONANT:_.
> 1. Enter `.*` again at the end of the phonemes input box.
> 1. Click the _matches_ drop-down menu for phonemes and select _doesn't match_.
> 1. Click the _Search_ button.

The _doesn't match_ option is also useful when used with multiple layers, as described in the [Searching multiple layers]({{ '/doc/search-complex-patterns#searching-multiple-layers' | relative_url }}) section of the [Searching with complex patterns]({{ '/doc/search-complex-patterns' | relative_url }}) documentation page.

## Excluding stop-words

One useful application of the _doesn't match_ option is removing stop-words: highly frequent lexical items that are often treated as outside the bounds of typical linguistic processes.
For example, analyses of vowels' acoustic measurements [often exclude](https://doi.org/10.1515/lingvan-2022-0065) words that are likely to undergo vowel reduction.
To exclude stop-words, set the <span class="layer">orthography</span> layer to _doesn't match_ the list of stop-words separated by [`|`]({{ '/doc/regex#vertical-pipe-' | relative_url }}).

{: .try-it }
> Let's find all words that contain /æ/, excluding _an_, _and_, _as_, _at_, or _that_.
> 1. On the <span class="apls-page">Search</span> page, select the <span class="layer">phonemes</span> layer to make the phonemes pattern input appear.
> 1. Enter `.*` in the phonemes input box.
> 1. Click the drop-down menu button ({% include labbcat-icon.html src="expand-down.svg" %}) and select _æ_. <!-- Currently this incorrectly enters `{` -- will be fixed in APLS-Dev! -->
> 1. Enter `.*` again at the end of the phonemes input box.
> 1. Select _doesn't match_ for orthography.
> 1. Enter `an|and|as|at|that` in the orthography input box.
> 1. Click the _Search_ button.

There is no definitive list of stop-words---different analyses may require wider or narrower definitions of how to decide whether a word should be excluded.
To guide your decisions, it can be useful to create a wider search initially, then use the {% include labbcat-icon.html src="book.svg" %} _Dictionary_ export option to [find the unique words]({{ '/doc/regex#checking-your-search-matches' | relative_url }}) that your search returns.

{% comment %}
TODO figure out how to deal w/ empty annotations.
Two contexts: (1) _doesn't match_ REGEX looks for "annotations that aren't REGEX", so it doesn't include empty annotations, (2) to find empty annotations, use the special syntax _doesn't match_ `.+`.
The former belongs on this page, the latter probably not (it's connected to _doesn't match_ by form but not by function).
But the larger topic deserves its own page.

Can frame in terms of (1) segment dependency, (2) other structural empties (e.g., all words w/o an orthography annotation are redacted [minus some weird ones that are just . or - or ?]), (3) rando missings (eventually link to data coverage page)
{% endcomment %}

