---
title: Browsing transcripts
permalink: /doc/browse-transcripts
parent: How to use APLS
nav_order: 30
last_modified_date: 2025-02-18T15:34:43:z
---

# {{ page.title }}
{:.no_toc}

The [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) lists all the transcripts in APLS that are available for access, but it also offers useful tools for filtering and exporting transcripts.
On this documentation page, we cover the general layout of the Transcripts page and its features.

{% include page_toc.html collapsible=true %}

## General layout

The Transcripts page has three main components:

- The <span class="keyterm">filter menu</span>
- The <span class="keyterm">export menu</span>
- The <span class="keyterm">transcript list</span> matching your filters

### Transcript filter menu

The <span class="keyterm">filter menu</span> is displayed at the top of the Transcripts page.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-filter-menu.png' | relative_url }})

Underneath the **Transcripts** heading is the match count, which shows the number of transcripts that currently fit the criteria of your filters.
In the screengrab above, no filters have been applied so the match count is 218[^filter], which is the total number of transcripts in APLS (at the time of the screengrab).

[^filter]: For multi-choice filter options, selecting none of the options is the same as selecting all.

The four filter fields correspond to the columns in the transcript list directly below the filter fields.

#### Filter by Transcript name

The "Transcript name" text field allows you to filter transcripts by name using regular expressions.

More information on using regular expressions in APLS can be found on the [Regular expressions]({{ '/doc/regex' | relative_url }}) documentation page.

#### Filter by Transcript type

The "Transcript type" multi-choice menu allows you to filter transcripts by their <span class="transcript-attr">type</span> of content.

{: .try-it }
> Because transcript type is determined by the content of the transcript, it makes it easy for researchers to filter for certain types of speech.
> To view all transcripts with higher attention to speech, go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) and select *reading* and *pairs* from the Transcript type drop-down list.

The four different categories for transcript <span class="transcript-attr">type</span> are described in the [Transcript attributes]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

#### Filter by Transcript Neighborhood

The "Transcript neighborhood" multi-choice menu allows you to filter the transcripts according to the Pittsburgh <span class="transcript-attr">neighborhood</span> where the participant was recruited from.

#### Filter by Duration

The "Duration (sec)" text fields allow you to filter transcripts by their <span class="transcript-attr">duration</span> in seconds. 

This filter can be used to view transcripts with a <span class="transcript-attr">duration</span> between two numbers, above one number, or below one number.

{: .try-it }
> Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) and enter "50" into the *From* text field and leave the *To* text field blank.
> This will show all transcripts that are at least 50 seconds in <span class="transcript-attr">duration</span>.
>
> In the same way, you can leave the *From* text field blank and enter "300" in the *To* text field to show all transcripts that are 300 seconds or less in <span class="transcript-attr">duration</span>.

#### Clearing filters

The "delete" arrow button on the right side of the filter menu allows you to clear all currently specified filters.

### Export menu

Below the filter menu is the <span class="keyterm">export menu</span>.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-export-menu.png' | relative_url }})

The export menu allows you to download selected transcripts in a variety of formats.
If no transcripts are selected, then these options will export all transcripts that match your current filter criteria.

#### Export Media and Export Original

The most straightforward export options are *Export Media* and *Export Original*.

- *Export Media* will download the audio for the selected transcripts as `.wav` files (packaged in a `.zip` file if more than one transcript is selected)
- *Export Original* will download the original ELAN transcripts for the selected transcripts as `.eaf` files (packaged in a `.zip` file if more than one transcript is selected)

There are no additional settings for the *Export Media* and *Export Original* options.

#### Export Attributes

The *Export Attributes* option allows you to download the metadata attributes for the selected transcripts.
Clicking the *Export Attributes* button will bring up a multi-select menu that expands when you hover it, as seen below.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-export-attributes.png' | relative_url }})

Descriptions of the different transcript attributes can be found in the [Transcript attributes]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.

<!--
The available choices for *Export Attributes* are:

- *transcript*: The name of the transcript (e.g., `CB01interview1.eaf`).
- *corpus*: Currently, all transcript files in APLS are part of the `pgh0307` corpus.
- *episode*: The episode code that the transcript is associated with (e.g., `CB01interview1.eaf` and `CB01reading2.eaf` are both part of the `CB01` episode).
- *transcript type*: The content <span class="transcript-attr">type</span> of the transcript.
- *transcript_neighborhood*: The <span class="transcript-attr">neighborhood</span> in Pittsburgh where the participant was recruited from.
- *transcript_language*: Currently, all transcript files in APLS are in English and have `en` as the transcript <span class="transcript-attr">language</span>.
- *transcript_version_date*: The <span class="transcript-attr">version_date</span> is when the transcript was last edited.
- *transcript_transcribers*: The name of the <span class="transcript-attr">transcribers</span> for that transcript.
- *transcript_recording_date*: The <span class="transcript-attr">recording_date</span> is when the transcript's audio recording took place.
- *transcript_duration*: The <span class="transcript-attr">duration</span> of the transcript in seconds.
- *transcript_transcription_ai_tools*: A list of the <span class="transcript-attr">transcription_AI_tools</span> that were used, if any.
- *transcript_notes*: Additional <span class="transcript-attr">notes</span> about the transcript that do not fit into the above categories.
-->

After selecting the attribute data you would like to export, click the *Export Attributes* button again to download the attributes for all selected transcripts as a single `.csv` file.

#### Export Formatted

The *Export Formatted* option allows you to download <span class="keyterm">layers</span> from transcripts in a variety of file types.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-export-formatted.png' | relative_url }})

Clicking the checkbox next to a <span class="keyterm">layer</span> in this menu will select that <span class="keyterm">layer</span> to be included in the downloaded files. 
You can use `Shift`+`Click` to select multiple checkboxes at once in this menu.

The [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page provides descriptions of [transcript attributes]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) and [participant attributes]({{ '/doc/attribute-reference#participant-attributes' | relative_url }}).
The [detailed field guide]({{ '/doc/detailed-field-guide' | relative_url }}) documentation page provides descriptions of all <span class="keyterm">layers</span> in APLS.

Below the <span class="keyterm">layers</span> selection menu, there is a drop-down menu that allows you to select the [file format](#export-formatted-file-types) for the transcript export download.

After selecting your desired <span class="keyterm">layers</span> and file format type, click the *Export Formatted* button again to export the transcripts.

##### Export Formatted file types

The following formatted file types are available with *Export Formatted*:

- LaTeX Document (`.tex`)
- Praat TextGrid (`.TextGrid`)
- PDF Document (`.pdf`)
- CLAN CHAT transcript (`.cha`)
- ELAN EAF Transcript (`.eaf`)
- EMU-SDMS Bundle (`.json`)
- Transcriber transcript (`.trs`)
- Comma Separated Values (`.csv`)
- WebVTT subtitles (`.vtt`)
- SALT transcript (`.slt`)
- Plain Text Document (`.txt`)

If more than one transcript is selected, the exported files will be packaged in a single `.zip` file.

#### Layered Search

The *Layered Search* option will open the [Search page]({{ '/doc/search' | relative_url }}) with the selected transcripts in the *Transcripts* search filter field.
This allows you to use any of the search capabilities described on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page with the selected transcripts.

{: .try-it }
> 1. Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts).
> 1. Click the checkbox next to *CB01interview1.eaf* and `Shift`+`Click` the checkbox next to *CB01reading2.eaf* to select all CB01 transcripts.
> 1. Click the *Layered Search* button to open the [Search page]({{ '/doc/search' | relative_url }}).
> 1. Type "steel" into the [Regular expression]({{ '/doc/regex' | relative_url }}) text field in the orthography section and click *Search*.
> 1. Click *Display results* to view all utterances of the word "steel" in the CB01 transcripts.

### Transcript list

The <span class="keyterm">transcript list</span> displays all transcripts in APLS that match your filter criteria.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-transcript-list.png' | relative_url }})

The transcript list in the screengrab above shows all transcripts in APLS that are of the `interview` <span class="transcript-attr">type</span>, tagged as `Cranberry Township` <span class="transcript-attr">neighborhood</span>, and have a <span class="transcript-attr">duration</span> between 300 and 500 seconds.

The columns in the transcript list, from left to right, are:
- A checkbox that can be toggled on to have the transcript included in [Export menu](#export-menu) options.
- The name of the transcript.
  - Clicking on the blue hyperlink text of the transcript name will open the [transcript webpage]({{ '/doc/view-transcript' | relative_url }}) for that transcript.
- The content <span class="transcript-attr">type</span> of the transcript.
- The <span class="transcript-attr">neighborhood</span> of the transcript.
- The <span class="transcript-attr">duration</span> of the transcript in seconds.
- A clickable *attributes icon* that will open that [transcript's attributes page](#transcript-attribute-pages).

{: .try-it }
> Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) and click the blue hyperlink *CB05pairs.eaf* text to view that transcript's [transcript page]({{ '/doc/view-transcript' | relative_url }}).

## Transcript attributes pages

Clicking the *attributes icon* for a transcript will open that transcript's attributes page.
This page includes more information about the transcript than what is displayed on the main Transcripts page, as well as a link to display information about the participants in the transcript.

![]({{ '/assets/screengrab/browse-transcripts/browse-transcripts-transcript-attributes-page.png' | relative_url }})

The *Participants* hyperlink will open the [Participants page]({{ '/doc/browse-participants' | relative_url }}) for the "Main speaker" participants present in the transcript.

{: .try-it }
> 1. Go to the [Transcripts page](https://apls.pitt.edu/labbcat/transcripts) 
> 1. Click the *attributes icon* for CB01reading1.eaf to view the transcript's attributes page.
> 1. Click the *Participants* hyperlink to view CB01 on the [Participants page]({{ '/doc/browse-participants' | relative_url }}).

A detailed description of the different transcript attributes can be found in the [Transcript attributes]({{ '/doc/attribute-reference#transcript-attributes' | relative_url }}) section of the [Attribute reference]({{ '/doc/attribute-reference' | relative_url }}) documentation page.


{% include linklist.html %}