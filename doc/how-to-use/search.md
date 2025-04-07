---
title: Searching the corpus 
permalink: /doc/search
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 50
last_modified_date: 2025-04-07T19:06:28:z
---

# {{ page.title }}
{:.no_toc}

<!-- 
can generally use more screengrabs throughout (probably after the new UI is live)
also the deictic descriptions of certain features will have to be updated once the new UI is live
-->

APLS provides powerful search capabilities for finding linguistic patterns[^patterns] in the interview data.
It all starts from the _search_ page: <https://apls.pitt.edu/labbcat/search>.
Once you create a search, you can [export the results]({{ '/doc/export-data' | relative_url }}) in a variety of formats.

[^patterns]: The term _patterns_ is used throughout this page because the search function is capable of matching exact words, affixes, individual sound segments, stress, part of speech, and much more!

Because the _search_ page has many options that will be of interest to a variety of different researchers, this documentation page is more focused on giving users an understanding of the _search_ page capabilities through `TRY IT!` tutorials.
If you would like to understand the data structure that the _search_ page relies on, read the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) and [Layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation pages.

If you are looking for information on the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.

{% include page_toc.html collapsible=true %}

## What you can do on the _search_ page

The _search_ page allows you to...
- [Search APLS data for specific patterns](#your-first-search).
  - These patterns can target: 
    - [single words](#searching-text-layers)
      
      {: .try-it }
      > To search for every instance of the word "pittsburgh" in APLS:
      > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
      > 1. Enter `pittsburgh` into the orthography input field.
      > 1. Click the _Search_ button.
      
    - [part-of-speech tags](#using-part-of-speech-tags)
    - [phonological features](#searching-phonological-layers)
    - [segments within words](#searching-segments-within-words)
      - Such as finding [all instances of a specific vowel](#searching-for-a-single-segment) or [all instances of a consonant cluster](#searching-for-multiple-segments-within-a-word).
    - [multiple words](#searching-multiple-words)
    - [multiple layers](#searching-multiple-layers)
      - Such as finding [a specific word tagged as a certain part-of-speech](#searching-multiple-layers).
    - [multiple words and layers](#searching-multiple-words-and-layers)
- [Filter searches by specific participants and transcripts](#participants-and-transcripts-filters).
- Configure your search with different [search options](#search-options).

### Layout

<!-- 
this is one section in particular that will need to be updated with the new search page UI
-->

There are five main sections of the _search_ page:
1. [Participants and transcripts filters](#participants-and-transcripts-filters)
1. [Search options](#search-options)
1. [Layer selector](#selecting-other-layers-to-search)
1. [Pattern input fields](#your-first-search)
1. [Search progress bar](#search-matches)

Only the first four sections are displayed when you first load the _search_ page, as shown in the screengrab below.

![]({{ '/assets/screengrab/search/search-page-layout1.png' | relative_url }})

The progress bar only pops up once you actually click _Search_, like in the screengrab below.

![]({{ '/assets/screengrab/search/search-page-layout2.png' | relative_url }})

## Your first search

You can specify the pattern you'd like to search for using the <span class="keyterm">pattern input fields</span>.

We'll begin with the input field for the <span class="layer">orthography</span> layer because it is selected by default.

{: .note}
> The <span class="layer">orthography</span> layer is selected by default instead of the similar sounding <span class="layer">word</span> layer because <span class="layer">orthography</span> layer is case-insensitive and it does not contain word-external punctuation.
> However, the <span class="layer">word</span> layer contains words exactly as they were typed in the transcript, including capitalization and all punctuation. 
> If you are conducting searches on the basis of word spelling, it is recommended to use the <span class="layer">orthography</span> layer instead of the <span class="layer">word</span> layer.

![]({{ '/assets/screengrab/search/search-input-field-orthography.png' | relative_url }})

At the top-left of the input field section, you will see the name of the layer that input field will apply to.

The text box for entering the pattern you'd like to search for is on the right-side of the input field section.

{: .try-it }
> To see how many times "steelers" appears in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `steelers` into the orthography input field.
> 1. Click the _Search_ button.

Certain layers have a target icon (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) that determines what the "token of interest" is for your search.
The target (![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"}) option is mostly useful for [searching multiple words](#searching-multiple-words), [searching within words](#searching-segments-within-words), [searching multiple layers](#searching-multiple-layers), and [searching multiple words and multiple layers](#searching-multiple-words-and-multiple-layers).

The _matches_ drop-down menu is located below the layer name of the input field.
The _matches_ and _doesn't match_ options are most powerful when used with more complex searches, as explained in [Searching with the _matches_ drop-down menu](#searching-with-the-matches-drop-down-menu).

This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

{:.note .no-collapse}
> Pattern input fields look for matches in the corpus by individual word, rather than entire utterances. 
> For example, if you entered `not even` into the orthography input field, you would not get any results because "not even" will never match a single word in any transcript.
> However, you can expand the size of your search to include multiple words, as explained in the [Searching multiple words](#searching-multiple-words) section.

## Search matches

<!-- 
now that the sections are next to each other, I'm realizing that "Search matches", "Search options", and "Searching with the _matches_ drop-down menu" are all a little similar
-->

The search progress bar appears at the bottom of the page only after you've specified your search and clicked the _Search_ button.

![]({{ '/assets/screengrab/search/search-progress-bar.png' | relative_url }})

Above the progress bar itself is text displaying the patterns of your search.

The progress bar fills itself in to reflect the current state of your search, such as if the search is being initialized or if the APLS data is being queried.

{:.note}
> Some searches will return results quickly, but more complex searches or searches involving a lot of transcripts may take a longer time to complete.
> As long as the search progress bar is being displayed, it means that APLS is working on doing your search!

After the search is complete, the number of results found is displayed beneath the progress bar and a link to _Display results_ is shown that will take you to the search results page.
For information on using the search results page, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation.

## Participants and transcripts filters

The _search_ page by default will conduct searches on all data in APLS.
You can limit your search to a selection of [participants]({{ '/doc/data-organization#participants' | relative_url }}) and/or [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}) using the participants and transcripts filters.

### Participants filter

The participants filter is the first option displayed on the _search_ page.

![]({{ '/assets/screengrab/search/search-participants-filter.png' | relative_url }})

There are two ways to select participants for this filter on the _search_ page:

- Clicking _Participants_ will take you to the [_participants_ page]({{ '/doc/browse-participants' | relative_url }}).
  From this page, click the checkboxes for all participants you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
  If you specify a filter for the _participants_ page and don't click any checkboxes, then it will select all participants in the filter.
  More information about the _participants_ page can be found on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.
- You can also upload a `.csv` file containing participant codes to the participants filter by clicking the _Choose File_ button.
  - For the `.csv` upload filter to work, participant codes must be in the first column of the `.csv`. 
    The filter will select all __valid__ participant codes in the first column.
    The column does not need to have a header name and the column can contain rows that aren't valid participant codes.
    Additionally, the `.csv` upload option treats multiple rows of the same participant code as if they were a single row.
    If there is an error in the column, it will be ignored (e.g., if the column contains `CB96` instead of `CB06`, the filter will simply ignore `CB96` because it is not a valid participant code).

{: .try-it }
> 1. Go to the [_participants_ page](https://apls.pitt.edu/labbcat/participants).
> 1. Click the checkboxes for CB01, CB05, and CB06.
> 1. Click the _Export Attributes_ button at the top of the page and then click _Export Attributes_ on the __Export participant data__ page to download the `participants.csv` file.
>    1. You can learn more about the options of the __Export participant data__ page on the [Browsing participants]({{ '/doc/browse-participants#exporting-and-searching-participants' | relative_url }}) documentation page.
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click `Choose File` in the Participants filter tab and select the `participants.csv` file.

### Transcripts filter

The transcripts filter is located beneath the participants filter.

![]({{ '/assets/screengrab/search/search-transcripts-filter.png' | relative_url }})

Clicking _Transcripts_ will take you to the [_transcripts_ page]({{ '/doc/browse-transcripts' | relative_url }}).
From this page, click the checkboxes for all transcripts you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
More information about the _transcripts_ page can be found on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.

<!-- you can now upload transcript files for the filter as well -->

{:.note}
> If you've selected participants for the participants filter, only the transcripts for those participants will be displayed when using the transcripts filter.
> Additionally, if you select transcripts *and then* select participants, your transcripts filter will be overwritten.

<!-- the apls-dev page gives you a warning if you try to do this -->

## Search options

<!--  apls-dev has been changed so that the "Exclude utterances with more than n% overlap" option has been removed -->

Below the pattern input fields are checkboxes that let you set certain match parameters for your search.
In order, these options are:
- Only include 'Main speaker' participants.
    - This restricts the search to only include matches from 'Main speaker' participants, excluding matches from interviewers and bystanders.
- Only match words that are aligned.
  - This checkbox restricts your search to only match tokens that have been force-aligned, ignoring any tokens that have not been force-aligned yet.
- Only one match per transcript.
  - This checkbox restricts the search results to one match per transcript, allowing you to identify transcripts that contain a given pattern without listing all instances of that pattern in the transcript.
- Exclude utterances with more than n% overlap
  - This checkbox allows you to excluding overlapping speech, when multiple speakers are talking at once.
  - By default, 5% overlap counts as simultaneous speech for exclusion. However this threshold can be adjusted using the given checkbox.
- No matches, only a summary of results
  - This checkbox will prevent the search from automatically opening a page displaying the results (although results can still be viewed by clicking on `Display results` underneath the search bar)

## Searching with regular expressions

Layers that support the use of <span class="keyterm">regular expressions</span> are denoted by their pattern input fields having `Regular expression` text fields.
A regular expression (or 'regex') is a way of finding a pattern in a string of text.
In regular expressions, letters and numbers are literal characters that match themselves -- the regex `apples` will match the literal text "apples".

What makes regular expressions more powerful than normal searches are metacharacters that have special functions.
Some of the most useful metacharacters (and their functions) for searching APLS are:
- `.` (matches any character)

  {: .try-it }
  > To find every 14 letter word in APLS:
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `..............` into the orthography input field.
  > 1. Click the _Search_ button.
  
- `?` (makes the previous character optional; i.e. it can occur 0 or 1 times)
  
  {: .try-it }
  > To search for every instance of "pirate" and "pirates":
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `pirate(s)?` into the orthography input field.
  >   1. The parentheses around `s` aren't strictly necessary, but they help clarify what is being targeted by `?`.
  > 1. Click the _Search_ button.

- `+` (lets the previous character repeat; i.e. it can occur 1 or more times)
  
  {: .try-it }
  > To search for every word that has the "-ition" affix as a morpheme:
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Select the `lexicon` project in the layer selector and click the checkbox for the <span class="layer">morphemes</span> layer to make the turn input field appear.
  > 1. Enter `.+ition` into the morphemes input field.
  > 1. Click the _Search_ button.
  
- `*` (lets the previous character be optional or repeat; i.e. it can occur any number of times, including 0)
  
  {: .try-it }
  > To search for every word that begins with "pittsburgh", including the word "pittsburgh" itself:
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `pittsburgh.*` into the orthography input field.
  > 1. Click the _Search_ button.

- `()` (causes the characters in the brackets to be treated as a unit)

  {: .try-it }
  > To search for every instance of "pittsburgh" and "pittsburghese":
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `pittsburgh(ese)?` into the orthography input field.
  > 1. Click the _Search_ button.

- `[]` (matches any characters inside the brackets)

  {: .try-it }
  > To search for every instance of "don't" and "won't":
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `[dw]on't` into the orthography input field.
  > 1. Click the _Search_ button.

- `|` (lets the search match the pattern on either side of the vertical bar)

  {: .try-it }
  > To search for every instance of "steeler" and "penguin":
  > 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
  > 1. Enter `steeler|penguin` into the orthography input field.
  > 1. Click the _Search_ button.

{:.note}
> If you're familiar with regular expressions, then you may know that `^` and `$` can be used to anchor matches to the start and end of the pattern. 
> These aren't necessary in APLS because regular expressions always match the entire annotation. 
> This is why if you want words that start with a string, you need to use .* at the end. 
>
> A separate but related topic is anchoring a search match to a larger annotation, such as finding words at the start of a turn. 
> This is covered in the [Anchoring searches](#anchoring-searches) section of this page.

More information about using regular expressions with APLS can be found on the [Regular expressions]({{ '/doc/regex' | relative_url }}) documentation page.

## Selecting other layers to search

You can search more than just the <span class="layer">orthography</span> layer on the _search_ page.
The first step in doing so is to use the <span class="keyterm">layer selector</span> menu.
The <span class="keyterm">layer selector</span> on the _search_ page is similar to the [layer selector on transcript pages]({{ '/doc/view-transcript#layer-selector' | relative_url }}), with some minor differences.[^differences]

[^differences]: The main difference is that transcript pages always have the <span class="layer">word</span>, <span class="layer">turn</span>, and <span class="layer">utterance</span> layers selected and they cannot be de-selected. The _search_ page allows these layers to be toggled on and off.

![]({{ '/assets/screengrab/search/search-layer-selector.png' | relative_url }})

By default, the layer selector has the <span class="layer">orthography</span> layer already selected.
To make more [layers]({{ '/doc/layer-typology' | relative_url }}) appear, you have to select the [project]({{ '/doc/layer-typology#project' | relative_url }}) corresponding with that layer in the `Projects` column.

{: .under-the-hood }
> The <span class="layer">orthography</span>, <span class="layer">word</span>, and <span class="layer">segment</span> layers are displayed without selecting any projects because these layers are not associated with a project.

Selecting a layer in the layer selector will make a [pattern input field](#your-first-search) for that layer appear.

{:.note}
> If you select a layer but don't enter anything into its pattern input field, it doesn't get applied to the search.

The screengrab below has the projects that are most useful to users toggled on to show all the layers that are useful for searching APLS.

![]({{ '/assets/screengrab/search/search-all-layers.png' | relative_url }})

{:.note .no-collapse}
> Layers in the `temp` project aren’t meaningful for end-users, so these layers are not discussed on this page.

Hovering over the names of the layers will display a tooltip giving a brief description of that layer.
For an overview of how layers work in APLS, start with the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) documentation section.
In-depth descriptions of the different layers in APLS can be found in the [field guide]({{ '/doc/layer-field-guide' | relative_url }}).

<!-- the apls-dev search page now has more layer icons and the option to hide layer icons -->

### Layer data types and notation systems

Different layers in APLS contain different kinds of annotations.
These differences affect what and how you can search in each layer.

The four data types are:
- Text
- Phonological
- Numeric
- Timing-only

More information about these data types is provided on the [Layer typology]({{ '/doc/layer-typology#data-type' | relative_url }}) documentation page, but for learning how to use the _search_ page it is most useful to simply know that these distinctions exist.

While data type describes the *kinds* of annotation that different layers contain, notation systems are what those annotations actually *look like*.
All layers have a <span class="keyterm">primary notation system</span> (with the exception of timing-only layers because their annotations don't have labels).

The primary notation systems by data type are:
- Text
  - English spelling
  - Treebank part-of-speech tags
  - Boolean (`TRUE` or `FALSE`)
- Phonological
  - DISC phonemic alphabet
  - Stress markers (`'` [primary stress], `"` [secondary stress], `0` [unstressed])
- Numeric
  - Positive whole numbers
  - Decimal numbers
  
You can read more about notation systems on the [Layer typology]({{ '/doc/layer-typology#notation-system' | relative_url }}) and [Layer notation systems]({{ '/doc/Layer-notation-systems' | relative_url }}) documentation pages.

Pattern input fields for layers that don't use English spelling or numbers include drop-down selection menus (shown with a ![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"} icon) that contain valid input for that layer. 

![]({{ '/assets/screengrab/search/search-dropdown-menu.png' | relative_url }})

![]({{ '/assets/screengrab/search/search-dropdown-menu-expanded.png' | relative_url }})

This saves you the trouble of needing to memorize things like the DISC alphabet or part-of-speech tags to use all of the _search_ page's functionalities!
Similar to other parts of APLS, you can hover your mouse over the options in these drop-down menus to get a short tooltip description for each symbol.

{: .under-the-hood }
> The drop-down menus are displayed as IPA symbols, but they are input into the text fields using the DISC alphabet.
> Because the purpose of DISC is to make phonetic transcription more machine-readable, the only characters that are different from IPA are the ones that aren't found on QWERTY keyboards.

#### Searching text layers...

##### using English spelling

As discussed in [Your first search](#your-first-search), you can search the <span class="layer">orthography</span> layer using English spelling.
Other layers that can be searched using English spelling are:
- <span class="layer">lemma</span> 
- <span class="layer">morphemes</span> 
- <span class="layer">lexical</span> 
- <span class="layer">word</span> 
- <span class="layer">comment</span> 
- <span class="layer">noise</span> 
- <span class="layer">redaction</span>  
  
  {:.note}
  > The <span class="layer">redaction</span> search targets the comments that are made for redactions on the word layer.
  > All redactions are annotated as `___` on the word layer, which is what appears on the search results page for redactions.
  > However, the pattern for <span class="layer">redaction</span> must match the comments in the <span class="layer">redaction</span> layer.
  > Therefore, searching for `___` on the <span class="layer">redaction</span> layer won't display any results but searching `.*name.*` will show all redactions that contain "name" in the comment.
  
##### using part-of-speech tags

The only syntax layer in APLS is the <span class="layer">part_of_speech</span> layer, which has a selection menu for accepted part-of-speech tags.

{: .try-it }
> To find matches for every superlative adjective in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer selector and click the checkbox for the <span class="layer">part_of_speech</span> layer to make the part_of_speech input field appear.
> 1. Click the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select `JJS`.
> 1. Click the _Search_ button.

##### using boolean values (for overlap)

The <span class="layer">overlap</span> layer is part of the [timing project]({{ '/doc/layer-typology#project' | relative_url }}), but it contains text data in the form of Boolean values: `TRUE` for speech that is overlapping and `FALSE` for speech that isn't overlapping. 
The <span class="layer">overlap</span> layer has a drop-down selection menu for these two `TRUE` and `FALSE` values.

#### Searching phonological layers

The phonology layers (and what is included in their drop-down menus) in APLS are:
- <span class="layer">phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">dictionary_phonemes</span> (IPA symbols that are not on QWERTY keyboards)
- <span class="layer">stress</span> (stress markers)
- <span class="layer">pronounce</span> (IPA symbols that are not on QWERTY keyboards and stress markers)
- <span class="layer">syllables</span> (IPA symbols that are not on QWERTY keyboards and stress markers)

{:.note .no-collapse}
> <span class="layer">segment</span> and <span class="layer">foll_segment</span> layers are similar to the phonological layers in this section, but they have additional capabilities that are described in [Searching segments within words](#searching-segments-within-words).

{: .try-it }
> To find all matches for syllables with /ʊ/ that have secondary stress:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `phonology` layer in the layer selector and click the checkbox for the <span class="layer">syllables</span> layer to make the syllables input field appear.
> 1. Click the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select `secondary` under the `STRESS` heading.
> 1. Enter `.*` after `"` in the syllables input field.
> 1. Click the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select `ʊ` under the `VOWEL` heading.
> 1. Enter `.*` after `".*U` in the sylablles input field.
> 1. Click the _Search_ button.

#### Searching numerical layers

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
> 1. Select the `lexicon` project in the layer selector and click the checkbox for the <span class="layer">frequency_in_corpus</span> layer to make the frequency_in_corpus input field appear.
> 1. Enter `1` in the frequency_in_corpus _Minimum_ input field and enter `2` in the frequency_in_corpus _Maximum_ input field.
> 1. Click the _Search_ button.
> - This search will include incomplete words as well.
>   To exclude incomplete words, select _doesn't match_ from the _matches_ drop-down menu and enter `.+~` into the orthography input field.

## Searching with the _matches_ drop-down menu

The _matches_ drop-down menu is located below the layer name of the input field.
This drop-down menu lets you select whether the search will identify annotations that match your input pattern or annotations that don't match your input pattern.

All the prior example searches on this documentation page have been to find matches for patterns.
However, a simple search for non-matches could be to find all the words in APLS that are *not* the word "penguins":

{: .try-it }
> To find all instances of words that are not the word "penguins":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `penguins` into the orthography input field.
> 1. Click the _matches_ drop-down menu for the orthography input field and select _doesn't match_.
> 1. Click the _Search_ button.

Non-matching searches can also be combined with [regex patterns](#searching-with-regular-expressions) to specify a range of values to not match.
For example, you could find all non-consonantal words in APLS by using a _doesn't match_ search on the <span class="layer">phonemes</span> layer:

{: .try-it }
> To find all matches for non-consonantal words:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `phonology` project in the layer selector and click the checkbox for the <span class="layer">phonemes</span> layer to make the phonemes input field appear.
> 1. Enter `.*` in the phonemes input field.
> 1. Click the drop-down selection menu on the right side of the phonemes input field and select _CONSONANT:_.
> 1. Enter `.*` again at the end of the phonemes input field.
> 1. Click the _matches_ drop-down menu for the stress input field and select _doesn't match_.
> 1. Click the _Search_ button.

The _doesn't match_ option is also useful when used with multiple layers, as described in the [Searching multiple layers](#searching-multiple-layers) section of this page.

## Searching segments within words

<!--- this is meant to be the "Layer scope" section but "Searching by layer scope" felt too opaque --->

Layers in APLS have different [scopes]({{ '/doc/layer-typology#scope' | relative_url }}): <span class="keyterm">span</span>, <span class="keyterm">phrase</span>, <span class="keyterm">word</span>, and <span class="keyterm">segment</span>.
You may notice that these are the column names at the top of the layer selector!

The searches discussed so far have been in the first three scopes (<span class="keyterm">span</span>, <span class="keyterm">phrase</span>, and <span class="keyterm">word</span>).
This is because the _search_ page looks for matches word-by-word, 
so <span class="keyterm">span</span> and <span class="keyterm">phrase</span> layer searches give results at the <span class="keyterm">word</span> level even though <span class="keyterm">span</span> and <span class="keyterm">phrase</span> scopes are larger than <span class="keyterm">word</span> scope.

{: .note}
> For instance, if you did a search to find all the overlaps in APLS using the <span class="keyterm">overlap</span> layer, you would get results for each individual word that occurs in a stretch of overlapped speech, even though the actual <span class="keyterm">overlap</span> annotation might be longer than a single word.

{: .under-the-hood}
> Some <span class="keyterm">word</span> layers, like <span class="layer">syllables</span>, may seem like they would be <span class="keyterm">segment</span> layers, but they are actually sub-interval <span class="keyterm">word</span> annotations.
> These are also called <span class="keyterm">horizontal peers</span>, which are explained on the [Layer typology]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}) documentation page.

<span class="layer">segment</span> and <span class="layer">foll_segment</span> are the two <span class="keyterm">segment</span> layers in APLS.
These <span class="keyterm">segment</span> layers can be used to find matches for [individual speech sound segments](#searching-for-a-single-segment) and to create [within-word segment patterns](#searching-for-multiple-segments-within-a-word).

### Searching for a single segment

The difference between matching to segments and matching to words is that segments don't need to have their surrounding context defined.

For instance, if you wanted to search for every instance of /j/ using the <span class="layer">phonemes</span> layer, you would need to enter the regex `.*j.*` to find words containing /j/.
With the <span class="layer">segment</span> layer, you would only to search `j` because the search is looking at individual speech sounds to find matching segments.

{: .try-it }
> To find matches for every instance of /ɔɪ/:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select `ɔɪ` from the `DIPHTHONGS` section.
> 1. Click the _Search_ button.

### Searching for multiple segments within a word

Next to the the drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) for the <span class="layer">segment</span> and <span class="layer">foll_segment</span> layers is a `+` button.
Clicking the `+` button on the right side of the segment input field adds another input field for the segment that immediately follows the previous segment.
This allows you to construct patterns that search for a sequence of segments within a word.

{:.note}
> It is strongly recommended to not attempt within-word searches for <span class="layer">segment</span> and <span class="layer">foll_segment</span> at the same time.
> Because of how these searches look for matches, specifying within-word patterns for both <span class="layer">segment</span> and <span class="layer">foll_segment</span> will most likely return no results or result in an error message.

{: .try-it }
> To find matches for every instance of /l/ followed by /t/:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the <span class="layer">segment</span> layer in the selection menu to make the segment pattern input field appear.
> 1. Click the `+` button inside of the segment box to make another segment input field appear.
> 1. Enter `l` in the first segment field and `t` in the second segment field.
> 1. Click the _Search_ button.

You can designate one of the segments in your within-word search as your "token of interest" by clicking the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for that segment.
This will not affect the number of matches that are found, but it will affect what information is included when [exporting data]({{ '/doc/export-data' | relative_url }}).

## Anchoring searches

Some layers contain annotations that can span multiple words or can include multiple annotations per word.
These layers allow you to "anchor" your search pattern to match the beginning or the end of that layer's [scope]({{ '/doc/layer-typology#scope' | relative_url }}) using the lock icons (shown as unlocked when not active ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} and locked when active ![]({{ '/assets/img/lock-locked.svg' | relative_url }}){: style="height:1rem;"}).

The following [phrase layers]({{ '/doc/layer-typology#scope' | relative_url }}) layers have anchoring as their _only_ search parameter:
- <span class="layer">turn</span>
- <span class="layer">utterance</span>

{: .try-it }
> To search for the word "yes" occurring at the beginning of speaker turns:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `timing` project in the layer selector and click the checkbox for the <span class="layer">turn</span> layer to make the turn input field appear.
> 1. Click the lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} on the left side of the turn input field.
> 1. Enter `yes` into the orthography input field.
> 1. Click the _Search_ button.
> - To compare this with the number of results for "yes" without <span class="layer">turn</span> layer anchoring, click the lock ![]({{ '/assets/img/lock-locked.svg' | relative_url }}){: style="height:1rem;"} again to turn off anchoring and click the _Search_ button.

The following [span layers]({{ '/doc/layer-typology#scope' | relative_url }}) have pattern input fields that are like the <span class="layer">orthography</span> layer, with the addition of anchoring options:
- <span class="layer">comment</span>
- <span class="layer">noise</span>

The following [segment layers]({{ '/doc/layer-typology#scope' | relative_url }}) also support anchoring to beginning or end of words:
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

## Searching multiple words

Earlier in the documentation, we said that searching `not even` in the <span class="layer">orthography</span> layer would not return any matches because there are no single words that match "not even".
The way to search for multiple words is to make the search "wider".

Clicking the `+` button on the right side of the input fields makes the search wider by adding another word to your search pattern.

![]({{ '/assets/screengrab/search/search-input-field-orthography2.png' | relative_url }})

The *followed immediately by* drop-down menu lets you choose whether the search should be the immediate next word, 1 word after the immediate next word, or 2 words after the immediate next word.

You can make your pattern as wide as you need to conduct your search, and every additional input field works exactly like the initial input field for that layer.
Clicking the `-` button makes your search narrower by removing a word from your search pattern.

{: .try-it }
> To search for every instance of the word "not" immediately followed by the word "even":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the `+` button to make your search pattern one word wider.
> 1. Enter `not` in the first orthography layer text field and enter `even` in the second orthography layer text field.
> 1. Click the _Search_ button.

Similar to [multiple segment searches](#searching-for-multiple-segments-within-a-word), you can designate one of the words in your multi-word search as your "token of interest" by clicking the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for that word.
This will not affect the number of matches that are found, but it will affect what information is included when [exporting data]({{ '/doc/export-data' | relative_url }}).

## Searching multiple layers

Up to this point in the documentation, most of the _search_ page capabilities have been demonstrated with single layer searches.
Many researchers, however, will be interested in finding patterns that match multiple types of criteria.
Constructing a search using multiple layers makes this possible.

For example, the `TRY IT!` below uses the <span class="layer">orthography</span> layer and the <span class="layer">part_of_speech</span> layer to find all instances of "run" as a noun.

{: .try-it }
> To find matches for all instances of "run" used as a noun:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer selector and click the checkbox for the <span class="layer">part_of_speech</span> layer to make the part_of_speech input field appear.
> 1. Enter `can` into the orthography input field. 
> 1. Click the part_of_speech drop-down menu button (![]({{ '/assets/img/expand-down.svg' | relative_url }}){: style="height:1rem;"}) and select _NN_ from the _NOUN:_ section.
> 1. Click the _Search_ button.

You can also use the _matches_ drop-down menus to find results that match on some layers and don't match on other layers.
An example is given in the `TRY IT!` below using the <span class="layer">segment</span> layer and the <span class="layer">stress</span> layer to find /u/ without primary stress.

{: .try-it }
> To find all matches for the segment /u/ that don't have primary stress:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `u` into the segment input field.
> 1. Select the `phonology` project in the layer selector and click the checkbox for the <span class="layer">stress</span> layer to make the stress input field appear.
> 1. Click the drop-down selection menu on the right side of the stress input field and select _primary_.
> 1. Click the _matches_ drop-down menu for the stress input field and select _doesn't match_.
> 1. Click the _Search_ button.

The target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} option becomes particularly useful when doing multi-layer searches that include segment layers.
As mentioned in [Searching segments within words](#searching-segments-within-words), segment layers search for individual speech sound matches and all other layers search for word matches.
By default, multi-layer searches will look for one match per word.
If you want the results to contain matches for every instance of a segment(s), you should click the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for the segment input field.

{: .try-it }
> To generate search results with matches for both /i/ vowels in the word "really", so that every instance of "really" appears twice:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click the checkbox for the <span class="layer">segment</span> layer to make the segment input field appear.
> 1. Enter `really` into the orthography input field and `i` into the segment input field.
> 1. Click the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for the segment input field.
> 1. Click the _Search_ button.
>
> If you conduct this same search with the __orthography layer__ as the target layer, you will get half the number of results because the search is only matching each instance of the word "really" once.

## Searching multiple words and multiple layers

Because the _search_ page uses a matrix of expressions to find search matches, searches can be simple (one word wide and one layer deep) or complex (multiple words wide and multiple layers deep).
This allows the search function to find very specific matches based on multiple different criteria.

{: .try-it }
> To find matches for every consonant-initial verb that is preceded by the word "the":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Select the `syntax` project in the layer selector to make the <span class="layer">part_of_speech</span> layer appear in the selection menu.
> 1. Select the <span class="layer">part_of_speech</span> layer in the selection menu to make the part_of_speech pattern input field appear.
> 1. Enter `the` in the orthography layer text field.
> 1. Click the `+` button to make the search pattern one word wider.
> 1. Open the drop-down menu for the second part_of_speech input field and click _VERB:_ to add a regex pattern that will match all adjectival POS tags.
> 1. Open the drop-down menu for the second segment input field and click _CONSONANT_ to add a regex pattern that will match all consonant segments.
> 1. Click the lock ![]({{ '/assets/img/lock-unlocked.svg' | relative_url }}){: style="height:1rem;"} on the left side of the second segment input field to specify that you only want to match words that begin with a consonant segment.
> 1. Click the target ![]({{ '/assets/img/target.svg' | relative_url }}){: style="height:1rem;"} for the second part_of_speech input field to select the second word as the target of your search (as opposed to targeting "the").
> 1. Click the _Search_ button.

## Tips, Tricks, and FAQ

More to come in this section soon!
Eventually it will be a big basket of random helpful notes, like that you'll have to do some trial and error, refining your search via false positives and false negatives, and maybe some troubleshooting notes.

