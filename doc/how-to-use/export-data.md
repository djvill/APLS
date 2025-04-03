---
title: Exporting data
permalink: /doc/export-data
parent: How to use APLS
nav_order: 60
last_modified_date: 2025-03-24T19:35:12:z
---

# {{ page.title }}
{:.no_toc}

This page describes how to export data out of APLS to conduct further linguistic analyses.

{% include page_toc.html collapsible=true %}

## Pages that can export data

- [Search results page](#search-results-page)
- [_extract_ page]
- [_participants_ page]({{ '/doc/browse-participants#exporting-and-searching-participant-data' | relative_url }})
- [_transcripts_ page]({{ '/doc/browse-transcripts#exporting-and-searching-transcripts' | relative_url }})
- Individual [transcript]({{ '/doc/view-transcript#export-formatted-▼' | relative_url }}) pages

<!-- am I missing any others? -->

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
- `.csv` 
- Dictionary (`.txt`) 
- Utterance
- Audio

#### `.csv` export options

Clicking the _CSV Export_ button will download the selected results as a `.csv` file.
Certain information about the results will be included in the `.csv` by default.
Clicking the ▼ button next to _CSV Export_ allows you to select what data you would like included in the exported `.csv` file.
You can add metadata information, participant and transcript attributes, and layer annotations by clicking the checkbox for the data you would like to include.

<!-- ask Dan about (1) the csv fields that aren't described elsewhere and (2) how much detail to go into about the numeric range fields -->
<!-- it seems like APLS export doesn't have any time stamp or time interval layers in the csv export -->
When you tick a layer, a box may appear with a number in it. 
This specifies the number of related annotations to include.  
Usually you'll only want 1, because a given word is likely to only have one annotation on another layer.
However, in some cases, you may want more than one.  
For example a speech-rate phrase layer may have a speech-rate annotation for the word's utterance and another for the word's speaker turn.

#### Dictionary export options
<!-- ask Dan about the utility/use cases/any other insights about the dictionary export options -->

<!-- UI thing: the location of prefix names is weird. Currently thinking about it where it would be best to put it -->

