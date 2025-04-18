---
title: Exporting data
permalink: /doc/export-data
parent: How to use APLS
nav_order: 60
last_modified_date: 2025-04-14T20:19:17:z
---

# {{ page.title }}
{:.no_toc}

After you've explored APLS, conducted a search, and found data you're interested in, the next thing you'll probably want to do is export that data out of the corpus for further analysis.

This page is meant to help you understand what you can export and how you can export it after you've conducted a [search]({{ '/doc/search' | relative_url }}) or have a [search results `.csv` file](#csv-export-options).
If you're unfamiliar with searching APLS, you should start with the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation and return here after you've completed a search.

{% include page_toc.html collapsible=true %}

## Pages that can export data

This documentation page focuses on the [search results page](#search-results-page), but there are other pages in APLS that let you export data as well.
These pages and the data that they export are:
- [_participants_ page]({{ '/doc/browse-participants#export-attributes' | relative_url }})
  - Lets you export [participant attribute data]({{ '/doc/attribute-typology' | relative_url }})
- [_transcripts_ page]({{ '/doc/browse-transcripts#exporting-and-searching-transcripts' | relative_url }})
  - Lets you export entire transcripts and [transcript attribute data]({{ '/doc/transcript-attributes' | relative_url }}).
- Individual [transcript]({{ '/doc/view-transcript#export-formatted-' | relative_url }}) pages
  - Lets you export [selected layers]({{ '/doc/view-transcript#layer-selector' | relative_url }}) from individual transcripts 
- [_extract_ page]({{ '/doc/extract-acoustics' | relative_url }})
  - Lets you upload a [search results `.csv` file](#csv-export-options) to extract additional information about your search result matches

## Search results page

After conducting a search using the [_search_ page]({{ '/doc/search' | relative_url }}), you will be presented with a page of results for every match in APLS.
Before diving into the export options of the search results page, we will cover the layout of the results page.

![]({{ '/assets/screengrab/export-data/export-data-search-results-layout.png' | relative_url }})

The header at the top of the screen displays the search that was conducted.
The syntax for these searches is the layer that was searched followed by the pattern that the layer was searched for.

The first piece of information below the search header is the number of match results and the total duration of the utterances containing the matches.

Below the total results information are two options:
- A checkbox to de-select all results (all results are selected by default)
- A drop-down menu allowing you to select how much context to show before/after the match
<!-- UI thing: can we change the drop-down options? 
I think prefixing the numerical ones with "up to" (e.g., "up to 1 word") and changing "the whole line" to "entire utterance" would be good.
I'm on the fence about changing "no context" to "0 words" though; it seems more clear but that could just be me-->

{:.note}
> The context for a match will never extend beyond the utterance that contains the match.
> For example, if a match occurs at the end of an utterance, then the context options will never show words that come after the match (even if there is an utterance after the utterance containing the match).

{:.note .no-collapse}
> These options affect what is included in your data export, in addition to affecting what is displayed on the search results page.
  
Below these options are rows for each match, which contain a few different pieces of information.

![]({{ '/assets/screengrab/export-data/export-data-search-results-rows1.png' | relative_url }})

Each match is given a row number to identify that match.
Individual matches can be selected using the checkbox next to the match if you de-select the _Select all results_ checkbox.

The heading of each row contains the name of the transcript containing the match, followed by the speaker of that utterance.
Search results are grouped by transcript first and speaker second.

Below the row heading is the match for the search highlighted in yellow, with the surrounding words displayed on both sides of the match (if there are surrounding words to display).
Clicking the text of the match will take you directly to the location for that match in the transcript that contains it.

If you search has more than 20 matches, the search results page will initially only display the first 20 matches.
You can display more results by clicking the `n More Matches` or `n Remaining Matches` buttons at the bottom of the results list.

### Exporting data from the search results page

Once you have selected the match results and amount of context you're interested in, you can export your results as 4 different types of data:
- [`.csv`](#csv-export-options) 
- [Dictionary](#dictionary-export-options) (`.txt`) 
- [Utterance](#utterance-export-options) 
- [Audio](#audio-export-options) 

#### `.csv` export options

Clicking the _CSV Export_ button will download the selected results as a `.csv` file.

Certain information about the results will be included in the `.csv` by default.
Clicking the ▼ button next to _CSV Export_ allows you to select what data you would like included in the exported `.csv` file.
You can add metadata information, participant and transcript attributes, and layer annotations by clicking the checkbox for the data you would like to include.

The _Fields:_ column is unique to the _search_ page _CSV Export_, and it allows you to include information about your search and the relative location for where your search matches were found.
`Database title`, `Search name`, `Match ID`, and `URL` are always included in the exported `.csv` file and cannot be toggled off.

The [participant attributes]({{ '/doc/attribute-typology' | relative_url }}), [transcript attributes]({{ '/doc/transcript-attributes' | relative_url }}), and [layers]({{ '/doc/layer-field-guide' | relative_url }}) are described on their respective field guide pages.
You can also hover over the names of each checkbox to make a brief tooltip description appear.

Layers that have sub-interval alignments (shown with the ![]({{ '/assets/img/alignment-2.svg' | relative_url }}) icon) or horizontal peers (shown with the ![]({{ '/assets/img/vertical-peers.svg' | relative_url }}) icon) will also display numeric boxes when you select them.
This box allows to choose the number of related annotations to include.

<!-- 
I exported results for all 14-letter words in APLS and I think it's going to take me longer than I expected to explain when it is or isn't useful to include multiple annotations
-->

Sub-interval alignment ![]({{ '/assets/img/alignment-2.svg' | relative_url }}) icon layers will also display lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} icons on the sides of the annotation count selector.
These lock icons let you anchor the data exported for that layer to the start or end of the match target.


#### Dictionary export options
<!-- 
ask Dan about the utility/use cases/any other insights about the dictionary export options 
Dan says: maybe i wanna understand all the word forms that start with "pitt", the dictionary allows a download of all the results in a more straightforward txt format
OR another use case is what are all the words that can follow "not"?
OR identifying possible stop words for a search
-->


<!-- the location for `prefix names` has been changed in apls-dev -->

#### Utterance export options



#### Audio export options

<!-- seems like prefix names is the only option? -->
