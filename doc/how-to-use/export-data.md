---
title: Exporting data
permalink: /doc/export-data
parent: How to use APLS
nav_order: 60
last_modified_date: 2025-04-28T12:40:16:z
---

# {{ page.title }}
{:.no_toc}

After you've explored APLS, conducted a search, and found data you're interested in, the next thing you'll probably want to do is export that data out of the corpus for further analysis.

This page is meant to help you understand what you can export and how you can export it after you've conducted a [search]({{ '/doc/search' | relative_url }}) or have a [search results `.csv` file](#csv-export).
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
  - Lets you upload a [search results `.csv` file](#csv-export) to extract additional information about your search result matches

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
  - The context for a match will never extend beyond the utterance that contains the match.
    For example, if a match occurs at the end of an utterance, then the context options will never show words that come after the match (even if there is an utterance after the utterance containing the match).

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
- [`.csv`](#csv-export) 
- [Dictionary](#dictionary-export) (`.txt`) 
- [Utterance](#utterance-export) 
- [Audio](#audio-export) 

#### _CSV Export_

<!-- 
add in some more screengrabs throughout this page
-->

Clicking the _CSV Export_ button will download the selected results as a `.csv` file.

Certain information about the results will be included in the `.csv` by default.
Clicking the ▼ button next to _CSV Export_ allows you to select what data you would like included in the exported `.csv` file.
You can add metadata information, participant and transcript attributes, and layer annotations by clicking the checkbox for the data you would like to include.

The _Fields:_ column is unique to the _search_ page _CSV Export_, and it allows you to include information about your search and the relative location for where your search matches were found.
`Database title`, `Search name`, `Match ID`, and `URL` are always included in the exported `.csv` file and cannot be toggled off.

The [participant attributes]({{ '/doc/attribute-typology' | relative_url }}), [transcript attributes]({{ '/doc/transcript-attributes' | relative_url }}), and [layers]({{ '/doc/layer-field-guide' | relative_url }}) are described on their respective field guide pages.
You can also hover over the names of each checkbox to make a brief tooltip description appear.

Layers that have [sub-interval alignments]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}) (shown with the ![]({{ '/assets/img/alignment-2.svg' | relative_url }}){: style="height:1rem;"} icon) or [vertical peers]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) (shown with the ![]({{ '/assets/img/vertical-peers.svg' | relative_url }}){: style="height:1rem;"} icon) will also display numeric boxes when you select them.
This box allows you to choose the number of related annotations to include.

For layers with [vertical peers]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) ![]({{ '/assets/img/vertical-peers.svg' | relative_url }}){: style="height:1rem;"}, the additional annotations will be annotations that occupy an identical timespan *if there are any*.
If there are less vertical peers in the layer for the match than the number specified in the numeric box, then the `.csv` will still contain the number of columns you specified but the columns will be empty.

<!-- 
maybe dan or rob made some updates? `comment` no longer has a numeric box
-->

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `polish` into the orthography input field.
> 1. Click the _Search_ button.
> 1. Click the ▼ button next to _CSV Export_ and select <span class="layer">dictionary_phonemes</span>.
> 1. Enter `3` into the numeric field for <span class="layer">dictionary_phonemes</span>.
> 1. Click the _CSV Export_ button and download the `.csv`.
> - If you view the "Target dictionary_phonemes" columns of the `.csv`, you will see that there are entries in the first 2 columns but the third column is empty.
>   This is because the <span class="layer">dictionary_phonemes</span> layer only has two vertical peer annotations for the word "polish".


For layers with [sub-interval alignment]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}) ![]({{ '/assets/img/alignment-2.svg' | relative_url }}){: style="height:1rem;"}, the additional annotations will be the other sub-interval annotations for that word *if there are any*.
If there are less sub-interval annotations in the layer for the match than the number specified in the numeric box, then the `.csv` will still contain the number of columns you specified but the columns will be empty.

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `wouldn't` into the orthography input field.
> 1. Click the _Search_ button.
> 1. Click the ▼ button next to _CSV Export_ and select <span class="layer">part_of_speech</span>.
> 1. Enter `3` into the numeric field for <span class="layer">part_of_speech</span>.
> 1. Click the _CSV Export_ button and download the `.csv`.
> - If you view the "Target part_of_speech" columns of the `.csv`, you will see that there are entries in the first 2 columns but the third column is empty.
>   This is because the <span class="layer">part_of_speech</span> layer only has two sub-interval annotations for the word "wouldn't".

<!-- 
based on my (limited) testing, it seems like `speech_rate` only ever has one annotation AND using any of the anchoring options causes it to not have any values at all
-->

Sub-interval alignment ![]({{ '/assets/img/alignment-2.svg' | relative_url }}){: style="height:1rem;"} layers will also display lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} icons on the sides of the annotation count selector.
These lock icons let you anchor the data exported for that layer to the start or end of the match target.

{:.note .no-collapse}
> The lock icons will restrict the exported data to _only_ the annotation at the start or end of the match target.
>
> This means that regardless of the number of annotations specified in the numeric box, using either of the lock icons will cause that layer to only export data for one annotation.
> Selecting _both_ lock icons will cause that layer to export data only for annotations that do not have any [horizontal peers]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}).


#### _Dictionary Export_

Clicking the _Dictionary Export_ button will download information about all the results of the search as a `.txt` file.

The default option for _Dictionary Export_ is _[just orthography, no entries]_, which creates a `.txt` file containing the <span class="layer">orthography</span> layer spelling for every **unique** item matched by the search without additional information from other layers.

{: .try-it }
> To find all unique words that follow the word "not" in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `not` into the orthography input field.
> 1. Click the `+` button on the right side of the input field to make the search one word wider.
> 1. Enter `.*` into the second orthography input field.
> 1. Click the _Search_ button.
> 1. Click the _Dictionary Export_ button and download the `.txt` to view the unique matches for the search.

Clicking the ▼ button next to _Dictionary Export_ allows you to select the [layer]({{ '/doc/layer-field-guide' | relative_url }}) information that you would like to export in the `.txt` file.

These [layer]({{ '/doc/layer-field-guide' | relative_url }}) options will include the information that is **present** for that layer.
This means that if there is not any information in the selected layer for your search matches, then the _Dictionary Export_ `.txt` will not include that match in the file.

{: .try-it }
> To find words that start with "cranberry" and have a custom DISC pronounciation on the <span class="layer">pronounce</span> layer:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `cranberry.*` into the orthography input field.
> 1. Click the _Search_ button.
> 1. Click the ▼ button next to _Dictionary Export_ and select <span class="layer">pronounce</span>.
> 1. Click the _Dictionary Export_ button and download the `.txt` to view the unique matches for the search that have information on the <span class="layer">pronounce</span> layer.
> - The `.txt` file should not have entries for words like "cranberry" or "cranberry's" because those words don't have a custom DISC pronounciation in APLS.


#### _Utterance Export_

Clicking the _Utterance Export_ button will download the utterances containing the selected matches in a transcript format of your choice.

The default option for _Utterance Export_ is to export Praat TextGrid's containing the <span class="layer">utterance</span> and <span class="layer">word</span> layers.
This will export a TextGrid for the utterance of each selected match with tiers for the <span class="layer">utterance</span> and <span class="layer">word</span> layers.

Clicking the ▼ button next to _Utterance Export_ allows you to select the exported file format, whether [prefix names](#prefix-names) should be added to matches, whether [targets should be tagged](#tag-targets), and the layers you would like to include.

The [_export formatted ▼_]({{ '/doc/view-transcript#export-formatted-' | relative_url }}) section of the [Viewing a transcript]({{ '/doc/view-transcript' | relative_url }}) doc page contains more information about the different transcript file types and selecting layers to include in the transcript.

##### _Prefix names_

Toggling the _Prefix names_ checkbox on will cause the file names of the exported transcripts to have the match number of each match added to the beginning of the file name.

This option additionally ensures that utterances containing multiple matches will have separate files for each match.
When _Prefix names_ is not toggled on, utterances containing multiple matches will only export a single transcript for that utterance.

<!-- the location for `prefix names` has been changed in apls-dev to be in the expandable menu for this export option -->

##### _Tag targets_

The _Tag targets_ checkbox is toggled on by default.
_Tag targets_ creates an additional "Target" tier in the exported transcript file with intervals identifying the specific match token(s). 
At least one of the layers in your search pattern must be selected in the "Layers to export" menu for _Tag targets_ to create the additional "Target" tier.

{:.note}
> _Tag targets_ only applies to transcripts formats that support tiered annotations.


#### _Audio Export_

Clicking the _Audio Export_ button will download the utterances containing the selected matches as `.wav` audio files.

Clicking the ▼ button next to _Audio Export_ allows you to select if the exported audio files should have prefixed names with the _Prefix names_ checkbox.

Toggling the _Prefix names_ checkbox on will cause the audio files to have the match number of each match added to the beginning of the file name.
This option additionally ensures that utterances containing multiple matches will have separate files for each match.
When _Prefix names_ is not toggled on, utterances containing multiple matches will only export a single audio file for that utterance.

<!-- the location for `prefix names` has been changed in apls-dev to be in the expandable menu for this export option -->
