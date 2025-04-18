---
title: Anchoring searches
permalink: /doc/anchoring-searches
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 70
last_modified_date: 2025-04-12T15:53:35:z
---

# {{ page.title }}
{:.no_toc}

Some layers contain annotations that can span multiple words or can include multiple annotations per word.
These layers allow you to "anchor" your search pattern to match the beginning or the end of that layer's [scope]({{ '/doc/layer-typology#scope' | relative_url }}) using the lock icons (shown as unlocked when not active ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} and locked when active ![]({{ '/assets/img/lock-locked.svg' | relative_url }}){: style="height:1rem;"}).

The following [phrase layers]({{ '/doc/layer-typology#scope' | relative_url }}) layers have anchoring as their _only_ search parameter:
- <span class="layer">turn</span>
- <span class="layer">utterance</span>

{: .try-it }
> To search for the word "yes" occurring at the beginning of speaker turns:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `timing` project in the layer picker and click the checkbox for the <span class="layer">turn</span> layer to make the turn input field appear.
> 1. Click the lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} on the left side of the turn input field.
> 1. Enter `yes` into the orthography input field.
> 1. Click the _Search_ button.
> - To compare this with the number of results for "yes" without <span class="layer">turn</span> layer anchoring, click the lock ![]({{ '/assets/img/lock-locked.svg' | relative_url }}){: style="height:1rem;"} again to turn off anchoring and click the _Search_ button.

The following [span layers]({{ '/doc/layer-typology#scope' | relative_url }}) have pattern input fields that are like the <span class="layer">orthography</span> layer, with the addition of anchoring options:
- <span class="layer">comment</span>
- <span class="layer">noise</span>

The following [segment layers]({{ '/doc/layer-typology#scope' | relative_url }}) also support anchoring to the beginning or end of words:
- <span class="layer">segment</span>
- <span class="layer">foll_segment</span>

{: .try-it }
> To find matches for every instance of /s/ followed by /t/ that occurs at the end of words:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click the `+` button inside of the segment box to make another segment input field appear.
> 1. Enter `s` in the first segment field and `t` in the second segment field.
> 1. Click the lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} on the right side of the segment input field.
> 1. Click the _Search_ button.
