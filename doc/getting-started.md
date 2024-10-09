---
title: Getting started
layout: default
permalink: /doc/getting-started
nav_order: 10
last_modified_date: 2024-10-09T16:58:00-04:00
---

# {{ page.title }}
{:.no_toc}

This page contains some background information on APLS that will help you get started.

{% include page_toc.html collapsible=true open=true %}


## APLS 101

APLS contains sound files alongside annotations that allow us to treat these audio files as structured linguistic data.
Once you have an [APLS login](#sign-up), you can access APLS through your browser at https://apls.pitt.edu/labbcat, the [`nzilbb.labbcat` package](https://nzilbb.github.io/labbcat-R/) for R, or the [`nzilbb-labbcat` library](https://nzilbb.github.io/labbcat-py/) for Python.
The browser version of APLS works just like any other webpage: you can use the back/forward buttons to navigate, create bookmarks, load multiple pages in tabs, etc.


All of this is possible thanks to the open-source linguistic corpus software [LaBB-CAT](https://sourceforge.net/projects/labbcat/).
If you are familiar with other corpora powered by LaBB-CAT, then a lot of how APLS works will be familiar to you.
Otherwise, it's good to get your head around some basic organizational concepts


### LaBB-CAT organization

The most important organizational units in LaBB-CAT corpora are <span class="keyterm">annotations</span>, <span class="keyterm">transcripts</span>, <span class="keyterm">annotations</span>, and <span class="keyterm">layers</span>:

- **Annotations** are individual bits of data aligned to specific parts of audio files.
- **Transcripts** hold data for a single audio file and all of its annotations, plus metadata like when the transcript was conducted.
- **Participants** are speakers, plus metadata like demographic info.
- **Layers** are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).

To illustrate, here's a screen-grab of a single line from one transcript, `HD07interview3.eaf` (more on what file names mean in the [next section](#where-apls-transcripts-come-from)):

![A partial screenshot from Google Chrome (as it appeared in 2024), showing the page https://apls.pitt.edu/labbcat/transcript?transcript=HD07interview3.eaf and a single line of dialogue from speaker "HD07". Three lines of information are shown. The first is a black bracket encompassing the entire line with the label "6.5068"; the second shows symbols "UH CC PRP VBD TO VB DT NN VBN IN PRP VBP RB VB DT NN NN"; and the third shows "yeah and I used to get the Trib delivered 'cause I don't like the Post Gazette". At the end of the second line, a cursor is hovering over the text "NN" with a tooltip "part_of_speech - utterance at 7.92 for 3.2900000000000001s - click for menu" ](assets/img/demo-page.png)
<!-- A better screen-grab would: (a) be narrower (not take up as much x-axis real estate), (b) be from a line that doesn't have an annoying duration -->

Each transcript is on its own page in APLS, as shown in the browser address bar.
<!-- PARTICIPANTS, LAYERS, ANNOTATIONS -->


### Where APLS transcripts come from

The transcripts in APLS come from one-on-one [sociolinguistic interview](https://languageandlife.org/about-sociolinguistics/) fieldwork conducted in 2003--2005 with native Pittsburghers in four Pittsburgh neighborhoods: the Hill District (abbreviated `HD` in APLS), Lawrenceville (`LV`), Forest Hills (`FH`), and Cranberry Township (`CB`).[^neighborhood]
These interviews typically consisted of [several sections](https://ecampusontario.pressbooks.pub/essentialsoflinguistics2/chapter/10-5-variationist-methods-and-concepts): a long conversation (including chatter about "Pittsburghese" and/or African American English), 1--2 reading tasks, and a minimal pairs task;
not all interviews had all of these sections.
Finally, APLS includes just a subset of the audio files from this fieldwork: those that had only one main participant, who is a native of the Pittsburgh area, and who explicitly consented to make their data publicly available.

[^neighborhood]: In keeping with Pittsburgh parlance, we use _neighborhood_ to encompass geographic areas inside or outside Pittsburgh city limits. Two of these neighborhoods are in city limits (Lawrenceville, the Hill District). Forest Hills is a borough within Allegheny County, and Cranberry Township is a township just outside Allegheny County. 


Interviewees in APLS are identified by an anonymized <span class="keyterm">speaker code</span> that includes their neighborhood abbrevation (e.g., `CB01`, `HD17`).
Interviews are divided into several transcripts (corresponding to the original tape files), named after the speaker and interview section.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee FH10.[^eaf]
Some interview sections are split into multiple transcripts (e.g., `interview1`, `reading2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan](https://archive.mpi.nl/tla/elan).


<!-- Then the data was transcribed in Elan and Praat -->





Do the following: 

1. Sign up for a user account [here](https://docs.google.com/forms/d/e/1FAIpQLSdFclWfbWZ-aM-h3Givrr4mH9T4MjyWaeQ-TpTMriC5mOcoqw/viewform){: target="_blank"}
1. Read the [APLS 101 page](doc/apls-101)
1. Try your hand at the [/aw/ monophthongization case study](doc/apls-101#case-study)
1. Explore the other pages in this section, and/or poke around on APLS and see what you can learn!

