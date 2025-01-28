---
title: Citing and contributing back
layout: default
permalink: /doc/citing-contributing
parent: How to use APLS
nav_order: 70
last_modified_date: 2025-01-28T16:54:20-05:00
---

# {{ page.title }}
{:.no_toc}

**If you use APLS, please [cite it](#citing-apls)!**
Studies show that research software is under-cited. <!-- Add cites -->
Not citing research software makes it hard for creators to gauge how often it's used, understand how to improve it, or get credit when others use it.
(Citing APLS is also part of APLS's [terms of use](terms#citation).)

In addition, if you use APLS in published research, you may be obligated <!-- wording --> to [contribute back](#contributing-back) to the corpus so future fellow users can benefit.
Our goal is to make contributing back as seamless as possible.

{% include page_toc.html collapsible=true %}

## Citing APLS

Please select the version of APLS you used.
If you downloaded any CSV files, the first column should contain the APLS version.

<!-- Version dropdown selector -->

### Citation manager files

| Citation manager | File (click to download) |
|------------------|--------------------------|
| BibTeX           | Link                     |
| Zotero           | BibTeX link              |
| EndNote          | Link                     |

### Formatted bibliographic entries

| Style | Bibliographic entry (click to copy) |
|-------|--------------------------|
| [Unified stylesheet for linguistics](https://www.linguisticsociety.org/sites/default/files/style-sheet_0.pdf) | Formatted |
| [APA 7th edition](https://owl.purdue.edu/owl/research_and_citation/apa_style/apa_style_introduction.html) | Formatted |

## Contributing back

<!-- I should really have a "how did you use APLS?" form. A lot of the implementation details for contributing-back (e.g., coverage) can be relegated to that. And then I can make it "we'll reach out to you"-based rather than "you have to submit this whole big thing"-based -->

APLS is a community effort.
If you've used APLS in published or ongoing research, you may be obligated <!-- wording --> to contribute back to the corpus.
We're here to help you contribute back to APLS! 
Simply fill out the ["How did you use APLS?" form](LINK), and we'll contact you with more information about next steps.


### What we're looking for

This covers two main cases:

- Adding annotations to your own downloaded version of APLS data
	- Note: This doesn't have to cover the whole corpus, a whole speaker, or even a whole transcript
	- Examples:
		- Coding tokens of a sociolinguistic variable
		- Tagging stretches of interview speech for stances or topics
		- Identifying ideal formant-measurement settings for particular tokens
		- Generating [gradient predictions](https://www.journal-labphon.org/article/id/6264/) of auto-coded variables
		- Grouping participants into class categories based on education and occupation <!-- Link to participant attributes page/section -->
- Correcting issues in current annotations
	- This could cover either [human-generated or computer-generated](data-sources#humans-and-computers) <!-- check heading link later --> annotations
	- Examples:
		- Identifying transcription errors, or identifying correct transcriptions for passages marked `[unclear]`
		- Correcting morphemic parses or segmental alignments
		- Running part-of-speech tagging through a different POS algorithm of your choice

<!-- is this too many examples? -->

In addition, we welcome:

- Any feedback on APLS's user interface (the corpus itself or this website)
- Requests for particular features
- Calling our attention to something that needs [troubleshooting](troubleshooting)


However, you are _not_ obligated <!-- wording --> to contribute back to the corpus if you use APLS data:

- To create stimuli for perceptual/experimental research
- To train some sort of language model
	- Exception: The model results in some annotations of existing APLS data that you can contribute back
- To inform fieldwork methods in Pittsburgh or other places
- Completely 'as is' without any further annotations or corrections


### Why contribute back to APLS?

If you're in a position to contribute back to APLS, then please note that the [terms of use](terms) technically obligate <!-- wording --> you to do so.
More importantly, we think it's the right thing to do, since you can save future researchers the time and effort of reinventing the wheel---it's why we try to make it as easy as possible for researchers to contribute back.
<!-- Maybe mention some Open Methods-y stuff here -->
As with other forms of Open Methods, contributing back helps to encourage contributors to adopt reproducible research practices.
Finally, if your contribution gets accepted, your name gets added to APLS's [contributors page](contributors)---a feather in your cap!
