---
title: Searching segments within words
permalink: /doc/searching-segments-within-words
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 60
last_modified_date: 2025-05-01T16:35:09-04:00
---

# {{ page.title }}
{:.no_toc}

Layers in APLS have different [scopes]({{ '/doc/layer-typology#scope' | relative_url }}): <span class="keyterm">span</span>, <span class="keyterm">phrase</span>, <span class="keyterm">word</span>, and <span class="keyterm">segment</span>.
You may notice that these are the column names at the top of the layer picker!

The searches discussed on previous documentation pages have been in the first three scopes (<span class="keyterm">span</span>, <span class="keyterm">phrase</span>, and <span class="keyterm">word</span>).
This is because the _search_ page looks for matches word-by-word, 
so <span class="keyterm">span</span> and <span class="keyterm">phrase</span> layer searches give results at the <span class="keyterm">word</span> level even though <span class="keyterm">span</span> and <span class="keyterm">phrase</span> scopes are larger than <span class="keyterm">word</span> scope.

{: .note}
> For instance, if you did a search to find all the overlaps in APLS using the <span class="keyterm">overlap</span> layer, you would get results for each individual word that occurs in a stretch of overlapped speech, even though the actual <span class="keyterm">overlap</span> annotation might be longer than a single word.

{: .under-the-hood}
> Some <span class="keyterm">word</span> layers, like <span class="layer">syllables</span>, may seem like they would be <span class="keyterm">segment</span> layers, but they are actually sub-interval <span class="keyterm">word</span> annotations.
> These are also called <span class="keyterm">horizontal peers</span>, which are explained on the [Layer typology]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}) documentation page.

<span class="layer">segment</span> and <span class="layer">foll_segment</span> are the two <span class="keyterm">segment</span> layers in APLS.
These <span class="keyterm">segment</span> layers can be used to find matches for [individual speech sound segments](#searching-for-a-single-segment) and to create [within-word segment patterns](#searching-for-multiple-segments-within-a-word).

{% include page_toc.html collapsible=true %}

## Searching for a single segment

The difference between matching to segments and matching to words is that segments don't need to have their surrounding context defined.

For instance, if you wanted to search for every instance of /j/ using the <span class="layer">phonemes</span> layer, you would need to enter the regex `.*j.*` to find words containing /j/.
With the <span class="layer">segment</span> layer, you would only to search `j` because the search is looking at individual speech sounds to find matching segments.

{: .try-it }
> To find matches for every instance of /ɔɪ/:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select `ɔɪ` from the `DIPHTHONGS` section.
> 1. Click the _Search_ button.

## Searching for multiple segments within a word

Next to the the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) for the <span class="layer">segment</span> and <span class="layer">foll_segment</span> layers is a `+` button.
Clicking ![]({{ '/assets/img/add.svg' | relative_url }}){: style="height:1rem;"} on the right side of the segment input field adds another input field for the segment that immediately follows the previous segment.
This allows you to construct patterns that search for a sequence of segments within a word.

{:.note}
> It is strongly recommended to not attempt within-word searches for <span class="layer">segment</span> and <span class="layer">foll_segment</span> at the same time.
> Because of how these searches look for matches, specifying within-word patterns for both <span class="layer">segment</span> and <span class="layer">foll_segment</span> will most likely return no results or result in an error message.

{: .try-it }
> To find matches for every instance of /l/ followed by /t/:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click ![]({{ '/assets/img/add.svg' | relative_url }}){: style="height:1rem;"} inside of the segment box to make another segment input field appear.
> 1. Enter `l` in the first segment field and `t` in the second segment field.
> 1. Click the _Search_ button.

You can designate one of the segments in your within-word search as your "token of interest" by clicking the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for that segment.
This will not affect the number of matches that are found, but it will affect what information is included when [exporting data]({{ '/doc/export-data' | relative_url }}).
