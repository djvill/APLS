---
title: Browsing participants
permalink: /doc/browse-participants
parent: How to use APLS
nav_order: 40
last_modified_date: 2025-02-18T15:34:43:z
---

# {{ page.title }}
{:.no_toc}

The [Participants page](https://apls.pitt.edu/labbcat/participants) allows you to view information about the participants in APLS, filter participants by certain criteria, and export data by participant.
On this documentation page, we cover the general layout of the Participants page and its features.

{% include page_toc.html collapsible=true %}

## General layout

The Participants page has three main components:

- The <span class="keyterm">filter menu</span>
- The <span class="keyterm">export menu</span>
- The <span class="keyterm">participant list</span> matching your filters

### Participants filter menu

The <span class="keyterm">filter menu</span> is displayed at the top of the Participants page.

![]({{ '/assets/screengrab/browse-participants/browse-participants-filter-menu.png' | relative_url }})

Underneath the **Participants** heading is the match count, which shows the number of participants that currently fit the criteria of your filters.

{:.note}
> The default filter for the Participants page is to show all participants categorized as a "Main speaker" who have at least 1 transcript in APLS. 
At the time of the screengrab above, there are 34 participants in APLS who meet this criteria.

The nine filter fields correspond to the columns in the participant list directly below the filter fields.

#### Filter by Participant and Filter by Episode

The "Participant" and "Episode" text fields allow you to filter by [participant code]({{ '/doc/data-organization#participants' | relative_url }}) or episode code[^episodes] using regular expressions.

[^episodes]: Most episode codes correspond to a single "Main speaker" participant code, but there are some episode codes that are combinations of multiple participant codes. These episode codes are for recording sessions where multiple participants were present; however, the transcripts currently in APLS are for recordings where only one "Main speaker" is present.

{: .try-it }
> Go to the [Participants page](https://apls.pitt.edu/labbcat/participants) and type ".+and.+" into the "Episode" text field.
> This will display all participants with an episode code that is a combination of multiple participant codes.

More information on using regular expressions in APLS can be found on the [Regular expressions]({{ '/doc/regex' | relative_url }}) documentation page.

#### Filter by Transcript count

The "Transcript count" text fields allow you to filter participants by their total number of transcripts in APLS.

This filter can be used to view participants with a transcript count between two numbers, above one number, or below one number.

{: .try-it }
> Go to the [Participants page](https://apls.pitt.edu/labbcat/participants) and enter "10" into the *From* text field and leave the *To* text field blank.
> This will show all participants with at least 10 transcripts in APLS.
>
> In the same way, you can leave the *From* text field blank and enter "3" in the *To* text field to show all participants that have 3 transcripts or less in APLS.

By default, this filter is set to show all participants with at least 1 transcript in APLS.

#### Filter by Neighborhood

The "Neighborhood" multi-choice menu allows you to filter participants by the Pittsburgh <span class="participant-attr">neighborhood</span> where the participant was recruited from.

The four <span class="participant-attr">neighborhood</span> abbreviations and their corresponding full names in APLS are:

- *CB* (Cranberry Township)
- *FH* (Forest Hills)
- *HD* (Hill District)
- *LV* (Lawrenceville)

#### Filter by Gender

The "Gender" multi-choice menu allows you to filter participants by <span class="participant-attr">gender</span>.

All participants currently in APLS are identified as binarily cis men and women, so the two gender options are *Female* and *Male*.

#### Filter by Birth year

The "Birth year" text fields allow you to filter participants by their <span class="participant-attr">year_of_birth</span>.

This filter allows for ranges between two numbers, above one number, or below one number, similar to [filtering by transcript count](#filter-by-transcript-count).

#### Filter by Education

The "Education" multi-choice menu allows you to filter participants by their level of <span class="participant-attr">education</span> at the time of the recording.

{: .try-it }
> Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) and select *BA* and *> BA* from the Education drop-down list.
> This will display all participants who completed a 4-year undergraduate degree of some sort, as well as participants who had some graduate level education.

The five levels of <span class="participant-attr">education</span> are described in the [Participant attributes]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

#### Filter by Speaker type

The "Speaker type" multi-choice menu allows you to filter participants by their status in the recordings.

The three categories of speaker <span class="participant-attr">type</span> are described in the [Participant attributes]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

By default, this filter is set to show only participants who are categorized as main speakers.

#### Filter by Transcript duration

The "Transcript duration" text fields allow you to filter participants by the total <span class="participant-attr">transcript_duration</span> (measured in seconds) associated with that participant.

This filter allows for ranges between two numbers, above one number, or below one number, similar to [filtering by transcript count](#filter-by-transcript-count).

#### Clearing filters

The "delete" arrow button on the right side of the filter menu allows you to clear all currently specified filters.

### Export menu

Below the filter menu is the <span class="keyterm">export menu</span>.

![]({{ '/assets/screengrab/browse-participants/browse-participants-export-menu.png' | relative_url }})

The export menu allows you to view and/or download data associated with participants via different webpages.

#### All Utterances

The *All Utterances* option allows you to view and download all utterances produced by selected participants in APLS.

{: .note .no-collapse}
> The "All Utterances" option will appear grayed out until one or more participants are selected.

Clicking *All Utterances* after selecting participants will bring up the "All Utterances" webpage.

![]({{ '/assets/screengrab/browse-participants/browse-participants-all-utterances.png' | relative_url }})

The search filter options on this page allow you to choose which transcripts to include and exclude.

- The option *Only include transcripts for which these are the main participants* limits the search to transcripts where the selected participants are designated as the "Main speaker".
  Turning this option off will search all transcripts for any utterances from the selected participants.
- The other four options allow to select the transcript <span class="transcript-attr">type</span> you would like to include in the search.
  More information about transcript <span class="transcript-attr">type</span> can be found in the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation section.

Clicking the *List* button will search APLS for all utterances from the selected participants that meet your search criteria.

![]({{ '/assets/screengrab/browse-participants/browse-participants-all-utterances-results.png' | relative_url }})

Clicking on *Display results* will open a new tab that displays the search results.
More information about <span class="keyterm">search results</span> can be found on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page.

#### Export Attributes

The *Export Attributes* option allows you to download participant data, transcript data, and media files for selected participants.

{: .note .no-collapse}
> If no participants are selected, the *Export Attributes* option will include all participants that match your current filter criteria.

Clicking *Export Attributes* will bring up the "export participant data" webpage, which has three different panels.

##### export participant data

*export participant data* is the first panel on the "export participant data" webpage.

![]({{ '/assets/screengrab/browse-participants/browse-participants-export-participant-data.png' | relative_url }})

This panel allows you to export [participant attribute data]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}) according to the attribute fields you select. 
Participant codes are always included in the first column of the exported file.

After selecting the attributes you would like to export, clicking the *Participant Data* button will download a `.csv` with the selected data. 
By default, the `.csv` uses commas as field delimiters, but you can use the drop-down menu to export the `.csv` with semicolon delimiters or tab delimiters.

Participant attribute data is explained in more detail in the [Participant attributes]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

##### export transcript data

*export transcript data* is the second panel on the "export participant data" webpage.

![]({{ '/assets/screengrab/browse-participants/browse-participants-export-transcript-data.png' | relative_url }})

This panel allows you to export participants' [transcript attribute data]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) according to the attribute fields you select.
The transcript names are always included in the first column of the exported file.
At least one attribute must be selected to export transcript data.

After selecting the attributes you would like to export, clicking the *Transcript Data* button will download a `.csv` with the selected data. 
By default, the `.csv` uses commas as field delimiters, but you can use the drop-down menu to export the `.csv` with semicolon delimiters or tab delimiters.

A detailed description of the different transcript attributes can be found in the [Transcript attributes]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

##### export media

*export media* is the third panel on the "export participant data" webpage.

![]({{ '/assets/screengrab/browse-participants/browse-participants-export-media.png' | relative_url }})

This panel allows you to export all recordings for the selected participants as a `.zip` file by clicking the *Export Media* button.

#### List Transcripts

The *List Transcripts* option allows you to view all transcripts for the selected participants on the [Transcripts page]({{ '/doc/browse-transcripts' | relative_url }}).

The features of the Transcript page are explained in more detail on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.

#### Layered Search

The *Layered Search* option will open the [Search page]({{ '/doc/search' | relative_url }}) with the selected participants in the *Participants* search filter field.
This allows you to use any of the search capabilities described on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page with the selected participants.

{: .note .no-collapse}
> If no participants are selected, the *Layered Search* option will include all participants that match your current filter criteria.

{: .try-it }
> 1. Go to the [Participants page](https://apls.pitt.edu/labbcat/participants).
> 1. Click the checkbox next to *CB01* and `Shift`+`Click` the checkbox next to *FH05* to select the first five participants.
> 1. Click the *Layered Search* button to open the [Search page]({{ '/doc/search' | relative_url }}).
> 1. Type "yinz" into the [Regular expression]({{ '/doc/regex' | relative_url }}) text field in the orthography section and click *Search*.
> 1. Click *Display results* to view all utterances of the word "yinz" in the transcripts for the five selected participants.


### Participant list

The <span class="keyterm">participant list</span> displays all participants in APLS that match your filter criteria.

![]({{ '/assets/screengrab/browse-participants/browse-participants-participant-list.png' | relative_url }})

The columns in the participant list, from left to right, are:
- A checkbox that can be toggled on to have the participant included in [Export menu](#export-menu) options.
- The code or name of the participant.
  - Clicking the blue hyperlink text of the participant will open that participant's [attributes webpage](#participant-attributes-pages).
- The episode code associated with the participant.
- The number of transcripts for that participant.
- The <span class="participant-attr">neighborhood</span> where the participant was recruited from.
- The participant's <span class="participant-attr">gender</span>.
- The participant's <span class="participant-attr">year_of_birth</span>.
- The participant's <span class="participant-attr">education</span> level.
- The participant's speaker <span class="participant-attr">type</span>.
- The total <span class="participant-attr">transcript_duration</span> (measured in seconds) for that participant.

## Participant attributes pages

Clicking the blue hyperlink text of a participant will open that participant's attributes page.
This page includes more information about the participant than what is displayed on the main Participants page, as well as links to data associated with the participant.

![]({{ '/assets/screengrab/browse-participants/browse-participants-participant-attributes-page.png' | relative_url }})

The *Transcripts* hyperlink will open the [Transcripts page]({{ '/doc/browse-transcripts' | relative_url }}) for that participant's transcripts.

The *All Utterances* hyperlink will open the ["All Utterances" page](#all-utterances) for that participant.

{: .try-it }
> 1. Go to the [Participants page](https://apls.pitt.edu/labbcat/participants) 
> 1. Click the blue hyperlink *CB10* text to view CB10's attributes page.
> 1. Click the *All Utterances* hyperlink to open the ["All Utterances" page](#all-utterances) for CB10.
> 1. Click the checkboxes next to "interview", "reading", and "metalinguistic" to deselect them.
> 1. Click the *List* button and wait for the search to be completed.
> 1. After the search is complete, click the blue hyperlink *Display results* text after the search.
> 1. This will show all of CB10's utterances that occured in "pairs" <span class="transcript-attr">type</span> transcripts.

A detailed description of the different participant attributes can be found in the [Participant attributes]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.
