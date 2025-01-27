---
title: Where APLS data comes from
layout: default
permalink: /doc/data-sources
parent: About APLS
nav_order: 20
last_modified_date: 2025-01-23T16:07:57:z
---

# {{ page.title }}
{:.no_toc}

{% include page_toc.html collapsible=true %}

<!-- PSSP -->

<!-- What humans do, what computers do -->

## Where APLS audio data comes from

APLS contains audio recordings of one-on-one [sociolinguistic interviews](https://languageandlife.org/about-sociolinguistics/) from fieldwork conducted in 2003--2005 with native Pittsburghers in four Pittsburgh neighborhoods: the Hill District (abbreviated `HD` in APLS), Lawrenceville (`LV`), Forest Hills (`FH`), and Cranberry Township (`CB`).[^neighborhood]
These interviews typically consisted of several sections (though not all interviews had all of these):

- A long conversation
  - Sometimes including chatter about "Pittsburghese" and/or African American English
- 1--2 reading tasks
- A [minimal pairs task](https://ecampusontario.pressbooks.pub/essentialsoflinguistics2/chapter/10-5-variationist-methods-and-concepts/)

[^neighborhood]: In keeping with Pittsburgh parlance, we use _neighborhood_ to encompass geographic areas inside or outside Pittsburgh city limits. Technically, only the Hill District and Lawrenceville are within city limits. Forest Hills is a borough within Allegheny County, and Cranberry Township is a township just outside Allegheny County. In the original fieldwork, these sites were chosen to reflect a distinction (between inner-city, inner-ring suburb, and outer-ring suburb) that shows up in some classic sociolinguistic literature (e.g., [Bailey et al. 1993](https://doi.org/10.1017/S095439450000154X), [Eckert 2000](https://www.wiley.com/en-us/Language+Variation+as+Social+Practice%3A+The+Linguistic+Construction+of+Identity+in+Belten+High-p-9780631186038))

APLS includes just a subset of the audio files from this fieldwork.
All interviewees in APLS are natives of the Pittsburgh area, and all interviewees consented to make their data publicly available.
In addition, APLS currently contains only files that had just one interviewee.


## From audio data to APLS

The audio files in APLS have been [transcribed]({{ '/doc/transcription' | relative_url }}) by research assistants according to a specific set of conventions that facilitate analysis in LaBB-CAT.
(This takes a **ton** of time and effort!)
After a transcription file is uploaded with an audio file to APLS, APLS generates numerous layers for the transcript, using dictionaries with compositional representations of words (e.g., morphological parsing), machine learning models (e.g., the [Hidden Markov Toolkit][htk] for determining time-alignments of individual speech sounds), and other techniques.
Additionally, metadata about the participant and the transcript are uploaded to APLS.

{% include page_toc.html collapsible=true %}