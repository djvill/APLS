---
title: Viewing a transcript
permalink: /doc/view-transcript
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 20
last_modified_date: 2025-02-04T16:47:29:z
---

# {{ page.title }}
{:.no_toc}

A <span class="keyterm">transcript</span> is a collection of <span class="keyterm">annotations</span> on numerous <span class="keyterm">layers</span> corresponding to a single audio file, plus metadata like when the audio file was originally recorded.
In APLS, each transcript has a single <span class="keyterm">main participant</span> and corresponds to a section of that participant's sociolinguistic interview.
Each transcript has its own page in APLS.

{: .try-it }
> As we'll cover [below](#accessing-transcript-pages), there are a few ways to access individual transcript pages.
> The easiest is the [_transcripts_ page]({{ '/doc/browse-transcripts' | relative_url }}) at <https://apls.pitt.edu/transcripts>. 
> Go to that page and select a transcript to view.

{% include page_toc.html collapsible=true %}

## Accessing transcript pages

There are multiple ways to access the Transcript View page for individual transcripts.

The easiest is the [_transcripts_ page]({{ '/doc/browse-transcripts' | relative_url }}) at <https://apls.pitt.edu/transcripts>. 

Once you have a transcript open in a Transcript View page, you can use navigation arrows to move to a different transcript, as described [below](#media-player-and-navigation-arrows).

You can access transcripts through the Search results page by clicking on hyperlinked text, as described on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page.

You can also get to the Transcript View page for a transcript by navigating directly to the page's URL, which is in the form of `https://apls.pitt.edu/labbcat/transcript?transcript=` followed by the transcript's file name (e.g., the direct link for transcript file `CB01interview1.eaf` is `https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview1.eaf`)

## Transcript View page layout

The page layout for individual transcript pages can be divided into three main areas:

- The <span class="keyterm">media player</span> and <span class="keyterm">transcript navigation arrows</span>, which remain in the same position on the page as you scroll. 

- The <span class="keyterm">transcript header</span>, which includes general information about the transcript, exported format options, and settings for choosing what layers are displayed in the transcript body.

- The <span class="keyterm">transcript body</span>, which displays the actual content of the transcript.

## Media player and navigation arrows

There are two features of the Transcript View page that are fixed elements, meaning that they remain in the same place on the page regardless of where you scroll.
These elements are the in-browser media player and the transcript navigation arrows.

![]({{ '/assets/screengrab/view-transcript/view-transcript-fixed-elements.png' | relative_url }})

The transcript navigation arrows allow you to move from one transcript to the either the previous transcript or the next transcript in the series (when applicable; i.e., `CB01interview1.eaf` is the first transcript so it does not have a previous transcript).

The in-browser media player allows you to listen to the audio recording for the transcript, in addition to providing the functionality to play audio of individual utterances as described [below](#transcript-body).
The media player also allows you to control the volume and playback speed of the audio.

If your media player is displaying a small Praat logo (as shown below), this indicates that you do not have Praat integration set up.
You can learn more about enabling Praat integration [here]({{ '/doc/transcript-praat' | relative_url }}).

![]({{ '/assets/screengrab/view-transcript/view-transcript-media-player.png' | relative_url }})

## Transcript header

The transcript header provides the name of the transcript file, format options for transcript downloads, collapsible attributes, participant codes, and check boxes that control which project categories and layers are displayed in the transcript.

![]({{ '/assets/screengrab/view-transcript/view-transcript-header.png' | relative_url }})

At the top of the transcript header is the name of the transcript file. In the screenshot, this is `CB01interview1.eaf`.

### Export formatted files

Below the transcript file name is the _export formatted_ drop-down menu. 

![]({{ '/assets/screengrab/view-transcript/view-transcript-formats.png' | relative_url }})

This menu allows you to download the current transcript in any of the listed file types.

### Attributes

Underneath the _export formatted_ menu is the collapsible _attributes_ information. 

![]({{ '/assets/screengrab/view-transcript/view-transcript-attributes.png' | relative_url }})

You can hover over the field names, like "Neighborhood" and "Recording date", for more information about the data in those fields.

### Participants

Below _attributes_ are the <span class="keyterm">participants</span> in the transcript. 

![]({{ '/assets/screengrab/view-transcript/view-transcript-participants.png' | relative_url }})

Participant codes for interviewees are displayed in **bold**. 
Clicking a name in the participants section will take you to the information page for that participant, which is explained in more detail on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.

### Projects and layers

The **projects** and **layers** sections control what information is displayed in the transcript body.

![]({{ '/assets/screengrab/view-transcript/view-transcript-projects-layers.png' | relative_url }})

{: .note }
> By default, the <span class="layer">word</span> layer is always turned on and cannot be turned off.

To make more layer options appear in the **layers** section, the project that corresponds to that layer must be turned on in the **projects** section.

You can hover over the names of the projects to view a brief description of the layers associated with that project.
You can also read more about projects on the [Layers: Typology]({{ '/doc/typology#project-categories' | relative_url }}) documentation page.

![]({{ '/assets/screengrab/view-transcript/view-transcript-project-timing.png' | relative_url }})

As shown in the screenshot above, toggling the _timing_ project causes the **layers** section to display layers that are included in the timing project category.
You can learn more about layers on the [Layer reference]({{ '/doc/layer-reference' | relative_url }}) documentation pages.

<!--The layer options are ordered by scope from largest to smallest, then by project in the order shown in the projects column, and then by alphabetic order.-->

Layers with phonological information have an additional toggle to switch between IPA transcriptions and Raw (DISC) transcriptions.
You can read more about DISC and why APLS uses it on the [Phonemic transcription]({{ '/doc/phonemic-transcription' | relative_url }}) documentation page.

Selecting one or more of the options in **layers** section will cause that layer to be displayed in the transcript body.

## Transcript body

To become acquainted with the layout of the <span class="keyterm">transcript body</span>, we will start off with only the default <span class="layer">word</span> layer enabled, as shown in the screenshot below.
Additionally, while the other layers affect the information that is displayed in the transcript, all the interactable layers in the transcript body operate in the same way as the <span class="layer">word</span> layer described in this section.

![]({{ '/assets/screengrab/view-transcript/view-transcript-transcript-body1.png' | relative_url }})

### Turns, utterances, noises, and overlaps

Every line in the transcript corresponds to a conversational turn or continuous utterance in the audio recording. 
The speakers who have transcribed audio for a particular turn are shown on the left-hand side within the dotted lines.
In the example screenshot above, the interviewer Barbara Johnstone is the only person speaking in these lines, so only the name `Barbara Johnstone` is displayed.

To the right of the dotted lines is the transcribed speech for that speaker for that utterance.
Clicking on any of the blue words in the transcript will bring up the word menu that allows you to open the utterance in Praat, extract and download the audio of the utterance, or play the audio of the utterance using the in-browser APLS media player.

![]({{ '/assets/screengrab/view-transcript/view-transcript-transcript-body2.png' | relative_url }})

{: .note }
> For instructions on setting up Praat integration for your web browser, visit the [Viewing transcript segments in Praat]({{ '/doc/transcript-praat' | relative_url }}) documentation page.

When an utterance has overlapping speech from multiple speakers, the left-hand side of the transcript will show all the speakers who have transcribed speech for that portion of audio.
Participant speech is **bolded** in APLS to make it easier to distinguish from the interviewer's speech.

![]({{ '/assets/screengrab/view-transcript/view-transcript-transcript-body3.png' | relative_url }})

If non-speech sounds have been transcribed, those annotations will appear above the <span class="layer">word</span> layer. 
All non-speech sounds from all speakers are combined in the top-most section of the <span class="layer">word</span> layer, so it is possible for a speaker to appear on the left-hand side of the transcript without having any words in the <span class="layer">word</span> layer.
An example of this is shown below.

![]({{ '/assets/screengrab/view-transcript/view-transcript-transcript-body4.png' | relative_url }})

{: .note }
> It is possible to use CTRL+F to search a transcript page for singular words but not for multi-word strings due to the underlying HTML of the transcript view pages (e.g., CTRL+F will work to find the word 'filing' but it won't find the phrase 'filing cabinet').

