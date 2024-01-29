---
title: Transcription
layout: default
permalink: /doc/transcription
has_children: yes
has_toc: no
last_modified_date: 2024-01-29T16:33:01-05:00
---

# {{ page.title }}
{:.no_toc}

Before audio data can be uploaded to APLS, it must first be **transcribed** by human transcribers, according to APLS's [transcription convention](transcription-convention).
Transcriptions consist of annotations synced to **turns** ranging in duration from 0 to 10 seconds, typically in the `.eaf` ([Elan](https://archive.mpi.nl/tla/elan)) or `.TextGrid` ([Praat](http://www.fon.hum.uva.nl/praat/)) file formats.
These turns exist on several **tiers**: one for each speaker (typically just interviewee and interviewer), plus special tiers representing non-speaker noises, transcriber comments, and stretches of speech that should be redacted.

In order to facilitate large-scale processing of speech data through the **LaBB-CAT** corpus analysis tool that powers APLS, annotations on speaker tiers are mostly orthographic.
For example, whereas some transcription conventions require explicit annotations of details such as speech rate or pauses, LaBB-CAT can be programmed to automatically annotate these details.
To the extent possible, APLS transcribers attempt to separate the act of transcription from that of **coding** (socio)linguistic variation.
For example, the English _-ing_ ending is transcribed as `ing`, regardless of whether it is pronounced [ɪŋ] or [ɪn].
The avoidance of "coding while transcribing" not only makes transcription faster, it more importantly facilitates specifying the search context for linguistic patterns once the transcription is uploaded to APLS (e.g., when searching for _-ing_ tokens, the end-user only has to look for /ɪŋ/, rather than both [ɪŋ] and [ɪn]).

In instances where transcribers do need to specify phonemic representations (e.g., novel words or hesitations), they do so using the **DISC phonemic alphabet**.
APLS's [DISC specification](phonemic-transcription) is based on the original DISC spec from CELEX (see [English lexicon user's guide](https://catalog.ldc.upenn.edu/docs/LDC96L14/eug_let.pdf), pp. 31--32).
Both specs use ASCII characters exclusively while maintaining a one-to-one mapping between symbols and English phonemes.
APLS uses DISC to represent phonological layers internally, and end-users use DISC to perform searches on phonological layers.

Most transcriptions were created by undergraduate research assistants at Pitt who had undergone several weeks of training, including feedback and corrections.
Some transcriptions were initially created by undergraduate students at Pitt and Swarthmore College as part of class assignments, then extensively hand-checked and corrected by trained research assistants.
In some cases, transcribers used AI tools to assist with different transcription tasks: [CLOx](https://clox.ling.washington.edu/#/) or [Batchalign](https://github.com/TalkBank/batchalign) for speech annotation, [pyannote](https://github.com/pyannote/pyannote-audio) for segmentation;
transcribers hand-checked and corrected any AI predictions.
As of 2024, transcribers were primarily using a combination of Batchalign annotation filled into pyannote segmentation via a purpose-built [Shiny app](https://djvill.shinyapps.io/fill-batchalign-words/).
In rare cases, there existed pre-existing transcriptions that transcribers translated to the APLS convention.
Most transcriptions were initially created in Elan, with some created in Praat.
Transcriptions were all checked via a purpose-built [Shiny app](https://djvill.shinyapps.io/apls_elan_file_checker/) to ensure files were well-formatted.
