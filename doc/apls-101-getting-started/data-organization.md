---
title: Data organization in LaBB-CAT
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/data-organization
parent: APLS 101/Getting started
nav_order: 30
last_modified_date: 2025-05-27T12:31:57-04:00
---

# {{ page.title }}
{:.no_toc}

APLS data is organized using the data structures provided by the open-source linguistic corpus software [LaBB-CAT].
The most important organizational units in LaBB-CAT corpora are <span class="keyterm">participants</span>, <span class="keyterm">transcripts</span>, <span class="keyterm">layers</span>, and <span class="keyterm">annotations</span>.

- [**Participants**](#participants) are speakers in the audio files (both interviewers and interviewees), along with metadata like demographic info.
- [**Transcripts**](#transcripts) are data objects for individual audio files and all of their annotations, plus metadata like when the audio file was recorded.
- [**Layers**](#layers) are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).
- [**Annotations**](#annotations) are individual bits of data aligned to specific timestamps in audio files.

## Participants

The **participants** in APLS are the interviewees, the interviewers, and occasionally a bystander whose speech is captured in the recording.
Interviewees in APLS are identified by an anonymized <span class="keyterm">speaker code</span> that includes their neighborhood abbrevation (e.g., `CB01`, `HD17`).

## Transcripts

Interviews are divided into several **transcripts** (corresponding to the original recording files), named after the interviewee and interview section.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee FH10.[^eaf]
Some sections are split into multiple transcripts (e.g., `interview1`, `reading2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan].

## Layers and annotations

To illustrate **layers** and **annotations** in APLS, let's look at a screen-grab of a single <span class="keyterm">line</span> of speech (aka an <span class="layer">utterance</span>) from the transcript `HD07interview3.eaf`:
{% include screengrab.html src="demo-page.png" %}
<!-- A better screen-grab would: (a) be narrower (not take up as much x-axis real estate), (b) be from a line that doesn't have an annoying duration -->

On the left-hand side of the image is `HD07`, the speaker code for the participant who uttered this speech.

### Layers

To the right of the speaker code are three layers. From top to bottom, these are <span class="layer">speech_rate</span>, <span class="layer">part_of_speech</span>, and <span class="layer">word</span>.
- <span class="layer">speech_rate</span> (top)
  - This layer contains a measurement (in syllables per second) of how quickly HD07 uttered this line.
  - APLS measures speech rate by lines in the transcript, so there is just one <span class="layer">speech_rate</span> annotation for this line (as indicated by the curved bracket).
- <span class="layer">part_of_speech</span> (middle)
  - This layer encodes each word's part of speech using [Penn Treebank part-of-speech tags]({{ '/doc/notation-systems#penn-treebank-pos-tags' | relative_url }}) (e.g., `UH` for interjections, `CC` for coordinating conjunctions).
  - Most words have a single <span class="layer">part_of_speech</span> annotation. The word _don't_ has two annotations (`VBP RB`), since it consists of both a present-tense verb (_do_) and an adverb (_not_).
- <span class="layer">word</span> (bottom)
  - This layer contains the words that HD07 spoke, spelled in normal English.
  - Each word has a single annotation on the <span class="layer">word</span> layer.

Layers are covered in more detail in the [Layers and attributes section]({{ '/doc/layers-and-attributes' | relative_url }}) of the APLS documentation.

### Annotations

The cursor in the screen-grab is hovering over the `NN` annotation, which brings up a tooltip with several pieces of information:
  - The selected annotation is on the <span class="layer">part_of_speech</span> layer.
  - This annotation is part of an utterance that begins at 7.92 seconds into the transcript and lasts around 3.29 seconds.
  - Clicking on the annotation will bring up a [menu]({{ '/doc/view-transcript#word-menu' | relative_url }}) with additional options.

[Next page: **Navigating documentation**]({{ '/doc/doc-navigation' | relative_url }}){: .btn .next-page }

{% include linklist.html %}

