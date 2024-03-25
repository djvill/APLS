---
title: How to use APLS
layout: default
permalink: /doc/how-to-use
has_children: yes
has_toc: no
nav_order: 10
last_modified_date: 2024-03-25T14:56:07-04:00
---

# {{ page.title }}
{:.no_toc}

These pages are a reference on all things APLS.

If you haven't done so yet, please sign up for a user account [here](https://docs.google.com/forms/d/e/1FAIpQLSdFclWfbWZ-aM-h3Givrr4mH9T4MjyWaeQ-TpTMriC5mOcoqw/viewform){: target="_blank"}.
We recommend reading this page first, then you can browse through the pages in this section.
If you are familiar with other corpora powered by [LaBB-CAT](https://sourceforge.net/projects/labbcat/), then a lot of how APLS works will be familiar to you.

{% include page_toc.html collapsible=true %}


## Basic organization

The most important organizational units in [LaBB-CAT](https://sourceforge.net/projects/labbcat/) corpora like APLS are **transcripts**, **participants**, and **layers**:

- **Transcripts** hold data for a single audio file and all of its annotations.
- **Participants** are speakers and their metadata like demographic info.
- **Layers** are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).

The transcripts in APLS come from one-on-one [sociolinguistic interviews](https://languageandlife.org/about-sociolinguistics/) conducted in 2003--2005 with native Pittsburghers in four Pittsburgh neighborhoods: the Hill District, Lawrenceville, Forest Hills, and Cranberry Township.[^neighborhood]
(These neighborhoods correspond to the abbreviations _HD_, _LV_, _FH_, and _CB_.)
These interviews typically consisted of a long conversation (including chatter about "Pittsburghese" and/or African American English), 1--2 reading tasks, and a minimal pairs task;
not all interviews had all of these sections.

[^neighborhood]: In keeping with Pittsburgh parlance, we use _neighborhood_ to encompass geographic areas inside or outside Pittsburgh city limits. Two of these neighborhoods are in city limits (Lawrenceville, the Hill District), while Forest Hills is a borough in Allegheny County and Cranberry Township is a township just outside Allegheny County. 

In APLS, each interview is divided into several transcripts (corresponding to the original tape files).
Transcripts are named after the **main participant** of that transcript, using their anonymized **speaker code**, as well as the **transcript type**.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee _FH10_.[^eaf]
Some interview tasks are split into multiple transcripts (e.g., `interview1`, `interview2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan](https://archive.mpi.nl/tla/elan).


## Navigation

You'll see the following in the navigation bar at the top of each page:

- Your username: Change your password
- home: The homepage
- search: Search for annotations (e.g., individual words, phonemes)
- upload: Upload search results to get more data (e.g., extracting a list of audio clips)
- participants: View information on participants
- transcripts: Browse transcripts
- dictionaries: Get information from dictionaries such as the CELEX lexical database
- documentation: Basic information on the corpus

