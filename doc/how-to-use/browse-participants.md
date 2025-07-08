---
title: Browsing participants
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/browse-participants
parent: How to use APLS
nav_order: 40
last_modified_date: 2025-07-08T15:46:13-04:00
---

# {{ page.title }}
{:.no_toc}

The primary way to browse participants in APLS is via the <span class="apls-page">Participants</span> page: <https://apls.pitt.edu/labbcat/participants>. 

The <span class="apls-page">Participants</span> page lets you view, filter, and export information about the participants in APLS.
On this documentation page, we cover the functionality and layout of the <span class="apls-page">Participants</span> page.

{% include page_toc.html collapsible=true %}

## What you can do on the <span class="apls-page">Participants</span> page

The <span class="apls-page">Participants</span> page allows you to...
- [View demographic information](#participant-list) for participants.
- [Filter participants](#filtering-participants) according to certain criteria.
- [Export participant data](#exporting-and-searching-participant-data) in a variety of formats.
- [Select participants to search](#layered-search).

### Layout

<!-- creating blank section for Dan to add screengrabs and such -->

## Participant list

The <span class="keyterm">participant list</span> displays all participants in APLS that match your filter criteria.

{% include screengrab.html src="participants/participant-list.png" %}

The columns in the participant list, from left to right, are:
- A checkbox that can be toggled on to have the participant included in [Export menu](#exporting-and-searching-participant-data) options.
- The code or name of the participant.
  - Clicking the participant code will open the corresponding [<span class="apls-page">Participant attributes</span> page](#participant-attributes-pages).
- The <span class="transcript-attr">episode</span> code associated with the participant.
- The number of transcripts for that participant.
- The <span class="participant-attr">neighborhood</span> where the participant was recruited from.
- The participant's <span class="participant-attr">gender</span>.
- The participant's <span class="participant-attr">year_of_birth</span>.
- The participant's <span class="participant-attr">education</span> level.
- The participant's speaker <span class="participant-attr">type</span>.
- The total <span class="participant-attr">transcript_duration</span> (measured in seconds) for that participant.

You can read more about participant attribute data in the [field guide]({{ '/doc/participant-attributes' | relative_url }}).

## Filtering participants

The <span class="keyterm">filter menu</span> at the top of the <span class="apls-page">Participants</span> page lets you find participants that match certain criteria.

{% include screengrab.html src="participants/filter-menu.png" %}

Underneath the **Participants** heading is the match count, which shows the number of participants that currently fit the criteria of your filters.

{:.note}
> The default filter for the <span class="apls-page">Participants</span> page is to show all participants categorized as a "Main speaker" who have at least 1 transcript in APLS. 
> As shown above, there are 34 participants in APLS who meet this criteria.

The nine filter fields correspond to the columns in the participant list directly below the filter fields:

[^episodes]: Most episode codes correspond to a single "Main speaker" participant code, but there are some episode codes that are combinations of multiple participant codes. These episode codes are for sociolinguistic interviews with multiple main speakers; however, the transcripts currently in APLS are for recordings where only one "Main speaker" is present.

- The "Participant" and "Episode" text fields filter participants by <span class="participant-attr">participant</span> code or <span class="transcript-attr">episode</span> code[^episodes] using [regular expressions]({{ '/doc/regex' | relative_url }}).

  {: .try-it }
  > Go to the [<span class="apls-page">Participants</span> page](https://apls.pitt.edu/labbcat/participants) and enter `.+and.+` into the "Episode" text field.
  > This will display all participants with an episode code that is a combination of multiple participant codes.
- The "Transcript count" text fields filter participants by their total number of transcripts in APLS.
  - To view participants with...
    -  _at least_ `X` transcripts: enter `X` in the *From* box (leave *To* blank)
    - _at most_ `Y` transcripts: enter `Y` in the *To* box (leave *From* blank)
    - _between_ `X` and `Y` transcripts (inclusive): enter `X` in the *From* box and `Y` in the *To* box
  - The default for this filter is set to show all participants with at least 1 transcript in APLS.

  {: .try-it }
  > Go to the [<span class="apls-page">Participants</span> page](https://apls.pitt.edu/labbcat/participants) and enter `10` into the *From* text field and leave the *To* text field blank.
  > This will show all participants with at least 10 transcripts in APLS.
  >
  > In the same way, you can leave the *From* text field blank and enter `3` in the *To* text field to show all participants that have 3 transcripts or less in APLS.

  {: .under-the-hood }
  > Some participants have 0 transcripts.
  > We're still transcribing their interviews, and we've pre-uploaded their [participant attributes]({{ '/doc/attribute-typology' | relative_url }}).
  > Version 1.0 of APLS will include all of these participants.
- The "Neighborhood" multi-choice menu filters participants by the Pittsburgh <span class="participant-attr">neighborhood</span> where the participant was recruited from.
  - You can view full [option descriptions]({{ '/doc/attribute-typology#option-codes-and-descriptions' | relative_url }}) by hovering over the options in the dropdown menu.
- The "Gender" multi-choice menu filters participants by <span class="participant-attr">gender</span>.

  {: .note }
  > All speakers in APLS self-identified as either women or men at the time of recording.
- The "Birth year" text fields filter participants by their <span class="participant-attr">year_of_birth</span>.
  - The *From* and *To* ranges for this filter can be used with one value or two values, similar to the "Transcript count" filter.
- The "Education" multi-choice menu filters participants by their level of <span class="participant-attr">education</span> at the time of the recording.

  {: .try-it }
  > Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) and select *BA* and *> BA* from the Education drop-down list.
  > This will display all participants who completed a 4-year undergraduate degree of some sort, as well as participants who had some graduate level education.
- The "Speaker type" multi-choice menu filters participants by their speaker <span class="participant-attr">type</span>.
  - The default for this filter is set to show only participants who are categorized as main speakers.
- The "Transcript duration" text fields filter participants by the total <span class="participant-attr">transcript_duration</span> (measured in seconds) associated with that participant.
  - The *From* and *To* ranges for this filter can be used with one value or two values, similar to the "Transcript count" filter.

### Clearing filters

The "delete" button ({% include labbcat-icon.html src="delete.svg" %}) allows you to clear all currently specified filters.

This button will also clear the default transcript count and speaker type filters, allowing you to view all participants in APLS.

## Exporting and searching participant data

The <span class="keyterm">export menu</span> allows you to download and search data associated with participants via different pages.
The export menu is located below the [filter menu](#filtering-participants).

{% include screengrab.html src="participants/export-menu.png" %}


### *Export Attributes*

The *Export Attributes* option allows you to download participant data, transcript data, and media files for selected participants.

{: .note .no-collapse}
> If no participants are selected, the *Export Attributes* option will include all participants that match your current filter criteria.

Clicking *Export Attributes* will bring up the <span class="apls-page">Export participant data</span> page, which has three different tabs.

#### *participant attributes*

*participant attributes* is the first tab on the <span class="apls-page">Export participant data</span> page.

{% include screengrab.html src="participants/export-participant-data.png" %}

This tab allows you to export [participant attribute data]({{ '/doc/attribute-typology' | relative_url }}) according to the attribute fields you select. 

APLS speaker codes are always included in the exported file, which is why the checkbox is grayed-out.

After selecting the attributes you would like to export, clicking the *Export Attributes* button will download a `.csv` with the selected data. 
By default, the `.csv` uses commas as field delimiters, but you can use the drop-down menu to export the `.csv` with semicolon delimiters or tab delimiters.

Participant attribute data is explained in more detail in the [field guide]({{ '/doc/participant-attributes' | relative_url }}).

#### *transcript attributes*

*transcript attributes* is the second tab on the <span class="apls-page">Export participant data</span> page.

{% include screengrab.html src="participants/export-transcript-data.png" %}

This tab allows you to export participants' [transcript attribute data]({{ '/doc/attribute-typology' | relative_url }}) according to the attribute fields you select.

Transcript file names are always included in exported file, which is why the checkbox is grayed-out.
At least one additional attribute must be selected to export transcript data.

After selecting the attributes you would like to export, clicking the *Export Attributes* button will download a `.csv` with the selected data. 
By default, the `.csv` uses commas as field delimiters, but you can use the drop-down menu to export the `.csv` with semicolon delimiters or tab delimiters.

A detailed description of the different transcript attributes can be found in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).

#### *transcript media*

*transcript media* is the third tab on the <span class="apls-page">Export participant data</span> page.

{% include screengrab.html src="participants/export-media.png" %}

This tab allows you to export all recordings for the selected participants as a `.zip` file by clicking the *Export Media* button.

### *List Transcripts*

The *List Transcripts* option allows you to view all transcripts for the selected participants on the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}).

The features of the <span class="apls-page">Transcripts</span> page are explained in more detail on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.

### *Layered Search*

The *Layered Search* option will open the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}) with the selected participants in the *Participants* search filter field.
This allows you to use any of the search capabilities described on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page with the selected participants.

{: .note .no-collapse}
> If no participants are selected, the *Layered Search* option will include all participants that match your current filter criteria.

{: .try-it }
> 1. Go to the [<span class="apls-page">Participants</span> page](https://apls.pitt.edu/labbcat/participants).
> 1. Click the checkbox next to *CB01* and `Shift`+`Click` the checkbox next to *FH05* to select the first five participants.
> 1. Click *Layered Search* to open the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}).
> 1. Enter `yinz` into the [Regular expression]({{ '/doc/regex' | relative_url }}) text field in the orthography section and click *Search*.
> 1. Click *Display results* to view all utterances of the word `yinz` in the transcripts for the five selected participants.

## <span class="apls-page">Participant attributes</span> pages

Clicking a participant code will open the corresponding <span class="apls-page">Participant attributes</span> page.
This page includes more information about the participant than what is displayed on the main <span class="apls-page">Participants</span> page, as well as links to data associated with the participant.

{% include screengrab.html src="participants/participant-attributes-page.png" %}

The *Transcripts* hyperlink will open the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}) for that participant's transcripts.

The *All Utterances* hyperlink will open the ["All Utterances" page](#all-utterances) for that participant.

{: .try-it }
> 1. Go to the [<span class="apls-page">Participants</span> page](https://apls.pitt.edu/labbcat/participants) 
> 1. Click *CB10* to view CB10's <span class="apls-page">Participant attributes</span> page.
> 1. Click *All Utterances* to open the ["All Utterances" page](#all-utterances) for CB10.
> 1. Click the checkboxes next to "interview", "reading", and "metalinguistic" to deselect them.
> 1. Click *List* and wait for the search to be completed.
> 1. After the search is complete, click *Display results*.
> 1. This will show all of CB10's utterances that occured in "pairs" <span class="transcript-attr">type</span> transcripts.

Detailed descriptions of participant attributes can be found in the [field guide]({{ '/doc/participant-attributes' | relative_url }}).
