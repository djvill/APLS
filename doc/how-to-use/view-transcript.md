---
title: Viewing a transcript
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/view-transcript
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 20
last_modified_date: 2025-05-27T16:16:17-04:00
---

# {{ page.title }}
{:.no_toc}

A <span class="keyterm">transcript</span> is a collection of <span class="keyterm">annotations</span> on numerous <span class="keyterm">layers</span> corresponding to a single audio file, plus <span class="keyterm">transcript attributes</span> like when the audio file was originally recorded.
In APLS, each transcript has a single <span class="keyterm">main participant</span> and corresponds to a section of that participant's sociolinguistic interview.
Each transcript has its own page in APLS.

{: .note .no-collapse }
> On this page, we use the term _transcript_ for the underlying data in the APLS corpus, and _<span class="apls-page">Transcript</span> **page**_ for the webpage you can use to view transcript data.

{: .try-it }
> As we'll cover [below](#accessing-transcript-pages), there are a few ways to access individual <span class="apls-page">Transcript</span> pages.
> The easiest is the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}) at <https://apls.pitt.edu/labbcat/transcripts>. 
> Go to that page and select a transcript to view.

{% include page_toc.html collapsible=true %}

## What you can do on the <span class="apls-page">Transcript</span> page



## <span class="apls-page">Transcript</span> page layout

Individual <span class="apls-page">Transcript</span> pages have two sections, plus some elements that remain in the same position on the page as you scroll. This is highlighted in the following screengrab:

{% include screengrab.html src="transcript/overview.png" %}

- Sections: 
  - The [transcript header](#transcript-header), highlighted in **red**{:.hl-1}. This includes information about the transcript, a menu for exporting the transcript in various formats, and settings for choosing which layers are displayed in the transcript body.
  - The [transcript body](#transcript-body), highlighted in **blue**{:.hl-2}. This displays the actual content of the transcript. It continues all the way down the page.
- Fixed elements:
  - The [media player](#media-player-and-navigation-arrows), highlighted in **green**{:.hl-3}.
  - The [navigation arrows](#media-player-and-navigation-arrows), highlighted in **purple**{:.hl-4}.

## Media player and navigation arrows

There are two features of the <span class="apls-page">Transcript</span> page that are fixed elements, meaning that they remain in the same place on the page regardless of where you scroll.
These elements are the in-browser media player and the transcript navigation arrows (see previous screengrab).

The transcript navigation arrows allow you to move from one transcript to the either the previous transcript or the next transcript in the interview.
These arrows are hidden if you are looking at the first or last transcript in the interview.

{: .try-it }
> On the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`, click the "previous" button.
> This will load the <span class="apls-page">Transcript</span> page for `CB01interview2.eaf`.
> Then, click the "next" button to go back to `CB01interview3.eaf`.

The in-browser media player allows you to listen to audio from the transcript, control the volume, and (via the &vellip; menu) control the playback speed.
While the audio is playing, the transcript body will highlight the utterance (line) that is currently playing.
You can also listen to audio through the [word menu](#word-menu).

If your media player is displaying a small Praat logo (as shown below), this indicates that you do not have the Praat integration set up.
You can learn more about enabling the Praat integration [here]({{ '/doc/praat-integration' | relative_url }}).

{% include screengrab.html src="transcript/no-praat-player.png" %}


## Transcript header

The transcript header provides information about the transcript, options for exporting a formatted transcript, and check boxes that control what data is displayed in the transcript body.

{% include screengrab.html src="transcript/header.png" %}

- At the top of the transcript header is the name of the transcript file (in this case, `CB01interview3.eaf`).
- Most important is the [layer selector](#layer-selector), highlighted in **red**{:.hl-1}. This controls which layers are displayed in the transcript.
- [_export formatted ▼_](#export-formatted-▼), highlighted in **blue**{:.hl-2}: a drop-down menu that allows you to download the current transcript in multiple formats.
- [_[transcript attributes]_](#transcript-attributes-panel), highlighted in **green**{:.hl-3}: a collapsible panel that displays <span class="keyterm">transcript attributes</span>.
- A list of [participants](#participants-list), highlighted in **purple**{:.hl-4}, with links to [attributes pages]({{ '/doc/browse-participants#participant-attributes-pages' | relative_url }}).


### _export formatted ▼_

The _export formatted ▼_ drop-down menu allows you to download the current transcript in any of the listed file types:

{% include screengrab.html src="transcript/export-formatted.png" %}

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page (<https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf>):
> 
> 1. Make sure only the <span class="layer">word</span> layer is selected.
> 1. Click _export formatted ▼_.
> 1. Click _Praat TextGrid_.
> 1. Open the TextGrid in [Praat].

At a minimum, the exported file will include the <span class="layer">utterance</span> and <span class="layer">word</span> layers.
It will also include any layers you have [selected](#layer-selector) to show in the transcript body.
Some transcript formats also show additional layers from the [original uploaded transcription]({{ '/doc/transcription' | relative_url }}): <span class="layer">noise</span>, <span class="layer">comment</span>, and <span class="layer">pronounce</span>.
<!-- Show what this looks like, just in text -->

{: .note }
> If you need greater control over which layers to export, use the [_Export Formatted_ menu on the <span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts#export-formatted' | relative_url }}).

The file format affects not only _which_ layers are included, but _how_ they are displayed.
For example, in *Praat TextGrid*s and *Elan EAF Transcript*s, there is one tier for each speaker's <span class="layer">utterance</span> annotations (labeled, for example, `Barbara Johnstone` tier and one `CB01` tier) and one tier for each speaker's <span class="layer">word</span> annotations (e.g., `word - Barbara Johnstone` and `word - CB01`);
these annotations are all time-aligned.
In *Plain Text Document*s and *PDF Document*s, <span class="layer">utterance</span>s are separated by line breaks and <span class="layer">word</span>s are simply listed within each utterance;
these annotations are _not_ time-aligned and there's no way to tell whether speech is overlapping.
As a result, the *Plain Text Document*s and *PDF Document* formats are better for a readable or skimmable overview of who said what, and not very useful as structured linguistic data.

{: .try-it }
> 1. Open the TextGrid from the previous try-it.
>
> You should see four tiers, two per speaker: one for each speaker's <span class="layer">utterance</span> annotations (labeled `Barbara Johnstone` and `CB01`) and one for each speaker's <span class="layer">word</span> annotations (labeled `word - Barbara Johnstone` and `word - CB01`).
> * * *
> Now let's zoom into the first Barbara Johnstone utterance (`okay just a few questions about you as an individual`):
>
> 1. Click that interval in the `Barbara Johnstone` tier.
> 1. Either click _sel_ in the bottom-left of the TextGrid window, or hit `<ctrl>/<cmd>+N`.
> 
> You should see that each of the words in the utterance has its own interval in `word - Barbara Johnstone`:
> 
> {% include screengrab.html src="transcript/export-praat-1.png" %}
> * * *
> Finally, let's see how overlaps look in an exported TextGrid.
> According to the <span class="apls-page">Transcript</span> page, there's an overlap when Barbara Johnstone says `what you'd say you're` and CB01 says `okay`, right after Barbara's first utterance
> 
> 1. Zoom into the next `Barbara Johnstone` interval in the TextGrid.
>
> You should see a `CB01` interval that lines up with the `Barbara Johnstone` interval, plus words on _both_ speakers' `word - ` tiers.
> {% include screengrab.html src="transcript/export-praat-2.png" %}


As previously mentioned, the exported file will include any layers you have [selected](#layer-selector) to show in the transcript body.
Unlike in the transcript body, phonological layers (like <span class="layer">segment</span>) are always displayed in the [DISC phonemic alphabet]({{ '/doc/phonemic-transcription' | relative_url }}).

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page:
> 
> 1. Select the <span class="layer">segment</span> layer.
> 1. Click _export formatted ▼_.
> 1. Click _Praat TextGrid_.
> 1. Open the TextGrid in Praat.
>
> Compared to the previous try-it, you should see two new tiers: a `segment - ` tier for each speaker.
> If you zoom in on an individual word, you should see that each of the segments has its own interval.
> <!-- These segments are displayed in DISC, so `5k1` is /oUkeI/ -->
>
> {% include screengrab.html src="transcript/export-praat-3.png" %}

Finally, if a layer allows [vertical peers]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) (with a {% include labbcat-icon.html src="vertical-peers.svg" %} icon in the [layer selector](#layer-selector)), the exported file may show multiple tiers per speaker:

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page:
> 
> 1. Unselect <span class="layer">segment</span> and select <span class="layer">dictionary_phonemes</span>.
> 1. Export to _Praat TextGrid_ and open in [Praat].
>
> You should see **three** `dictionary_phonemes - ` tiers per speaker.
> This is because some words have more than one possible phonemic representation, such as /æz/ or /əz/ for _as_.
> {% include screengrab.html src="transcript/export-praat-4.png" %}

<!-- Mention how to get full tier names in TextGrid view -->


### [transcript attributes] panel

Underneath the _export formatted_ menu is the collapsible _[transcript attributes]_ panel
This panel shows' <span class="keyterm">transcript attributes</span> display titles in the left-hand column (e.g., `Neighborhood`) and values in the right-hand column (e.g., `Cranberry Township`).

{% include screengrab.html src="transcript/attributes.png" %}

If you hover over a display title, a tooltip will pop up with the attribute's [export name]({{ '/doc/attribute-typology#export-name'}}) and short description.

{% include screengrab.html src="transcript/attribute-hover.png" %}

Blanks in the right-hand column mean that this transcript doesn't have any value for that attribute.
For example, the previous screengrabs show a blank for `Transcription AI tool(s)` because the <span class="transcript-attr">transcription_ai_tools</span> attribute is empty for `CB01interview3.eaf`;
no AI tools were used to transcribe that interview.

{: .note }
> To export transcript attributes to a CSV file, use the [_Export Attributes_ menu on the <span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts#export-attributes' | relative_url }}).


### Participants list

Below _attributes_ are the <span class="keyterm">participants</span> in the transcript. 

{% include screengrab.html src="transcript/participants.png" %}

Participant codes for main participants are displayed in **bold**. 
Clicking a participant code will take you to that participant's [<span class="apls-page">Participant attributes</span> page]({{ '/doc/browse-participants#participant-attributes-pages' | relative_url }}).


### Layer selector

The **projects** and **layers** sections control what information is displayed in the transcript body.

{% include screengrab.html src="transcript/projects-layers.png" %}

{% comment %}turning on/off layers and the page reload delay{% endcomment %}

{% comment %}layer icons (tho maybe wait on this because vertical peers is in a project){% endcomment %}

{: .note }
> The <span class="layer">word</span> layer cannot be turned off (which is why its checkbox is grayed-out).

To make more layer options appear in the **layers** section, the project that corresponds to that layer must be turned on in the **projects** section.

You can hover over the names of the projects to view a brief description of the layers associated with that project.
You can also read more about projects on the [Layer typology]({{ '/doc/layer-typology#project' | relative_url }}) documentation page.

{% include screengrab.html src="transcript/project-timing.png" %}

As shown in the screenshot above, toggling the _timing_ project causes the **layers** section to display layers that are included in the timing project category.
You can learn more about layers in the [Layers and attributes]({{ '/doc/layers-and-attributes' | relative_url }}) documentation pages.

{% comment %}"include empty layers"{% endcomment %}

{: .under-the-hood }
> The layer options are ordered by scope from largest to smallest, then by project in the order shown in the projects column, and then by alphabetic order.

Layers with phonological information have an additional toggle to switch between IPA transcriptions and Raw (DISC) transcriptions.
You can read more about DISC and why APLS uses it on the [Phonemic transcription]({{ '/doc/phonemic-transcription' | relative_url }}) documentation page.

Selecting one or more of the options in **layers** section will cause that layer to be displayed in the transcript body.



## Transcript body

To become acquainted with the layout of the <span class="keyterm">transcript body</span>, we will start off with only the default <span class="layer">word</span> layer enabled, as shown in the screenshot below.
Additionally, while the other layers affect the information that is displayed in the transcript, all the interactable layers in the transcript body operate in the same way as the <span class="layer">word</span> layer described in this section.

{% include screengrab.html src="transcript/transcript-body1.png" %}

### Turns, utterances, noises, and overlaps

Every line in the transcript corresponds to a conversational turn or continuous utterance in the audio recording. 
The speakers who have transcribed audio for a particular turn are shown on the left-hand side within the dotted lines.
In the example screenshot above, the interviewer Barbara Johnstone is the only person speaking in these lines, so only the name `Barbara Johnstone` is displayed.

To the right of the dotted lines is the transcribed speech for that speaker for that utterance.
Clicking on any of the blue words in the transcript will bring up the word menu that allows you to open the utterance in Praat, extract and download the audio of the utterance, or play the audio of the utterance using the in-browser APLS media player.

{% include screengrab.html src="transcript/transcript-body2.png" %}

{: .note }
> For instructions on setting up the Praat integration for your web browser, visit the [Viewing transcript segments in Praat]({{ '/doc/praat-integration' | relative_url }}) documentation page.

When an utterance has overlapping speech from multiple speakers, the left-hand side of the transcript will show all the speakers who have transcribed speech for that portion of audio.
Participant speech is **bolded** in APLS to make it easier to distinguish from the interviewer's speech.

{% include screengrab.html src="transcript/transcript-body3.png" %}

If non-speech sounds have been transcribed, those annotations will appear above the <span class="layer">word</span> layer. 
All non-speech sounds from all speakers are combined in the top-most section of the <span class="layer">word</span> layer, so it is possible for a speaker to appear on the left-hand side of the transcript without having any words in the <span class="layer">word</span> layer.
An example of this is shown below.

{% include screengrab.html src="transcript/transcript-body4.png" %}

{: .note }
> It is possible to use CTRL+F to search a <span class="apls-page">Transcript</span> page for singular words but not for multi-word strings due to the underlying HTML of the <span class="apls-page">Transcript</span> pages (e.g., CTRL+F will work to find the word 'filing' but it won't find the phrase 'filing cabinet').

## Accessing <span class="apls-page">Transcript</span> pages 

There are multiple ways to reach a <span class="apls-page">Transcript</span> page in APLS:

- The <span class="apls-page">Transcripts</span> page at <https://apls.pitt.edu/labbcat/transcripts>, as described on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.
  > Go to the <span class="apls-page">Transcripts</span> page (<https://apls.pitt.edu/labbcat/transcripts>) and click on _CB01interview3.eaf_ to view that transcript.
  {: .try-it }
- Via the <span class="apls-page">Transcript</span> page's URL, which is in the form of `https://apls.pitt.edu/labbcat/transcript?transcript=` followed by the transcript's name.
  > Click the URL <https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf>.
  > This will take you directly to the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`.
  {: .try-it }
- Once you have a <span class="apls-page">Transcript</span> page open, you can use navigation arrows to move to a different transcript, as described [above](#media-player-and-navigation-arrows).

In addition, there are two ways to access transcripts from the results of a search (see [Searching the corpus]({{ '/doc/search' | relative_url }})):

- Through the <span class="apls-page">Search results</span> page by clicking on hyperlinked text. This will load the <span class="apls-page">Transcript</span> page and scroll directly to the search result you clicked.
- If you export search results to CSV (see [Exporting data]({{ '/doc/export-data' | relative_url }})), the `URL` column has links that load the <span class="apls-page">Transcript</span> page and scroll directly to the search result corresponding to each row.

{% include linklist.html %}
