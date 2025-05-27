---
title: Your first search - <span class="layer">orthography</span>
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/your-first-search
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 10
last_modified_date: 2025-05-27T12:32:04-04:00
---

# {{ page.title }}
{:.no_toc}

If you are a newcomer to APLS, this page will help you get acquainted with the [_search_](https://apls.pitt.edu/labbcat/search) page by walking you through a simple corpus search.
After following along with the example search on this page, you can visit the other pages in the [_search_ page documentation]({{ '/doc/search' | relative_url }}) to learn about the more advanced _search_ page features.

{% include page_toc.html collapsible=true %}

## Your first search

You can specify the pattern you'd like to search for using the <span class="keyterm">pattern input fields</span>.

We'll begin with the input field for the <span class="layer">orthography</span> layer because it is selected by default.

{: .note}
> The <span class="layer">orthography</span> layer is selected by default instead of the similar sounding <span class="layer">word</span> layer because <span class="layer">orthography</span> layer is case-insensitive and it does not contain word-external punctuation.
> However, the <span class="layer">word</span> layer contains words exactly as they were typed in the transcript, including capitalization and all punctuation. 
> If you are conducting searches on the basis of word spelling, it is recommended to use the <span class="layer">orthography</span> layer instead of the <span class="layer">word</span> layer.

{% include screengrab.html src="search/search-input-field-orthography.png" %}

At the top-left of the input field section, you will see the name of the layer that input field will apply to.

The text box for entering the pattern you'd like to search for is on the right-side of the input field section.

{: .try-it }
> To see how many times "steelers" appears in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `steelers` into the orthography input field.
> 1. Click the _Search_ button.

Certain layers have a target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) that determines what the "token of interest" is for your search.
The target (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) option is mostly useful for [searching multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), [searching within words]({{ '/doc/search-segments' | relative_url }}), [searching multiple layers]({{ '/doc/search-complex-patterns#searching-multiple-layers' | relative_url }}), and [searching multiple words and multiple layers]({{ '/doc/search-complex-patterns#searching-multiple-words-and-multiple-layers' | relative_url }}).

The _matches_ drop-down menu is located below the layer name of the input field.
The _matches_ and _doesn't match_ options are most powerful when used with more complex searches, as explained in [Searching for inverted matches]({{ '/doc/inverted-matches' | relative_url }}).

This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

{:.note .no-collapse}
> Pattern input fields look for matches in the corpus by individual word, rather than entire utterances. 
> For example, if you entered `not even` into the orthography input field, you would not get any results because "not even" will never match a single word in any transcript.
> However, you can expand the size of your search to include multiple words, as explained in the [Searching multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}) section of the [Searching complex patterns]({{ '/doc/search-complex-patterns' | relative_url }}) page.

## Search results

The search progress bar appears at the bottom of the page only after you've specified your search and clicked the _Search_ button.

{% include screengrab.html src="search/search-progress-bar.png" %}

Above the progress bar itself is text displaying the patterns of your search.

The progress bar fills itself in to reflect the current state of your search, such as if the search is being initialized or if the APLS data is being queried.

{:.note}
> Some searches will return results quickly, but more complex searches or searches involving a lot of transcripts may take a longer time to complete.
> As long as the search progress bar is being displayed, it means that APLS is working on doing your search!

After the search is complete, the number of results found is displayed beneath the progress bar and a link to _Display results_ is shown that will take you to the search results page.
For information on using the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.
