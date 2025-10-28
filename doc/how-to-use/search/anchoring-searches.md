---
title: Anchoring searches
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/anchoring-searches
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 70
last_modified_date: 2025-10-28T16:54:32-04:00
---

# {{ page.title }}
{:.no_toc}

Some layers contain annotations that can span multiple words or can include multiple annotations per word.
These layers allow you to "anchor" your search pattern to match the beginning or the end of that layer's [scope]({{ '/doc/layer-typology#scope' | relative_url }}) using the lock icons (shown as unlocked when not active {% include labbcat-icon.html src="lock-unlocked.svg" %}{:style="opacity:0.5;"} and locked when active {% include labbcat-icon.html src="lock-locked.svg" %}).

The following [phrase layers]({{ '/doc/layer-typology#scope' | relative_url }}) layers have anchoring as their _only_ search parameter:
- <span class="layer">turn</span>
- <span class="layer">utterance</span>

{: .try-it }
> To search for the word "yes" occurring at the beginning of speaker turns:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `timing` project in the layer picker and click the checkbox for the <span class="layer">turn</span> layer to make the turn pattern input appear.
> 1. Click the lock {% include labbcat-icon.html src="lock-unlocked.svg" %}{:style="opacity:0.5;"} on the left side of the turn pattern input.
> 1. Enter `yes` into the orthography input box.
> 1. Click the _Search_ button.
> - To compare this with the number of results for "yes" without <span class="layer">turn</span> layer anchoring, click the lock {% include labbcat-icon.html src="lock-locked.svg" %} again to turn off anchoring and click the _Search_ button.

The following [span layers]({{ '/doc/layer-typology#scope' | relative_url }}) have pattern inputs that are like the <span class="layer">orthography</span> layer, with the addition of anchoring options:
- <span class="layer">comment</span>
- <span class="layer">noise</span>

The following [segment layers]({{ '/doc/layer-typology#scope' | relative_url }}) also support anchoring to the beginning or end of words:
- <span class="layer">segment</span>
- <span class="layer">foll_segment</span>

{: .try-it }
> To find matches for every instance of /s/ followed by /t/ that occurs at the end of words:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the <span class="layer">segment</span> pattern input appear.
> 1. Click {% include labbcat-icon.html src="add.svg" %} inside of the segment box to make another segment pattern input appear.
> 1. Enter `s` in the first segment input box and `t` in the second segment input box.
> 1. Click the lock {% include labbcat-icon.html src="lock-unlocked.svg" %}{:style="opacity:0.5;"} on the right side of the segment pattern input.
> 1. Click the _Search_ button.
