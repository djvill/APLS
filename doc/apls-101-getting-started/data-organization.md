---
title: Data organization in LaBB-CAT
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/data-organization
parent: APLS 101/Getting started
nav_order: 30
last_modified_date: 2025-07-08T15:46:13-04:00
---

# {{ page.title }}
{:.no_toc}

APLS data is organized using the data structures provided by the open-source linguistic corpus software [LaBB-CAT].
The most important organizational units in LaBB-CAT corpora are <span class="keyterm">participants</span>, <span class="keyterm">transcripts</span>, <span class="keyterm">attributes</span>, <span class="keyterm">layers</span>, and <span class="keyterm">annotations</span>.

- [**Participants**](#participants) are speakers in the audio files (both interviewers and interviewees), along with metadata like demographic info.
- [**Transcripts**](#transcripts) are data objects for individual audio files and all of their annotations, plus metadata like when the audio file was recorded.
- [**Attributes**](#attributes) are metadata about participants and transcripts.
- [**Layers**](#layers) are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).
- [**Annotations**](#annotations) are individual bits of data aligned to specific timestamps in audio files.

## Participants

The **participants** in APLS are the interviewees, the interviewers, and occasionally a bystander whose speech is captured in the recording.
Interviewees in APLS are identified by an anonymized <span class="keyterm">speaker code</span> that includes their neighborhood abbrevation (e.g., `CB01`, `HD17`).[^demographics]

[^demographics]:
    Here's the demographic breakdown of APLS interviewees:
    
    | Neighborhood | Count |
    |--------------|-------|
    | Cranberry Township | 6 |
    | Forest Hills | 12 |
    | Hill District | 10 |
    | Lawrenceville | 12 |
    
    | Gender | Count |
    |--------|-------|
    | Female | 24    |
    | Male   | 16    |
    
    | Education | Count |
    |-----------|-------|
    | High school | 16 |
    | Undergraduate | 13 |
    | Graduate | 11 |
    
    <table>
      <thead>
        <tr>
          <th colspan="5" style="text-align:center;">Year of birth</th>
        </tr>
        <tr>
          <th>Minimum</th>
          <th>1st quartile</th>
          <th>Median</th>
          <th>3rd quartile</th>
          <th>Maximum</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1920</td>
          <td>1941</td>
          <td>1955</td>
          <td>1967</td>
          <td>1986</td>
        </tr>
      </tbody>
    </table>

## Transcripts

Each interview is divided into multiple **transcripts** (corresponding to the original recording files), named after the interviewee and interview section.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee FH10.[^eaf]
Some sections are split into multiple transcripts (e.g., `interview1`, `reading2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan].

## Attributes

Each participant and transcript has a set of **attributes** that describe metadata about the participant or transcript.
For example, the participant `HD17` has <span class="participant-attr">gender</span> `Female` and <span class="participant-attr">year_of_birth</span> `1964`.
The transcript `FH10pairs.eaf` has <span class="transcript-attr">duration</span> `188.61` and <span class="transcript-attr">recording_date</span> `September 26, 2023`.

## Layers and annotations

To illustrate **layers** and **annotations** in APLS, let's look at a single <span class="keyterm">line</span> of speech (aka an <span class="layer">utterance</span>) from the transcript `HD07interview3.eaf`:
{% include screengrab.html src="transcript/layers-annotations.png" %}

At the top of the image is `HD07`, the speaker code for the participant who uttered this speech.

### Layers

To the right of the speaker code are three layers. From top to bottom, these are <span class="layer">speech_rate</span>, <span class="layer">part_of_speech</span>, and <span class="layer">word</span>.
- <span class="layer">speech_rate</span> layer (top, colored teal): Measures how quickly HD07 uttered this line of speech (`6.5068` syllables per second).
- <span class="layer">part_of_speech</span> layer (middle, colored lime green): Encodes each word's part of speech using [Penn Treebank part-of-speech tags]({{ '/doc/notation-systems#treebank-pos' | relative_url }}) (e.g., `UH` for interjections, `CC` for coordinating conjunctions).
- <span class="layer">word</span> layer (bottom, colored black): Contains the words that HD07 spoke, written in conventional English spelling.

Layers are covered in more detail in the [Layers and attributes section]({{ '/doc/layers-and-attributes' | relative_url }}) of the APLS documentation.

### Annotations

In the previous image, each layer contains one or more annotations:

- <span class="layer">word</span> layer (bottom, colored black): Each word has a single annotation.
- <span class="layer">part_of_speech</span> layer (middle, colored lime green): Most words have a single <span class="layer">part_of_speech</span> annotation. The word _don't_ has two annotations (`VBP RB`), since it consists of both a present-tense verb (_do_) and an adverb (_not_).
- <span class="layer">speech_rate</span> layer (top, colored teal): APLS measures speech rate by lines in the transcript, so there is just one <span class="layer">speech_rate</span> annotation for this line (as indicated by the curved bracket).


[Next page: **Navigating documentation**]({{ '/doc/doc-navigation' | relative_url }}){: .btn .next-page }

{% include linklist.html %}

