---
title: Browsing transcripts
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/browse-transcripts
parent: How to use APLS
nav_order: 30
last_modified_date: 2025-05-27T13:05:21-04:00
---

# {{ page.title }}
{:.no_toc}

The primary way to browse transcripts in APLS is via the _transcripts_ page: <https://apls.pitt.edu/labbcat/transcripts>. 

The _transcripts_ page lists all the transcripts in APLS that are available for access, but it also offers useful tools for filtering and exporting transcripts.
On this documentation page, we cover the functionality and layout of the _transcripts_ page.

{% include page_toc.html collapsible=true %}

## What you can do on the _transcripts_ page

The _transcripts_ page allows you to...
- [View transcript information](#transcript-list).
- [Filter transcripts](#filtering-transcripts) according to certain criteria.
- [Export transcripts](#exporting-and-searching-transcripts) in a variety of formats.
- [Search transcripts](#layered-search) with the [_search_ page]({{ '/doc/search' | relative_url }}).

### Layout

<!-- creating blank section for Dan to add screengrabs and such -->

## Transcript list

The <span class="keyterm">transcript list</span> displays all transcripts in APLS that match your filter criteria.

{% include screengrab.html src="browse-transcripts/browse-transcripts-transcript-list.png" %}

The transcript list in the screengrab above shows all transcripts in APLS that are of the `interview` <span class="transcript-attr">type</span>, tagged as `Cranberry Township` <span class="transcript-attr">neighborhood</span>, and have a <span class="transcript-attr">duration</span> between 300 and 500 seconds.

The columns in the transcript list, from left to right, are:
- A checkbox that can be toggled on to have the transcript included in [Export menu](#exporting-and-searching-transcripts) options.
- The name of the transcript.
  - Clicking on the transcript name will open the [transcript page]({{ '/doc/view-transcript' | relative_url }}) for that transcript.
- The content <span class="transcript-attr">type</span> of the transcript.
- The <span class="transcript-attr">neighborhood</span> of the transcript.
- The <span class="transcript-attr">duration</span> of the transcript in seconds.
- A clickable *attributes icon* that will open that [transcript's attributes page](#transcript-attributes-pages).

{: .try-it }
> Go to the [_transcripts_ page](https://apls.pitt.edu/labbcat/transcripts) and click *CB05pairs.eaf* to view that transcript's [transcript page]({{ '/doc/view-transcript' | relative_url }}).

You can read more about transcript attributes in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).

## Filtering transcripts

The <span class="keyterm">filter menu</span> at the top of the _transcripts_ page lets you find transcripts that match certain criteria.

{% include screengrab.html src="browse-transcripts/browse-transcripts-filter-menu.png" %}

Underneath the **Transcripts** heading is the match count, which shows the number of transcripts that currently fit the criteria of your filters.
In the screengrab above, no filters have been applied so the match count displays `218`,[^filter] which is the total number of transcripts in APLS.

[^filter]: For multi-choice filter options, selecting none of the options is the same as selecting all.

The four filter fields correspond to the columns in the transcript list directly below the filter fields:
- The "Transcript name" text field filters transcripts by name and supports [regular expressions]({{ '/doc/regex' | relative_url }}).
- The "Transcript type" multi-choice menu filters transcripts by their <span class="transcript-attr">type</span> of content.

  {: .try-it }
  > Because transcript type is determined by the content of the transcript, it makes it easy for researchers to filter for certain types of speech.
  > To view all transcripts with higher attention to speech, go to the [_transcripts_ page](https://apls.pitt.edu/labbcat/transcripts) and select *reading* and *pairs* from the Transcript type drop-down list.
- The "Transcript neighborhood" multi-choice menu filters transcripts according to the Pittsburgh <span class="transcript-attr">neighborhood</span> where the participant was recruited from.
- The "Duration (sec)" text fields filter transcripts by their <span class="transcript-attr">duration</span> in seconds. 
  - To view transcripts that are...
    -  _at least_ `X` seconds long: enter `X` in the *From* box (leave *To* blank)
    - _at most_ `Y` seconds long: enter `Y` in the *To* box (leave *From* blank)
    - _between_ `X` and `Y` seconds long (inclusive): enter `X` in the *From* box and `Y` in the *To* box

  {: .try-it }
  > Go to the [_transcripts_ page](https://apls.pitt.edu/labbcat/transcripts) and enter `50`"into the *From* text field and leave the *To* text field blank.
  > This will show all transcripts that are at least 50 seconds in <span class="transcript-attr">duration</span>.
  >
  > In the same way, you can leave the *From* text field blank and enter `300` in the *To* text field to show all transcripts that are 300 seconds or less in <span class="transcript-attr">duration</span>.

### Clearing filters

The "delete" button ({% include labbcat-icon.html src="delete.svg" %}) allows you to clear all currently specified filters.

## Exporting and searching transcripts

The <span class="keyterm">export menu</span> allows you to download transcripts in a variety of formats and perform [searches]({{ '/doc/search' | relative_url }}) on transcripts.
The export menu is located below the [filter menu](#filtering-transcripts).

{% include screengrab.html src="browse-transcripts/browse-transcripts-export-menu.png" %}

{: .note .no-collapse}
> If no transcripts are selected, then these options will export all transcripts that match your current filter criteria.

### *Export Media* and *Export Original*

The most straightforward export options are *Export Media* and *Export Original*.

- *Export Media* will download the audio for the selected transcripts as `.wav` files (packaged in a `.zip` file if more than one transcript is selected)
- *Export Original* will download the original ELAN transcripts for the selected transcripts as `.eaf` files (packaged in a `.zip` file if more than one transcript is selected)

### *Export Attributes*

The *Export Attributes* option allows you to download the metadata attributes for the selected transcripts.
Clicking the *Export Attributes* button will bring up a multi-select menu that expands when you hover it, as seen below.

{% include screengrab.html src="browse-transcripts/browse-transcripts-export-attributes.png" %}

Descriptions of the different transcript attributes can be found in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).

After selecting the attribute data you would like to export, click the *Export Attributes* button again to download the attributes for all selected transcripts as a single `.csv` file.

### *Export Formatted*

The *Export Formatted* option allows you to download <span class="keyterm">layers</span> from transcripts in a variety of file types.

{% include screengrab.html src="browse-transcripts/browse-transcripts-export-formatted.png" %}

Clicking the checkbox next to a <span class="keyterm">layer</span> in this menu will select that <span class="keyterm">layer</span> to be included in the downloaded files. 
You can use `Shift`+`Click` to select multiple checkboxes at once in this menu.

The attribute [typology]({{ '/doc/attribute-typology' | relative_url }}) and field guides provide descriptions of [transcript attributes]({{ '/doc/transcript-attributes' | relative_url }}) and [participant attributes]({{ '/doc/participant-attributes' | relative_url }}).
The [layer field guide]({{ '/doc/layer-field-guide' | relative_url }}) documentation page provides descriptions of all <span class="keyterm">layers</span> in APLS.

Below the <span class="keyterm">layers</span> selection menu, there is a drop-down menu that allows you to select the file format for the transcript export download.

{: .note}
> The following formatted file types are available with *Export Formatted*:
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

After selecting your desired <span class="keyterm">layers</span> and file format type, click the *Export Formatted* button again to export the transcripts.

If more than one transcript is selected, the exported files will be packaged in a single `.zip` file.

### *Layered Search*

The *Layered Search* option will open the [_search_ page]({{ '/doc/search' | relative_url }}) with the selected transcripts in the *Transcripts* search filter field.
This allows you to use any of the search capabilities described on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page with the selected transcripts.

{: .try-it }
> 1. Go to the [_transcripts_ page](https://apls.pitt.edu/labbcat/transcripts).
> 1. Click the checkbox next to *CB01interview1.eaf* and `Shift`+`Click` the checkbox next to *CB01reading2.eaf* to select all CB01 transcripts.
> 1. Click *Layered Search* to open the [_search_ page]({{ '/doc/search' | relative_url }}).
> 1. Enter `steel` into the [Regular expression]({{ '/doc/regex' | relative_url }}) text field in the orthography section and click *Search*.
> 1. Click *Display results* to view all utterances of the word `steel` in the CB01 transcripts.

## Transcript attributes pages

Clicking the *attributes icon* for a transcript will open that transcript's attributes page.
This page includes more information about the transcript than what is displayed on the main _transcripts_ page, as well as a link to display information about the participants in the transcript.

{% include screengrab.html src="browse-transcripts/browse-transcripts-transcript-attributes-page.png" %}

The *Participants* hyperlink will open the [Participants page]({{ '/doc/browse-participants' | relative_url }}) for the "Main speaker" participants present in the transcript.

{: .try-it }
> 1. Go to the [_transcripts_ page](https://apls.pitt.edu/labbcat/transcripts) 
> 1. Click the *attributes icon* for CB01reading1.eaf to view the transcript's attributes page.
> 1. Click *Participants* to view CB01 on the [Participants page]({{ '/doc/browse-participants' | relative_url }}).

A detailed description of the different transcript attributes can be found in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).


{% include linklist.html %}