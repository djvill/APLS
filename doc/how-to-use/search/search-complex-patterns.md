---
title: Searching complex patterns
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search-complex-patterns
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 80
last_modified_date: 2025-05-27T16:46:13-04:00
---

# {{ page.title }}
{:.no_toc}

This page provides details on some of the more complex searches you can do in APLS: [multi-word searches](#searching-multiple-words), [multi-layer searches](#searching-multiple-words), and [multi-word multi-layer searches](#searching-multiple-words-and-multiple-layers).
These advanced searches rely on features described on other [search documentation pages]({{ '/doc/search' | relative_url }}), so it is recommended that you review those first if you are new to using APLS.

{% include page_toc.html collapsible=true %}

## Searching multiple words

In an [earlier documentation page]({{ '/doc/your-first-search' | relative_url }}), we said that searching `not even` in the <span class="layer">orthography</span> layer would not return any matches because there are no single words that match "not even".
The way to search for multiple words is to make the search "wider".

Clicking {% include labbcat-icon.html src="add.svg" %} on the right side of the input fields makes the search wider by adding another word to your search pattern.

{% include screengrab.html src="search/input-field-orthography2.png" %}

The *followed immediately by* drop-down menu lets you choose whether the search should be the immediate next word, 1 word after the immediate next word, or 2 words after the immediate next word.

You can make your pattern as wide as you need to conduct your search, and every additional input field works exactly like the initial input field for that layer.
Clicking {% include labbcat-icon.html src="remove.svg" %} makes your search narrower by removing a word from your search pattern.

{: .try-it }
> To search for every instance of the word "not" immediately followed by the word "even":
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Click {% include labbcat-icon.html src="add.svg" %} to make your search pattern one word wider.
> 1. Enter `not` in the first orthography layer text field and enter `even` in the second orthography layer text field.
> 1. Click the _Search_ button.

Similar to [multiple segment searches]({{ '/doc/search-segments#searching-for-multiple-segments-within-a-word' | relative_url }}), you can designate one of the words in your multi-word search as your "token of interest" by clicking the target {% include labbcat-icon.html src="target.svg" %} for that word.
This will not affect the number of matches that are found, but it will affect what information is included when [exporting data]({{ '/doc/export-data' | relative_url }}).

## Searching multiple layers

Up to this point in the documentation, most of the <span class="apls-page">Search</span> page capabilities have been demonstrated with single layer searches.
Many researchers, however, will be interested in finding patterns that match multiple types of criteria.
Constructing a search using multiple layers makes this possible.

For example, the "Try it!" below uses the <span class="layer">orthography</span> layer and the <span class="layer">part_of_speech</span> layer to find all instances of "run" as a noun.

{: .try-it }
> To find matches for all instances of "run" used as a noun:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer picker and click the checkbox for the <span class="layer">part_of_speech</span> layer to make the part_of_speech input field appear.
> 1. Enter `can` into the orthography input field. 
> 1. Click the part_of_speech drop-down menu button ({% include labbcat-icon.html src="expand-down.svg" %}) and select _NN_ from the _NOUN:_ section.
> 1. Click the _Search_ button.

You can also use the _matches_ drop-down menus to find results that match on some layers and don't match on other layers.
An example is given in the "Try it!" below using the <span class="layer">segment</span> layer and the <span class="layer">stress</span> layer to find /u/ without primary stress.

{: .try-it }
> To find all matches for the segment /u/ that don't have primary stress:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `u` into the segment input field.
> 1. Select the `phonology` project in the layer picker and click the checkbox for the <span class="layer">stress</span> layer to make the stress input field appear.
> 1. Click the drop-down selection menu on the right side of the stress input field and select _primary_.
> 1. Click the _matches_ drop-down menu for the stress input field and select _doesn't match_.
> 1. Click the _Search_ button.

The target {% include labbcat-icon.html src="target.svg" %} option becomes particularly useful when doing multi-layer searches that include segment layers.
As mentioned in [Searching segments within words]({{ '/doc/search-segments' | relative_url }}), segment layers search for individual speech sound matches and all other layers search for word matches.
By default, multi-layer searches will look for one match per word.
If you want the results to contain matches for every instance of a segment(s), you should click the target {% include labbcat-icon.html src="target.svg" %} for the segment input field.

{: .try-it }
> To generate search results with matches for both /i/ vowels in the word "really", so that every instance of "really" appears twice:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `really` into the orthography input field and `i` into the segment input field.
> 1. Click the target {% include labbcat-icon.html src="target.svg" %} for the segment input field.
> 1. Click the _Search_ button.
>
> If you conduct this same search with the __orthography layer__ as the target layer, you will get half the number of results because the search is only matching each instance of the word "really" once.

## Searching multiple words and multiple layers

Because the <span class="apls-page">Search</span> page uses a matrix of expressions to find search results, searches can be simple (one word wide and one layer deep) or complex (multiple words wide and multiple layers deep).
This allows the search function to find very specific matches based on multiple different criteria.

{: .try-it }
> To find matches for every consonant-initial verb that is preceded by the word "the":
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer picker to make the <span class="layer">part_of_speech</span> layer appear in the selection menu.
> 1. Select the <span class="layer">part_of_speech</span> layer in the selection menu to make the part_of_speech pattern input field appear.
> 1. Enter `the` in the orthography layer text field.
> 1. Click {% include labbcat-icon.html src="add.svg" %} to make the search pattern one word wider.
> 1. Open the drop-down menu for the second part_of_speech input field and click _VERB:_ to add a regex pattern that will match all adjectival POS tags.
> 1. Open the drop-down menu for the second segment input field and click _CONSONANT_ to add a regex pattern that will match all consonant segments.
> 1. Click the lock {% include labbcat-icon.html src="lock-unlocked.svg" %} on the left side of the second segment input field to specify that you only want to match words that begin with a consonant segment.
> 1. Click the target {% include labbcat-icon.html src="target.svg" %} for the second part_of_speech input field to select the second word as the target of your search (as opposed to targeting "the").
> 1. Click the _Search_ button.
