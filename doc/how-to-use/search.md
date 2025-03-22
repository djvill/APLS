---
title: Searching the corpus 
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2025-03-22T14:43:23:z
---

# {{ page.title }}
{:.no_toc}

APLS provides powerful search capabilities for finding linguistic patterns[^patterns] in the interview data.
It all starts from the _search_ page: <https://apls.pitt.edu/labbcat/search>.
Once you create a search, you can [export the results]({{ '/doc/export-data' | relative_url }}) in a variety of formats.

[^patterns]: The term "patterns" is used throughout this page because the search function is capable of matching exact words, affixes, individual sound segments, stress, part of speech, and much more!

Because the _search_ page has many options that will be of interest to a variety of different researchers, this documentation page is more focused on giving users an understanding of the _search_ page capabilities through `TRY IT!` tutorials.
If you would like to understand the data structure that the _search_ page relies on, read the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) and [Layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation pages.

If you are looking for information on the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.

{% include page_toc.html collapsible=true %}

## What you can do on the _search_ page

The _search_ page allows you to...
- [Search APLS data for specific patterns](#layered-search-matrix).
  - These patterns can target [single words](#pattern-input-fields), [segments within words](#within-word-searches), [multiple words](#making-searches-wider), [multiple words and layers](#searches-across-multiple-words-and-layers), and more.
- [Filter searches by specific participants and transcripts](#participants-and-transcripts-filters).
- Configure your search with different [match and display options](#match-and-display-options).

### Layout

There are four main sections of the _search_ page, from top to bottom:
1. [Participants and transcripts filters](#participants-and-transcripts-filters)
1. [Layered search matrix](#layered-search-matrix)
1. [Match and display options](#match-and-display-options)
1. [Search progress bar](#search-progress-bar)

![]({{ '/assets/screengrab/search/search-page-layout.png' | relative_url }})

When you first load _search_, you'll only see the first three;
the progress bar only pops up once you actually click _Search_.

## Participants and transcripts filters

The _search_ page by default will conduct searches on all data in APLS.
The participants and transcripts filters enable you to limit your search to a selection of [participants]({{ '/doc/data-organization#participants' | relative_url }}) and/or [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}).

### Participants filter

The participants filter is the first option displayed on the _search_ page.

![]({{ '/assets/screengrab/search/search-participants-filter.png' | relative_url }})

There are two ways to select participants for this filter on the _search_ page:

- Clicking _Participants_ will take you to the [_participants_ page]({{ '/doc/browse-participants' | relative_url }}).
  From this page, click the checkboxes for all participants you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
  More information about the _participants_ page can be found on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.
- You can also upload a `.csv` file containing participant codes to the participants filter by clicking the _Choose File_ button.
  - For the `.csv` upload filter to work, participant codes must be in the first column of the `.csv`. 
    The filter will select all __valid__ participant codes in the first column.
    The column does not need to have a header name and the column can contain rows that aren't valid participant codes.
    Additionally, the `.csv` upload option treats multiple rows of the same participant code as if they were a single row.
    If there is an error in the column, it will be ignored (e.g., if the column contains `CB96` instead of `CB06`, the filter will simply ignore `CB96` because it is not a valid participant code).

<!-- this option also works with .txt files (treated essentially like a csv with one column) -->

### Transcripts filter

The transcripts filter is located beneath the participants filter.

![]({{ '/assets/screengrab/search/search-transcripts-filter.png' | relative_url }})

Clicking _Transcripts_ will take you to the [_transcripts_ page]({{ '/doc/browse-transcrips' | relative_url }}).
From this page, click the checkboxes for all transcripts you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
More information about the _transcripts_ page can be found on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.

{:.note}
> If you've selected participants for the participants filter, only the transcripts for those participants will be displayed when using the transcripts filter.
> Additionally, if you select transcripts before selecting participants, then selected participants will cause your transcripts filter to be overwritten.

## Layered search matrix

The layered search matrix can be divided into two parts:
- The [layer selection menu](#layer-selection-menu) for the search.
- [Pattern input fields](#pattern-input-fields) for specifying the search.

### Layer selection menu

By default, the layer selection menu has the <span class="layer">orthography</span> layer already selected.

![]({{ '/assets/screengrab/search/search-layer-selection-menu.png' | relative_url }})

To make more [layers]({{ '/doc/layer-typology' | relative_url }}) appear, you have to select the [project]({{ '/doc/layer-typology#project' | relative_url }}) corresponding with that layer in the `Projects` column.

{: .under-the-hood }
> The <span class="layer">orthography</span>, <span class="layer">word</span>, and <span class="layer">segment</span> layers are displayed without selecting any projects because these layers are not associated with a project.

The screengrab below has all end-user projects toggled on to show all the layers that are useful for searching APLS.

![]({{ '/assets/screengrab/search/search-all-layers.png' | relative_url }})

{:.note .no-collapse}
> Layers in the `temp` project aren’t meaningful for end-users, so these layers are not discussed on this page.

Hovering over the names of the layers will display a tooltip giving a brief description of that layer.
For an overview of how layers work in APLS, start with the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) documentation section.
In-depth descriptions of the different layers in APLS can be found in the [field guide]({{ '/doc/layer-field-guide' | relative_url }}).

Selecting a layer in the layer selection menu will make an input field for that layer appear in the pattern input fields section.

{:.note}
> Layers that are selected with the layer selection menu are only applied to the search if input is entered into their pattern input fields.

### Pattern input fields

The pattern input fields enable you to specify the pattern you'd like to search for.

{:.note}
> Pattern input fields look for matches in the corpus by invidual word, rather than entire utterances. 
> For example, if you entered `not even` into the orthography input field, you would not get any results because "not even" will never match a single word in any transcript.
> However, you can expand the size of your search to include multiple words, as explained in the [Making searches wider](#making-searches-wider) section.

We'll begin with the input field for the <span class="layer">orthography</span> layer because it is selected by default.

![]({{ '/assets/screengrab/search/search-input-field-orthography.png' | relative_url }})

At the top-left of the input field section, you will see the name of the layer that input field will apply to.

The text field that displays `Regular expression`  allows you to specify the pattern you would like to search that layer for.
For an overview of using regular expressions with APLS, go to the [Regular expressions]({{ '/doc/regex' | relative_url }}) documentation page.

{: .try-it }
> To search for every instance of the word "pittsburgh" in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `pittsburgh` into the orthography input field.
> 1. Click the _Search_ button.

By default, the list of results will contain one match for each __word token__ that matches your search. 
For certain layers, a target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) will appear in the pattern input field.
Clicking this icon will cause that layer to be the "target" layer, which will cause the results to contain one row for each match on the target layer.
In other words, the target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) determines what the "token of interest" is for your search.

{: .try-it }
> To generate search results with matches for both /i/ vowels in the word "really", so that every instance of "really" appears twice:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `really` into the orthography input field and `i` into the segment input field.
> 1. Click the target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) next to the _matches_ drop-down menu for the segment input field.
> 1. Click the _Search_ button.
>
> If you conduct this same search with the __orthography layer__ as the target layer, you will get half the number of results because the search is only matching each instance of the word "really" once.

The _matches_ drop-down menu is located below the layer name of the input field.
This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

{: .try-it }
> To find all matches for the segment /u/ that don't have primary stress:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `u` into the segment input field.
> 1. Select the `phonology` project in the layer selection menu and click the checkbox for the <span class="layer">stress</span> layer to make the stress input field appear.
> 1. Click the drop-down selection menu on the right side of the stress input field and select _primary_.
> 1. Click the _matches_ drop-down menu for the stress input field and select _doesn't match_.
> 1. Click the _Search_ button.

#### Layers with input fields similar to the orthography layer

The following layers have pattern input fields that work similarly to the <span class="layer">orthography</span> layer:
- <span class="layer">lemma</span> 
- <span class="layer">morphemes</span> 
- <span class="layer">lexical</span> 
- <span class="layer">word</span> 
  - If you are conducting searches on the basis of word spelling, it is recommended to use the <span class="layer">orthography</span> layer instead of the <span class="layer">word</span> layer. 
    The <span class="layer">word</span> layer contains words exactly as they were typed in the transcript, including capitalization and all punctuation. 
    The <span class="layer">orthography</span> layer contains the words converted to all lowercase with word-external punctuation removed.
- <span class="layer">redaction</span>  
  
  {:.note}
  > The <span class="layer">redaction</span> search targets the comments that are made for redactions on the word layer.
  > All redactions are annotated as `___` on the word layer, which is what appears on the search results page for redactions.
  > However, the pattern for <span class="layer">redaction</span> must match the comments in the <span class="layer">redaction</span> layer.
  > Therefore, searching for `___` on the <span class="layer">redaction</span> layer won't display any results but searching `.*name.*` will show all redactions that contain "name" in the comment.

#### Layers with drop-down selection input fields

Some layers have pattern input fields that include a drop-down menu of valid input for that layer. 
This saves you the trouble of needing to memorize things like the DISC alphabet or part-of-speech tags to use all of the _search_ page's functionalities!

The following layers have drop-down selection menus as part of their pattern input fields (followed by a short description of what is included in the drop-down menu):
- <span class="layer">part_of_speech</span> (part-of-speech tags)
- <span class="layer">phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">dictionary_phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">syllables</span> (IPA symbols that are not on QWERTY keyboards and stress markers)
- <span class="layer">pronounce</span> (IPA symbols that are not on QWERTY keyboards and stress markers)
- <span class="layer">stress</span> (stress markers)

{: .under-the-hood }
> The drop-down menus are displayed as IPA symbols, but they are input into the text fields using the DISC alphabet.
> Because the purpose of DISC is to make phonetic transcription more machine-readable, the only characters that are different from IPA are the ones that aren't found on QWERTY keyboards.

#### Layers with numeric range input fields

Some layers contain numeric data, instead of text data.
As a result, the pattern input fields for these layers allow you to define a numerical range you would like to search for.

The following layers use numeric range input fields:
- <span class="layer">frequency_from_celex</span> 
- <span class="layer">frequency_in_corpus</span> 
- <span class="layer">speech_rate</span> 
- <span class="layer">foll_pause</span> 

{: .try-it }
> To find every word that only appears in the corpus one to two times:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `lexicon` project in the layer selection menu and click the checkbox for the <span class="layer">frequency_in_corpus</span> layer to make the frequency_in_corpus input field appear.
> 1. Enter `1` in the frequency_in_corpus _Minimum_ input field and enter `2` in the frequency_in_corpus _Maximum_ input field.
> 1. Click the _Search_ button.
> - This search will include incomplete words as well.
>   To exclude incomplete words, select _doesn't match_ from the _matches_ drop-down menu and enter `.+~` into the orthography input field.

### Anchoring searches

Some layers contain annotations that can span multiple words or can include multiple annotations per word.
These layers allow you to "anchor" your search pattern to match the beginning or the end of that layer's [scope]({{ '/doc/layer-typology#scope' | relative_url }}) using the lock icons.

The following [phrase layers]({{ '/doc/layer-typology#scope' | relative_url }}) layers have anchoring as their _only_ search parameter:
- <span class="layer">turn</span>
- <span class="layer">utterance</span>

{: .try-it }
> To search for the word "yes" occurring at the beginning of speaker turns.
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `timing` project in the layer selection menu and click the checkbox for the <span class="layer">turn</span> layer to make the turn input field appear.
> 1. Click the lock icon on the left side of the turn input field.
> 1. Enter `yes` into the orthography input field.
> 1. Click the _Search_ button.

The following [span layers]({{ '/doc/layer-typology#scope' | relative_url }}) have pattern input fields that are like the <span class="layer">orthography</span> layer, with the addition of anchoring options:
- <span class="layer">comment</span>
- <span class="layer">noise</span>

The following [segment layers]({{ '/doc/layer-typology#scope' | relative_url }}) also support anchoring to beginning or end of words:
- <span class="layer">segment</span>
- <span class="layer">foll_segment</span>

### Making searches wider

Clicking the `+` button on the right side of the input fields makes the search "wider" by adding another word to your search pattern.

![]({{ '/assets/screengrab/search/search-input-field-orthography2.png' | relative_url }})

The `followed` *immediately* `by` drop-down menu lets you choose whether the search should be the immediate next word, 1 word after the immediate next word, or 2 words after the immediate next word.

You can make your pattern as wide as you need to conduct your search, and every additional input field works exactly like the initial input field for that layer.
Clicking the `-` button makes your search narrower by removing a word from your search pattern.

{: .try-it }
> To search for every instance of the word "not" immediately followed by the word "even":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the `+` button to make your search pattern one word wider.
> 1. Enter `not` in the first orthography layer text field and enter `even` in the second orthography layer text field.
> 1. Click the _Search_ button.

### Within-word searches

There are two layers that support searching for patterns within words: 
- <span class="layer">segment</span> 
- <span class="layer">foll_segment</span>

{:.note}
> It is strongly recommended to not attempt within-word searches for <span class="layer">segment</span> and <span class="layer">foll_segment</span> at the same time.
> Because of how these searches look for matches, specifying within-word patterns for both <span class="layer">segment</span> and <span class="layer">foll_segment</span> will most likely return no results or result in an error message.

Similar to [making searches wider](#making-searches-wider), clicking the `+` button on the right side of the segment input field adds another input field for the segment that immediately follows the previous segment.

{: .try-it }
> To find matches for every instance of /s/ followed by /t/ that occurs at the end of words:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click the `+` button inside of the segment box to make another segment input field appear.
> 1. Enter `s` in the first segment field and `t` in the second segment field.
> 1. Click the lock on the right side of the segment input field.
> 1. Click the _Search_ button.

### Searches across multiple words and multiple layers

Because the _search_ page uses a matrix of expressions to find search matches, searches can be simple (one word wide and one layer deep) or complex (multiple words wide and multiple layers deep).
This allows the search function to find very specific matches based on multiple different criteria.

{: .try-it }
> To find matches for every consonant-initial verb that is preceded by the word "the":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer selection menu to make the <span class="layer">part_of_speech</span> layer appear in the selection menu.
> 1. Select the <span class="layer">part_of_speech</span> layer in the selection menu to make the part_of_speech pattern input field appear.
> 1. Enter `the` in the orthography layer text field.
> 1. Click the `+` button to make the search pattern one word wider.
> 1. Open the drop-down menu for the second part_of_speech input field and click `VERB:` to add a regex pattern that will match all adjectival POS tags.
> 1. Open the drop-down menu for the second segment input field and click `CONSONANT:` to add a regex pattern that will match all consonant segments.
> 1. Click the lock button on the left side of the second segment input field to specify that you only want to match words that begin with a consonant segment.
> 1. Click the target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) for the second part_of_speech input field to select the second word as the target of your search (as opposed to targeting "the").
> 1. Click the _Search_ button.

## Search match options

Below the pattern input fields are checkboxes that let you set certain match parameters for your search.
In order, these options are:
- Only include transcripts for which these are the main participants.
    - This checkbox only applies when you have specified a subset of participants for your search, and it restricts the search to transcripts where your participant subset are main participants.
- Only match words that are aligned.
  - This checkbox restricts your search to only match tokens that have been force-aligned, ignoring any tokens that have not been force-aligned yet.
- Only one match per transcript.
  - This checkbox restricts the search results to one match per transcript, allowing you to identify transcripts that contain a given pattern without listing all instances of that pattern in the transcript.
- Exclude utterances with more than n% overlap
  - This checkbox allows you to excluding overlapping speech, when multiple speakers are talking at once.
  - By default, 5% overlap counts as simultaneous speech for exclusion. However this threshold can be adjusted using the given checkbox.
- No matches, only a summary of results
  - This checkbox will prevent the search from automatically opening a page displaying the results (although results can still be viewed by clicking on `Display results` underneath the search bar)

## Search progress bar

The search progress bar appears at the bottom of the page only after you've specified your search and clicked the _Search_ button.

![]({{ '/assets/screengrab/search/search-progress-bar.png' | relative_url }})

Above the progress bar itself is text displaying the patterns of your search.

The progress bar fills itself in to reflect the current state of your search, such as if the search is being initialized or if the APLS data is being queried.

After the search is complete, the number of results found is displayed beneath the progress bar and a link to _Display results_ is shown that will take you to the search results page.
For information on using the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.
