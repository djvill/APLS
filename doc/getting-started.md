---
title: Getting started
layout: default
permalink: /doc/getting-started
nav_order: 10
last_modified_date: 2024-10-15T14:54:57-04:00
---

# {{ page.title }}
{:.no_toc}

APLS contains sound files alongside annotations that allow us to treat these audio files as structured linguistic data.
Once you have an [APLS login](#sign-up), you can access APLS through your browser at <https://apls.pitt.edu/labbcat>.[^r-python]
<!-- APLS works just like any other webpage: you can use the back/forward buttons to navigate, create bookmarks, load multiple pages in tabs, etc. -->

[^r-python]: Advanced users can also access APLS via the [`nzilbb.labbcat` package](https://nzilbb.github.io/labbcat-R/) for R, or the [`nzilbb-labbcat` library](https://nzilbb.github.io/labbcat-py/) for Python. These packages have most of the functionality of the browser-based graphical user interface (https://apls.pitt.edu/labbcat), with some added benefits such as reproducibility (e.g., a particular set of [search]({{ '/doc/search' | relative_url }}) criteria can be encoded in R/Python code rather than described for copy/paste). Even if you plan to mostly use these interfaces, however, it's a good idea to learn the browser-based GUI first, as it will help you build an intuitive sense for how APLS data is organized.

{% include page_toc.html collapsible=true open=true %}


## Where APLS audio data comes from

APLS contains audio recordings of one-on-one [sociolinguistic interviews](https://languageandlife.org/about-sociolinguistics/) from fieldwork conducted in 2003--2005 with native Pittsburghers in four Pittsburgh neighborhoods: the Hill District (abbreviated `HD` in APLS), Lawrenceville (`LV`), Forest Hills (`FH`), and Cranberry Township (`CB`).[^neighborhood]
These interviews typically consisted of [several sections](https://ecampusontario.pressbooks.pub/essentialsoflinguistics2/chapter/10-5-variationist-methods-and-concepts): a long conversation (including chatter about "Pittsburghese" and/or African American English), 1--2 reading tasks, and a minimal pairs task;
not all interviews had all of these sections.

[^neighborhood]: In keeping with Pittsburgh parlance, we use _neighborhood_ to encompass geographic areas inside or outside Pittsburgh city limits. Technically, only the Hill District and Lawrenceville are within city limits. Forest Hills is a borough within Allegheny County, and Cranberry Township is a township just outside Allegheny County. In the original fieldwork, these sites were chosen to reflect a distinction (between inner-city, inner-ring suburb, and outer-ring suburb) that shows up in some classic sociolinguistic literature ([Bailey diffusion], [Eckert 2000])

APLS includes just a subset of the audio files from this fieldwork.
All interviewees in APLS are natives of the Pittsburgh area, and all interviewees consented to make their data publicly available.
In addition, APLS currently contains only files that had just one interviewee.


## Basic organization

APLS data is organized using the data structures provided by the open-source linguistic corpus software [LaBB-CAT][].
The most important organizational units in LaBB-CAT corpora are <span class="keyterm">annotations</span>, <span class="keyterm">transcripts</span>, <span class="keyterm">participants</span>, and <span class="keyterm">layers</span>.

- **Annotations** are individual bits of data aligned to specific timestamps in audio files.
- **Transcripts** hold data for a single audio file and all of its annotations, plus metadata like when the audio file was recorded.
- **Participants** are speakers, plus metadata like demographic info.
- **Layers** are series of time-aligned annotations in transcripts corresponding to a single type of linguistic data (e.g., pronunciations, part-of-speech tags).


### Participants and transcripts

The **participants** in APLS are the interviewees, the interviewers, and occasionally a bystander whose speech is captured in the recording.
Interviewees in APLS are identified by an anonymized <span class="keyterm">speaker code</span> that includes their neighborhood abbrevation (e.g., `CB01`, `HD17`).

Interviews are divided into several **transcripts** (corresponding to the original recording files), named after the interviewee and interview section.
For example, the file `FH10pairs.eaf` contains the minimal pairs task from the interviewee FH10.[^eaf]
Some interview sections are split into multiple transcripts (e.g., `interview1`, `reading2`).

[^eaf]: The `.eaf` part of the transcript name reflects the original transcript file, which was created in the transcription program [Elan](https://archive.mpi.nl/tla/elan).


### Annotations and layers

To illustrate **annotations** and **layers** in APLS, below is a screen-grab of a single <span class="keyterm">line</span> of speech from the transcript `HD07interview3.eaf`:
![A partial screenshot from Google Chrome (as it appeared in 2024), showing the page https://apls.pitt.edu/labbcat/transcript?transcript=HD07interview3.eaf and a single line of dialogue from participant HD07. Three lines of information are shown. The first is a black bracket encompassing the entire line with the label "6.5068"; the second shows symbols "UH CC PRP VBD TO VB DT NN VBN IN PRP VBP RB VB DT NN NN"; and the third shows "yeah and I used to get the Trib delivered 'cause I don't like the Post Gazette". At the end of the second line, a cursor is hovering over the text "NN" with a tooltip "part_of_speech - utterance at 7.92 for 3.2900000000000001s - click for menu"]({{ '/assets/img/demo-page.png' | relative_url }}){: .screengrab }
<!-- A better screen-grab would: (a) be narrower (not take up as much x-axis real estate), (b) be from a line that doesn't have an annoying duration -->


Let's break down what we can see:

- On the left-hand side is `HD07`, the participant who uttered this line.
- To the right of this speaker code are three layers. From bottom to top, these are <span class="layer">word</span>, <span class="layer">part_of_speech</span>, and <span class="layer">speech_rate</span>.
  - <span class="layer">word</span> layer (bottom):
    - This layer contains the words that HD07 spoke, spelled in normal English.
    - Each word has a single annotation on the <span class="layer">word</span> layer.
  - <span class="layer">part_of_speech</span> layer (middle):
    - This layer encodes each word's part of speech in [symbols developed for the Penn Treebank]({{ '/doc/notation-systems#penn-treebank-pos-tags' | relative_url }}) project (e.g., `UH` for interjections, `CC` for coordinating conjunctions).
    - Most words have a single <span class="layer">part_of_speech</span> annotation. The word _don't_ has two annotations (`VBP RB`), since consists of both a present-tense verb (_do_) and an adverb (_not_).
  - <span class="layer">speech_rate</span> (top)
    - This layer contains a measurement (in syllables per second) of how quickly HD07 uttered this line
    - Because APLS measures the speech rate over an entire line of the transcript, there is just one <span class="layer">speech_rate</span> annotation for this line (as indicated by the curved bracket).
- The cursor is hovering over the `NN` annotation, bringing up a tooltip with several pieces of information:
  - The selected annotation is on the <span class="layer">part_of_speech</span> layer
  - This annotation is part of a line (aka an <span class="layer">utterance</span>) that begins at 7.92 seconds into the transcript and lasts around 3.29 seconds
  - There's a [menu]({{ '/doc/view-transcript#word-menu' | relative_url }}) that can be brought up by clicking on the annotation


## From audio data to APLS

To get an audio file into APLS, it is first [transcribed]({{ '/doc/transcription' | relative_url }}) by a research assistant according to a specific set of conventions that facilitate analysis in LaBB-CAT.
(This takes a **ton** of time and effort!)
The transcription file is then uploaded with its audio file to APLS, where it is converted into an APLS transcript.
APLS generates numerous layers for the transcript, based on dictionaries for looking up representations of words (e.g., morphological parses), machine learning models (e.g., the [Hidden Markov Toolkit][htk] for determining time-alignments of individual speech sounds), and/or other layers.
Finally, participant and transcript metadata is uploaded to APLS.


## Navigating documentation site

We'll get into navigating APLS itself once you have a [user account](#sign-up).
In the meantime, here are some tips for navigating this documentation site.


### Special formatting and links

To help you keep APLS terminology straight, key terms are formatted like so (<span class="keyterm">annotation</span>), with links to corresponding entries in the [glossary]({{ '/doc/glossary' | relative_url }}).
Likewise, there's an extensive [layer reference]({{ '/doc/layer-reference' | relative_url }}), with layers formatted like so (<span class="layer">orthography</span>).
The symbol <!-- SVG ext --> denotes an external link (i.e., a link that's not to a documentation page or an APLS page), like so ([LaBB-CAT][]).
`Fixed-width text` is used for something you actually type into APLS, and _italic text_ is used for anything you might click on in APLS (a menu option, a link, etc.).


### Navigation across and within pages

You can browse through pages in the left-hand navigation pane.
<!-- If you're viewing this site on a mobile device, you can click = to bring up the navigation -->
Most pages have a collapsible table of contents toward the top of the page.
All headings in the text of a page have a unique permalink; 
you can copy this permalink by hovering over the heading and clicking the link icon (<!-- SVG link -->).
In the top bar, you can search the documentation (you can type the `/` key to move your cursor to the search bar without clicking), suggest edits to pages on GitHub, and toggle between light mode and dark mode.


### Callout boxes

Throughout these pages are collapsible "callout" boxes to help you understand how to use APLS and how it works.
Green "Try it!" boxes give you step-by-step instructions on doing some task in APLS.
Blue "Under the hood" boxes give some details about technical details, design decisions, and/or the history of APLS's development.
For example:

{: .try-it }
> Even if you don't have an APLS login yet, you can still load the page in your browser.
>
> Go to https://apls.pitt.edu/labbcat.
> You should see a login box pop up:
> <!-- SCREEN GRAB login box -->

{: .under-the-hood }
> APLS's original URL was https://labb-cat.linguistics.pitt.edu/labbcat.
> But the https://apls.pitt.edu/labbcat URL was chosen as an alias because it's shorter, easier to remember, and less prone to typos.


<!-- ## Terms of use -->

## Sign up

<!-- Crib from the Google Form -->

<!-- Possibly embed the Google Form -->

Ready to get started with APLS? Sign up for a user account [here](https://docs.google.com/forms/d/e/1FAIpQLSdFclWfbWZ-aM-h3Givrr4mH9T4MjyWaeQ-TpTMriC5mOcoqw/viewform){: target="_blank"}.

Once you log in for the first time, you'll see a prompt to reset your temporary password.
If you forget your password, fill out this form: 

