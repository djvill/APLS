---
title: Getting started
layout: default
permalink: /doc/getting-started
nav_order: 10
last_modified_date: 2024-10-09T12:00:35-04:00
---

# {{ page.title }}
{:.no_toc}

This page contains some background information on APLS that will help you get started.

{% include page_toc.html collapsible=true open=true %}


## APLS 101

APLS contains sound files alongside annotations that allow us to treat these audio files as structured linguistic data.
If you are familiar with other corpora powered by [LaBB-CAT](https://sourceforge.net/projects/labbcat/), then a lot of how APLS works will be familiar to you.


The most important organizational units in corpora like APLS are **annotations**, **transcripts**, **participants**, and **layers**:

- **Annotations** are individual bits of data aligned to specific parts of audio files.
- **Transcripts** hold data for a single audio file and all of its annotations, plus metadata like when the transcript was conducted.
- **Participants** are speakers, plus metadata like demographic info.
- **Layers** are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).


The transcripts in APLS come from one-on-one [sociolinguistic interview](https://languageandlife.org/about-sociolinguistics/) fieldwork conducted in 2003--2005 with native Pittsburghers in four Pittsburgh neighborhoods: the Hill District (abbreviated `HD` in APLS), Lawrenceville (`LV`), Forest Hills (`FH`), and Cranberry Township (`CB`).[^neighborhood]
These interviews typically consisted of several sections: a long conversation (including chatter about "Pittsburghese" and/or African American English), 1--2 reading tasks, and a minimal pairs task;
not all interviews had all of these sections.
Finally, APLS includes just a subset of the audio files from this fieldwork: those that had only one main speaker, who is a native of the Pittsburgh area, and who explicitly consented to make their data publicly available.

[^neighborhood]: In keeping with Pittsburgh parlance, we use _neighborhood_ to encompass geographic areas inside or outside Pittsburgh city limits. Two of these neighborhoods are in city limits (Lawrenceville, the Hill District). Forest Hills is a borough within Allegheny County, and Cranberry Township is a township just outside Allegheny County. 


In APLS, each interview is divided into several transcripts (corresponding to the original tape files).
Transcripts are named after the **main participant** of that transcript, using their anonymized **speaker code**, as well as the **transcript type**.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee _FH10_.[^eaf]
Some interview sections are split into multiple transcripts (e.g., `interview1`, `interview2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan](https://archive.mpi.nl/tla/elan).




Do the following: 

1. Sign up for a user account [here](https://docs.google.com/forms/d/e/1FAIpQLSdFclWfbWZ-aM-h3Givrr4mH9T4MjyWaeQ-TpTMriC5mOcoqw/viewform){: target="_blank"}
1. Read the [APLS 101 page](doc/apls-101)
1. Try your hand at the [/aw/ monophthongization case study](doc/apls-101#case-study)
1. Explore the other pages in this section, and/or poke around on APLS and see what you can learn!

