---
title: Searching for inverted matches
permalink: /doc/searching-for-inverted-matches
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 50
last_modified_date: 2025-04-12T15:53:35:z
---

# {{ page.title }}
{:.no_toc}

Searching for inverted matches allows you to find results that *don't* match specified parts of your search pattern.
You can choose to do an inverted match search on a layer by using the _matches_ drop-down menu.

{% include page_toc.html collapsible=true %}

## Searching for results that don't match

The _matches_ drop-down menu is located below the layer name of the input field.
This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

However, a simple search for non-matches could be to find all the words in APLS that are *not* the word "penguins":

{: .try-it }
> To find all instances of words that are not the word "penguins":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `penguins` into the orthography input field.
> 1. Click the _matches_ drop-down menu for the orthography input field and select _doesn't match_.
> 1. Click the _Search_ button.

Non-matching searches can also be combined with [regex patterns]({{ '/doc/regex' | relative_url }}) to specify a range of values to not match.
For example, you could find all non-consonantal words in APLS by using a _doesn't match_ search on the <span class="layer">phonemes</span> layer:

{: .try-it }
> To find all matches for non-consonantal words:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `phonology` project in the layer picker and click the checkbox for the <span class="layer">phonemes</span> layer to make the phonemes input field appear.
> 1. Enter `.*` in the phonemes input field.
> 1. Click the drop-down selection menu on the right side of the phonemes input field and select _CONSONANT:_.
> 1. Enter `.*` again at the end of the phonemes input field.
> 1. Click the _matches_ drop-down menu for the stress input field and select _doesn't match_.
> 1. Click the _Search_ button.

The _doesn't match_ option is also useful when used with multiple layers, as described in the [Searching multiple layers]({{ '/doc/searching-complex-patterns#searching-multiple-layers' | relative_url }}) section of the [Searching with complex patterns]({{ '/doc/searching-complex-patterns' | relative_url }}) page.
