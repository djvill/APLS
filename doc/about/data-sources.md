---
title: Where APLS data comes from
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/data-sources
parent: About APLS
nav_order: 20
last_modified_date: 2025-07-08T15:46:12-04:00
---

# {{ page.title }}
{:.no_toc}

{% include page_toc.html collapsible=true %}

<!-- What humans do, what computers do -->

## Sociolinguistic fieldwork

The audio files in APLS come from sociolinguistic fieldwork conducted in Pittsburgh in 2003--2005 by Barbara Johnstone and Scott Kiesling.
For more information on this fieldwork, see [this page]({{ '/doc/pittsburgh-interviews' | relative_url }}) 


## From audio data to APLS

The audio files in APLS have been [transcribed]({{ '/doc/transcription' | relative_url }}) by research assistants according to a specific set of conventions that facilitate analysis in LaBB-CAT.
(This takes a **ton** of time and effort!)
After a transcription file is uploaded with an audio file to APLS, APLS generates numerous layers for the transcript, using dictionaries with compositional representations of words (e.g., morphological parsing), machine learning models (e.g., the [Hidden Markov Toolkit][htk] for determining time-alignments of individual speech sounds), and other techniques.
Additionally, metadata about the participant and the transcript are uploaded to APLS.

{% include linklist.html %}
