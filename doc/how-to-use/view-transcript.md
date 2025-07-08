---
title: Viewing a transcript
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/view-transcript
parent: How to use APLS
has_children: yes
has_toc: no
nav_order: 20
last_modified_date: 2025-07-08T15:45:25-04:00
---

# {{ page.title }}
{:.no_toc}

A <span class="keyterm">transcript</span> is a collection of <span class="keyterm">annotations</span> on numerous <span class="keyterm">layers</span> corresponding to a single audio file, plus <span class="keyterm">transcript attributes</span> like when the audio file was originally recorded.
In APLS, each transcript has a single <span class="keyterm">main participant</span> and corresponds to a section of that participant's sociolinguistic interview.
Each transcript has its own <span class="apls-page">Transcript</span> page in APLS.

{: .note .no-collapse }
> On this page, we use the term _transcript_ for the underlying data in the APLS corpus, and _<span class="apls-page">Transcript</span> **page**_ for the webpage you can use to view transcript data.

Because the <span class="apls-page">Transcript</span> page provides the most easily digestible view of how data is organized in APLS, we'll discuss a lot of data-organization concepts on this documentation page (especially in the section on [viewing layer data](#viewing-layer-data)).
If you need a refresher on the basics, check out the [Data organization in LaBB-CAT]({{ '/doc/data-organization' | relative_url }}) page.

{: .try-it .no-collapse }
> As we'll cover [below](#accessing-transcript-pages), there are a few ways to access individual <span class="apls-page">Transcript</span> pages.
> The easiest is the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}) at <https://apls.pitt.edu/labbcat/transcripts>. 
> Go to that page and select a transcript to view.

{% include page_toc.html collapsible=true %}

## What you can do on the <span class="apls-page">Transcript</span> page

- [Read](#reading-the-transcript) the transcript
- Follow along with the transcript as you [listen](#listening-to-the-transcript)
- [Navigate](#navigating-to-other-transcripts) to other transcripts in the same interview
- View annotations on different [layers](#viewing-layer-data)
- Create [permalinks](#creating-permalinks) for individual lines or words in the transcript
- View the transcript's [attributes](#viewing-transcript-attributes)
- Find more information on [participants](#viewing-participant-information) in the transcript
- [Search](#searching-the-transcriptparticipants) the transcript or its participants for linguistic patterns
- [Download](#downloading-audio) the transcript audio in wav or mp3 formats
- [Export](#exporting-the-transcript) the entire transcript to various file formats
- [Open](#opening-utterances-in-praat) individual lines of the transcript in [Praat]

<!-- Maybe move "Accessing" here as "How to get there", though the section is kinda long -->


### Page layout

Individual <span class="apls-page">Transcript</span> pages have two sections, plus some elements that stay in the same place as you scroll down the page.
This is highlighted in the following image, which displays the top of the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`:

{% include screengrab.html src="transcript/overview.png" %}

- The <span class="keyterm">transcript body</span> (highlighted in **red**{:.hl-1} above), which continues all the way down the page. This is where you can...
  - [Read](#reading-the-transcript) the transcript
  - View annotations on different [layers](#viewing-layer-data)
  - Follow along with the transcript as you [listen](#listening-to-the-transcript)
- The <span class="keyterm">transcript header</span> (highlighted in **blue**{:.hl-2} above). The expandable tabs each have their own function:
  - _Attributes_: View the transcript's [attributes](#viewing-transcript-attributes)
  - _Participants_: Find more information on [participants](#viewing-participant-information) in the transcript
  - _Layers_: Select which [layers](#selecting-layers-to-display) to display in the transcript body
  - _Search_: [Search](#searching-the-transcriptparticipants) the transcript or its participants for linguistic patterns
  - _Export_: [Export](#exporting-the-transcript) the entire transcript to various file formats
- The <span class="keyterm">media player</span> (highlighted in **green**{:.hl-3} above), which stays in the same place as you scroll down the page. This is where you can:
  - [Listen](#listening-to-the-transcript) to the transcript
  - [Download](#downloading-audio) the transcript audio in wav or mp3 formats
- The <span class="keyterm">navigation arrows</span> (highlighted in **purple**{:.hl-4} above). This is where you can:
  - [Navigate](#navigating-to-other-transcripts) to other transcripts in the same interview


#### Word menu
{: .no_toc}

Not displayed in the image above is the <span class="keyterm">word menu</span>.
This pops up when you click on a word in the transcript body.
Some of the functions in the word menu require [installing the Praat integration]({{ '/doc/praat-integration' | relative_url }}).
Here's what the word menu looks like without the Praat integration (left) or with it (right):

{% include screengrab.html src="transcript/word-menu-comp.png" %}

The word menu is where you can...

- Create [permalinks](#creating-permalinks) for individual lines or words in the transcript
- [Play](#listening-to-the-transcript) individual lines of the transcript
- [Download](#downloading-audio) audio for individual lines
- [Open](#opening-utterances-in-praat) individual lines in [Praat] (if you've install the Praat integration)

<!-- Maybe also "what you can't do": view precise timings, view every single annotation (if vertical peers), search (no ctrl-f) -->


## Reading the transcript

The transcript body displays the content of the transcript over time.
For example, here's the first few lines of `CB01interview3.eaf`:

{% include screengrab.html src="transcript/body.png" %}

Every line in the transcript corresponds to a conversational turn or continuous utterance in the audio recording. 
The participant who is speaking in a particular turn is shown in italic gray text above the turn.
In the example above, the interviewer Barbara Johnstone is speaking in the first turn.
If there's overlapping speech, participants' turns are shown side-by-side;
this is the case in the second line above, where Barbara Johnstone and CB01 overlap one another.
Bold text is used for CB01's words and the `CB01` speaker code, since CB01 is the <span class="keyterm">main participant</span> in this transcript (that is, the interviewee).
Finally, the text in magenta italics represents noises, whether produced by a participant (e.g., breathing, smacking lips) or not (e.g., banging, car horns). <!-- Mention `unclear` here? -->

When you're reading the transcript, you'll also notice some bits of punctuation in participants' turns:

- `.` for short pauses, `-` for long pauses
- `?` for questions or question intonation
- `~` for an incomplete or hesitated word
- `___` for redactions

{: .note}
> Decisions about what counts as a pause, what is an incomplete word, and what should be redacted are made by trained transcribers in accordance with the [APLS transcription convention]({{ '/doc/transcription-convention' }}).

One thing you **won't** notice are periods for the end of sentences.
Although we're used to breaking up written language into sentences, this is actually not that common in normal spontaneous speech.

As we'll discuss [below](#viewing-layer-data), this isn't a typical transcript like you might see in other contexts---it's <span class="keyterm">annotations</span> on <span class="keyterm">layers</span>.


## Listening to the transcript

You can listen to the transcript audio using the media player at the top right of the screen (highlighted in **green**{:.hl-3} below):

{% include screengrab.html src="transcript/player-playing.png" %}

The media player works just like you'd expect.
You can play and pause, click on the progress bar to jump to a timestamp, adjust or mute the volume, and (depending on your browser) adjust the playback speed.
Once you start playing audio, a {% include labbcat-icon.html src="media-skip-backward.svg" %} button will appear that rewinds the audio by 1 second per click.
As the image shows, while the audio is playing, the transcript body will highlight the line that you're hearing.

{: .note .no-collapse}
> These screenshots were taken from Google Chrome.
> Your media player may look a little different if you have a different browser.

If you click on the progress bar, the transcript body will also scroll up or down to display the part of the transcript corresponding to that timestamp.

You can also play an individual line of the transcript through the [word menu](#word-menu): click on any word in the line, then click _Play_.
The audio will stop at the end of the line, but you can click the play button on the media player to continue.

{% include screengrab.html src="transcript/no-praat-word-menu-context.png" %}


There are two other parts of the media player that we cover below (since they're not related to listening to the transcript):

- The _mp3_ and _wav_ links, which [download](#downloading-audio) the audio file in those file formats
- The {% include labbcat-icon.html src="text-praat-textgrid.png" %} icon, which is related to the [Praat integration]({{ '/doc/praat-integration'}})


## Navigating to other transcripts

The <span class="keyterm">navigation arrows</span> (highlighted in **purple**{:.hl-4} below) allow you to move to the previous or next transcript in the interview.
These arrows are hidden if you are looking at the first or last transcript in the interview.

{% include screengrab.html src="transcript/nav-arrows.png" %}

{: .try-it }
> On the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`, click the "previous" button.
> This will load the <span class="apls-page">Transcript</span> page for `CB01interview2.eaf`.
> Then, click the "next" button to go back to `CB01interview3.eaf`.

To view transcripts _not_ in the same interview, visit the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}).


## Viewing layer data

### Everything you see is data

In APLS, everything you see in the transcript body is data: <span class="keyterm">annotations</span> on <span class="keyterm">layers</span>.
(These [data structures]({{ '/doc/data-organization' | relative_url }}) are what make APLS so powerful---it turns audio recordings into structured linguistic data, allowing us to search, export, and measure the entire corpus in a fraction of the time.)
Even when you think you're just [reading the transcript](#reading-the-transcript), you're actually viewing layer data!

When the <span class="apls-page">Transcript</span> page is first loaded, two layers are displayed in the transcript body: <span class="layer">word</span> (colored black) and <span class="layer">noise</span> (colored magenta).
Each turn consists of at least one annotation on either of these layers.
For example, some of the following turns consist of only <span class="layer">word</span> annotations, one consists of only a <span class="layer">noise</span> annotation, and some consist of both.

{% include screengrab.html src="transcript/word-noise.png" %}

You can customize which layers are displayed using the [layer picker](#selecting-layers-to-display), discussed below.
For example, here are the first few lines of `CB01interview3.eaf` again, now with the following layers selected: <span class="layer">speech_rate</span> (teal), <span class="layer">frequency_from_celex</span> (chocolate), <span class="layer">word</span> (black), and <span class="layer">segment</span> (lavender).

{% include screengrab.html src="transcript/multiple-layers.png" %}


### <span class="layer">turn</span>s and <span class="layer">utterance</span>s

There are actually two more layers that the transcript body displays implicitly: <span class="layer">turn</span> and <span class="layer">utterance</span>.
These layers divide up the timing of a transcript based on when participants are speaking.
A <span class="layer">turn</span> is the timespan that contains everything within a single ![]({{ '/assets/screengrab/transcript/turn-swoosh.png' | relative_url }}){:style="height:2em;"} shape.
<!-- Not quite -- an adjacent overlap can be part of the same turn -->
Each <span class="layer">turn</span> contains one or more <span class="layer">utterance</span>s, which are displayed as individual lines in the transcript.
Let's look at `CB01reading1.eaf` as an example:

{% include screengrab.html src="transcript/turns-utterances.png" %}

The first two <span class="layer">turn</span>s each contain one <span class="layer">utterance</span>.
The next two <span class="layer">turn</span>s each contain two <span class="layer">utterance</span>s.
The first <span class="layer">utterance</span> (_that's my ... Penn Mac_) in the third <span class="layer">turn</span> is long enough that the text wraps, but you can see that _that's_ is closer in height to _Mac_ than _Mac_ is to _it's_ (the first word of the next <span class="layer">utterance</span>).
If you ever need to figure out where an utterance begins or ends, you can use the word menu's [utterance permalink](#creating-permalinks) function to highlight the entire utterance, described below.

{: .under-the-hood}
> These layers are based on how transcribers chose to divide the original transcription files into lines.
> While this is subject to guidelines from the [APLS transcription convention]({{ '/doc/transcription-convention#segmentation' | relative_url }}), in practice there's room for variation between transcribers.
> When the transcription file is uploaded to APLS, the lines from the original transcript form the <span class="layer">utterance</span> layer.
> Then, <span class="layer">turn</span>s are formed by combining adjacent <span class="layer">utterance</span>s from the same participant.

Elsewhere in APLS, turns and utterances show up in [anchoring searches]({{ '/doc/anchoring-searches#scope' | relative_url }}), [exporting search results]({{ '/doc/export-data#exporting-data-from-the-search-results-page' | relative_url }}), and [phrase layers]({{ '/doc/layer-typology#scope' | relative_url }}).


### Annotation tooltips

More information about layers and annotations is available in tooltips, which pop up when you hover over different parts of the transcript body.
Here's what that looks like for the first line of `CB01interview3.eaf`, with the following layers selected: <span class="layer">speech_rate</span>, <span class="layer">frequency_from_celex</span>, <span class="layer">word</span>, and <span class="layer">segment</span>.

{% include screengrab.html src="transcript/tooltips.png" %}

Let's break down what we're seeing in these tooltips:

- <span class="layer">word</span> layer (3rd image from the top): information about the line (<span class="layer">utterance</span>). Specifically, the participant (here, `Barbara Johnstone`), the start/end times (`0.339-2.514`), and the duration (`(2.185s)`)
- All other layers: the layer name (`speech_rate`, `frequency_from_celex`, `segment`) and information about the annotation(s)
  - For example, the <span class="layer">speech_rate</span> for this line is 7.5117 syllables per second. This matches the `7.5117` annotation showing in the transcript body.

Those are the most important things you can see in the tooltip.
These tooltips also touch on some concepts that are covered later on this documentation page:

- <span class="layer">frequency_from_celex</span> shows `[2]`, followed by two different counts, `1775 836`
  - This means the word _individual_ has two [<span class="keyterm">peer</span>](#horizontal-and-vertical-peers) annotations on the <span class="keyterm">frequency_from_celex</span> layer. In this case, we can only see one of the two annotations in the transcript body (`1775`). This tells us these are [<span class="keyterm">vertical peers</span>](#horizontal-and-vertical-peers).
- <span class="layer">segment</span> shows `I n d @ v I _ u @ l`
  - The spaces in between these symbols are a hint that there are actually 10 individual annotations on this layer. That's because <span class="layer">segment</span> has a smaller [<span class="keyterm">scope</span>](#layer-scope).
  - Compared to the annotation in the transcript body (`ɪndəvɪdʒuəl`), some of the symbols match (e.g., `n`, `v`, `u`) but others don't (e.g., `I` vs. `ɪ`, `_` vs. `dʒ`). This is because <span class="layer">segment</span>, as a <span class="keyterm">phonological layer</span>, uses the [DISC phonemic alphabet](#phonological-layers-and-disc).

The next line in `CB01interview3.eaf` demonstrates one more type of information we can get from tooltips:

{% include screengrab.html src="transcript/tooltip-missing.png" %}

There's nothing in the space where we would expect a <span class="layer">segment</span> annotation, but we can still hover over this empty space.
Sure enough, the tooltip shows `segment: (no annotation)`.
We'll get into missing annotations [below](#missing-annotations).

Finally, tooltips show up elsewhere on the <span class="apls-page">Transcript</span> page: the [layer picker](#selecting-layers-to-display) and the [_Attributes_ tab](#viewing-transcript-attributes).

### Layer scope

Let's return to the first few lines of `CB01interview3.eaf` with the <span class="layer">speech_rate</span>, <span class="layer">frequency_from_celex</span>, <span class="layer">word</span>, and <span class="layer">segment</span> layers enabled:

{% include screengrab.html src="transcript/multiple-layers.png" %}

As you can see from the previous image, some annotations are "wider" than others:
<span class="layer">speech_rate</span> annotations take up an entire line and <span class="layer">frequency_from_celex</span> annotations take up an entire word.
While there are usually multiple <span class="layer">segment</span> annotations per word, the <span class="apls-page">Transcript</span> page shows them as a single string to save space (though they're separated by spaces in the [tooltip](#annotation-tooltips) that appears when you hover over the annotation).
Differences between layers in how "wide" an annotation can be is captured by layers' <span class="keyterm">scope</span>.
For more information about layer scope, see the [layer typology]({{ '/doc/layer-typology#scope' | relative_url }}) documentation page.


### Missing annotations

Also apparent from the previous image: not all words (and lines) have annotations on all layers.
The words _um_ and _uh_ (in the last line) don't have <span class="layer">frequency_from_celex</span> annotations, because the [CELEX] corpus is text-based (and _um_ & _uh_ generally don't appear in text).
The middle line doesn't have any <span class="layer">segment</span> annotations, because the [HTK] algorithm, which APLS uses to find the timing of speech sounds, can't handle overlapping speech.
And because the timing of <span class="layer">segment</span> annotations is used to calculate speech rate, the middle line also doesn't have any <span class="layer">speech_rate</span> annotations.

In these particular examples of missing annotations, we can come up with good reasons for _why_ they're missing.
Much more rarely, you might find missing annotations where the fact that they're missing seems random.
If you want to understand why an annotation is missing, consult the [layer field guide]({{ '/doc/layer-field-guide' | relative_url }}), which---among other things---describes situations where you can expect missing data in a layer.
<!-- Data coverage page -->


#### Segment-dependent layers
{: .no_toc}

There's a whole category of layers like <span class="layer">speech_rate</span> where you can expect missing annotations if the <span class="layer">segment</span> layer is missing: [segment-dependent]({{ '/doc/layer-typology#segment-dependency' | relative_url }}){:.keyterm} layers.
For example, here's the first 3 lines of `CB01interview3.eaf` again, this time with <span class="layer">phonemes</span> (colored tan), <span class="layer">stress</span> (salmon), <span class="layer">foll_pause</span> (slate gray), <span class="layer">segment</span> (black), and <span class="layer">segment</span> (lavender):

{% include screengrab.html src="transcript/segment-dependency.png" %}
<!-- N.B. Update this screengrab once I merge commit ead12ef into apls branch -->

Again, the middle line doesn't have <span class="layer">segment</span> annotations because of the overlapping speech.
As a result, the remaining layers---all of which (except <span class="layer">word</span>) are segment-dependent---don't have annotations on this line either.

### Horizontal and vertical peers

The <span class="layer">phonemes</span> layer has a one-to-one relationship with its scope (word).
That is, for each <span class="layer">word</span> in the corpus, there can be only one <span class="layer">phonemes</span> annotation (or none, if it's [missing](#missing-annotations)).
On the other hand, some layers allow for <span class="keyterm">peers</span>, where there's a several-to-one relationship with the scope.
There are two types of peers:

- <span class="keyterm">Horizontal peers</span>: Multiple annotations **divide the timespan** of their scope.
- <span class="keyterm">Vertical peers</span>: Multiple annotations occupy an **identical timespan**.

While **horizontal peers can be seen in the transcript body, vertical peers cannot**. 
Both are visible in a [tooltip](#annotation-tooltips), an [exported transcript](#exporting-the-transcript) (in file types like [Praat] TextGrids), or [search results]({{ '/doc/export-data' | relative_url }}).
For example, here's the first line of `CB01interview3.eaf`, this time with the following layers:

- <span class="layer">dictionary_phonemes</span> (colored yellow green): allows vertical peers
- <span class="layer">syllables</span> (kelly green): allows horizontal peers
- <span class="layer">phonemes</span> (tan): allows neither
- <span class="layer">word</span> (black): allows neither

{: .under-the-hood}
> These layers are all part of the process that APLS uses to find <span class="layer">segment</span> annotations, using only the original transcription and the audio file as inputs:
>
> 1. APLS takes the word as originally transcribed (<span class="layer">word</span>), strips out pause/question markers, and makes it lowercase. This normalized form makes it easier to look words up in dictionaries like [CELEX] and [Unisyn] for the purpose of finding phonemic representations, word frequencies, etc.
>    - This is the word's <span class="layer">orthography</span> annotation.
> 1. APLS uses the word's <span class="layer">orthography</span> annotation to look up phonemic representation(s) in the [CELEX] dictionary (for example, _okay_ as /oʊkeɪ/). Some words have more than one phonemic representation (for example, _an_ can be /æn/ with a full vowel or /ən/ with a reduced vowel).
>    - <span class="layer">dictionary_phonemes</span> annotation(s).
> 1. APLS uses [HTK] to estimate where each segment begins and ends in the word based on the audio file. If there are multiple phonemic representations, HTK picks the one that better matches the audio file.
>    - <span class="layer">segment</span> annotation(s)
> 1. APLS combines the word's <span class="layer">segment</span> annotations into a single string of characters. Unlike <span class="layer">dictionary_phonemes</span>, there's only one 
>    - <span class="layer">phonemes</span> annotation
> 1. APLS uses <span class="layer">orthography</span> to look up the word's syllables (including stress) in the [CELEX] dictionary (for example, _okay_ as /oʊ-ˈkeɪ/). Then, APLS combines groups of <span class="layer">segment</span> annotations into one string of characters per syllable (for example, _okay_ as /oʊ/ and /ˈkeɪ/).
>    - <span class="layer">syllables</span> annotation(s)
> 1. (Other [segment-dependent layers](#segment-dependent-layers))

{% include screengrab.html src="transcript/peers.png" %}
<!-- N.B. Update this screengrab once I merge commit ead12ef into apls branch -->

As you can see, some words' <span class="layer">syllables</span> labels have spaces in them (for example, `0oʊ ˈkeɪ` for the word _okay_).
This indicates horizontal peers dividing the <span class="layer">word</span>'s timespan.
By contrast, there are no spaces on the <span class="layer">dictionary_phonemes</span> or <span class="layer">phonemes</span> layer, since these layers don't allow horizontal peers.

It's not obvious from a glance that <span class="layer">dictionary_phonemes</span> allows vertical peers.
It's also not obvious that _a_, _as_, and _an_ have vertical peers for <span class="layer">dictionary_phonemes</span>, but none of the other words.
To find this out, you can hover over the word's <span class="layer">dictionary_phonemes</span> label for a [tooltip](#annotation-tooltips).
The tooltip for _an_ includes `[2]` followed by two separate labels (`{z` and `@n`), while the tooltip for _you_ includes only one label (`ju`):

{% include screengrab.html src="transcript/peers-tooltip-vert.png" %}

The tooltip looks similar for horizontal peers.
For example, _okay_ has two <span class="layer">syllables</span> annotations, and _just_ has one:

{% include screengrab.html src="transcript/peers-tooltip-horiz.png" %}

<!-- Subsection here? Or move below? -->

All of this is easier to visualize if you export the [transcript](#exporting-the-transcript) or the [utterance](#opening-utterances-in-praat) to a [Praat] TextGrid.
Here's what that first line looks like with those layers:

{% include screengrab.html src="transcript/peers-textgrid.png" %}

In this image:

- There is just one tier apiece for <span class="layer">word</span>, <span class="layer">phonemes</span>, and <span class="layer">syllables</span>. This means none of these layers have vertical peers in the utterance.
- There are 3 tiers for <span class="layer">dictionary_phonemes</span>. This means at least one word in this utterance has 3 vertical peers.
  - The words with multiple <span class="layer">dictionary_phonemes</span> intervals are _a_ (with 3 annotations), _as_ (2 annotations), and _an_ (2 annotations). All the other words have just one <span class="layer">dictionary_phonemes</span> interval.
- All the intervals for <span class="layer">phonemes</span> and <span class="layer">dictionary_phonemes</span> are exactly as wide as the corresponding <span class="layer">word</span>. This means neither of these layers have horizontal peers in the utterance.
- Some intervals for <span class="layer">syllables</span> are narrower than the corresponding <span class="layer">word</span>. These are horizontal peers.

You can read the layer typology documentation page for more information about [horizontal]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}) and [vertical]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) peers.


### Phonological layers and DISC

<span class="keyterm">Phonological layers</span> like <span class="layer">phonemes</span> describe speech sounds.
The transcript body displays phonological annotations using the [International Phonetic Alphabet (IPA)][ipa].
For example, the first word of `CB01interview3.eaf` (_okay_) has a <span class="layer">phonemes</span> annotation that is displayed as `oʊkeɪ`:

{% include screengrab.html src="transcript/phonemes.png" %}
<!-- N.B. Update this screengrab once I merge commit ead12ef into apls branch -->

However, APLS stores these annotations internally in the <span class="keyterm">DISC phonemic alphabet</span>, not in IPA.
DISC creates a one-to-one mapping between sounds and symbols like the IPA, but **unlike** the IPA, DISC only uses symbols that appear on a standard [QWERTY keyboard](https://en.wikipedia.org/wiki/QWERTY).
While the IPA is widely-recognized among linguists, many IPA characters are [hard for end-users to input and difficult for computers to store]({{ '/doc/phonemic-transcription#why-not-ipa' | relative_url }}).
For a full list of IPA-to-DISC mappings, see the [phonemic transcription]({{ '/doc/phonemic-transcription' | relative_url }}) documentation page.

As a result, IPA is used by APLS only for displaying phonological layers in the transcript body.
If you'd prefer DISC in the transcript body, you can change that using the [layer picker](#displaying-phonological-layers-in-disc).
As mentioned [above](#annotation-tooltips), when you hover over a phonological annotation in the transcript body, you'll see a tooltip with its DISC representation.
In addition, [exported transcripts](#exporting-the-transcript) and [utterances](#opening-utterances-in-praat) represent phonological layers in DISC.

Elsewhere in APLS, DISC is used for [searching phonological layers]({{ '/doc/search-other-layers#searching-phonological-layers' | relative_url }}) and [exporting]({{ '/doc/export-data' }}) search results.
In fact, phonological layers are just one <span class="keyterm">data type</span>, and DISC is just one <span class="keyterm">notation system</span>.
For more information, see the [layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation page.


## Selecting layers to display

Clicking on the _Layers_ tab in the transcript header brings up the <span class="keyterm">layer picker</span>.
(There are also layer pickers on the <span class="apls-page">Transcripts</span>, <span class="apls-page">Search</span>, and <span class="apls-page">Search results</span> pages, all slightly different in appearance.)
The layer picker controls which layers are displayed in the transcript body and displays information about layers and annotations.
Here's what the layer picker looks like when you load the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`, plus the first line of the transcript:

{% include screengrab.html src="transcript/layer-picker.png" %}

Let's break down what we're looking at:

{% include screengrab.html src="transcript/layer-picker-layout.png" %}

- <span class="keyterm">Layer checkboxes</span> (one highlighted in **red**{:.hl-1}) toggle layers [on and off](#toggling-layers-on-and-off).
- <span class="keyterm">Projects</span> (highlighted in **blue**{:.hl-2}) make more layer checkboxes [appear](#projects).
- Layer <span class="keyterm">icons</span> (one highlighted in **green**{:.hl-3}) indicate [layer properties](#icons).
- <span class="keyterm">Annotation counts</span> (one highlighted in **purple**{:.hl-4}) indicate the [number of annotations](#annotation-counts) on that layer in that transcript.
- The <span class="keyterm">IPA/DISC toggle</span> (highlighted in **orange**{:.hl-5}) affects how annotations are [displayed](#displaying-phonological-layers-in-disc) on phonological layers.


### Toggling layers on and off

When you select a layer checkbox in the layer picker, the transcript body gets updated to fill in annotations from that layer.
Here's that same view of `CB01interview3.eaf` after clicking _segment_ in the layer picker:

{% include screengrab.html src="transcript/layer-picker-segment.png" %}

As you can see, not only did <span class="layer">segment</span> annotations get filled into the transcript body, but the label `segment (4143)` also changed color from black to lavender in the layer picker, matching the annotation color.
In addition, the order of the layers in the transcript body matches the order in the layer picker.
If you click _segment_ again to deselect it, the <span class="layer">segment</span> annotations disappear but `segment (4143)` remains colored lavender:

{% include screengrab.html src="transcript/layer-picker-no-segment.png" %}

The <span class="layer">word</span> layer cannot be deselected, which is why its checkbox and icons are grayed-out.
We'll see something similar below when we discuss [empty layers](#empty-layers).

{: .note }
> Although the <span class="layer">noise</span> layer is also pre-selected when you load the <span class="apls-page">Transcript</span> page, it can be turned off.
> Since some utterances consist of [just <span class="layer">noise</span> annotations](#everything-you-see-is-data), <span class="layer">noise</span> is pre-selected so those utterances don't look empty.


### Projects

When you first load the <span class="apls-page">Transcript</span> page, only a few layers are visible in the layer picker.
To reduce visual clutter, most layers are organized into <span class="keyterm">projects</span>.
For example, clicking the _timing_ project makes three more layer checkboxes appear: <span class="layer">overlap</span>, <span class="layer">speech_rate</span>, and <span class="layer">foll_pause</span>:

{% include screengrab.html src="transcript/layer-picker-projects.png" %}

If you deselect a project, its unselected layers disappear from the layer picker.
But any selected layers will remain in both the layer picker and the transcript.
For example, here's what it looks like when you select _timing_, then select _speech_rate_, then deselect _timing_:

{% include screengrab.html src="transcript/layer-picker-no-projects.png" %}

For more information about projects, see the [layer typology]({{ '/doc/layer-typology#project' }}) documentation page.

### Information about layers

The layer picker contains several useful pieces of information about layers.


#### Layer description
{: .no_toc }

Hovering over the layer name brings up a tooltip with the layer's description.
These descriptions often contain information that's helpful to interpret annotations and/or understand how they were generated.

{% include screengrab.html src="transcript/layer-picker-tooltip.png" %}


#### Scope
{: .no_toc }
  
Layer [scope](#layer-scope) is indicated by which column a layer is in.
For more information on layer scope (including the difference between span and phrase layers), see the [layer typology]({{ '/doc/layer-typology#scope' | relative_url }}) documentation page.


#### Icons
{: .no_toc }

Each layer has either two or three icons to the right of its checkbox in the layer picker.
These icons indicate some of the layer's important properties.
Here's a quick key;
see the [layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation page for more information:

<!-- TODO turn this into an includes so it can be reused on other pages -->
<table class="icon-table">
  <thead>
    <tr>
      <th colspan="2"><a href="{{ '/doc/layer-typology#data-type' | relative_url }}">Data type</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}">Alignment</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#vertical-peers' | relative_url }}">Vertical peers</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-phonological.svg" %}</td>
      <td>Phonological</td>
      <td>{% include labbcat-icon.html src="alignment-0.svg" %}</td>
      <td>Complete interval</td>
      <td>{% include labbcat-icon.html src="vertical-peers.svg" %}</td>
      <td>Allows vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-numeric.svg" %}</td>
      <td>Numeric</td>
      <td>{% include labbcat-icon.html src="alignment-2.svg" %}</td>
      <td>Sub-interval</td>
      <td>(none)</td>
      <td>Doesn't allow vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-text.svg" %}</td>
      <td>Text</td>
      <td colspan="4"></td>
    </tr>
  </tbody>
</table>

This means that, for example, the <span class="layer">segment</span> layer has phonological data type, complete-interval alignment, and no vertical peers: ![]({{ '/assets/screengrab/transcript/layer-picker-segment-icons.png' | relative_url }}){:style="height:1.25em; border:.1em solid black;"}.

If you forget what the icons mean, you can hover over them for a tooltip:

{% include screengrab.html src="transcript/layer-picker-icon-tooltip.png" %}

Finally, if you find the layer icons visually distracting, you can click _Hide layer icons_ to make them disappear.
APLS will remember this setting if you navigate to other pages with layer pickers in the same browser tab.

{% include screengrab.html src="transcript/layer-picker-hide-icons.png" %}

{: .under-the-hood}
> The _about_ link points to the page section you're reading right now!


#### Annotation counts
{: .no_toc }

The layer picker displays the total number of annotations for each layer in that transcript.
For example, `CB01interview3.eaf` has 62 <span class="layer">noise</span> annotations, 1664 <span class="layer">orthography</span> & <span class="layer">word</span> annotations, and 4143 <span class="layer">segment</span> annotations:

{% include screengrab.html src="transcript/layer-picker.png" %}

Longer transcripts will generally have more annotations.
`CB01interview3.eaf` is 8 and a half minutes long.
By comparison, `HD06interview1.eaf`, one of the longest transcripts in APLS (over 37 minutes), has 390 <span class="layer">noise</span> annotations, 6793 <span class="layer">orthography</span> annotations, 6794 <span class="layer">word</span> annotations, and 20,269 <span class="layer">segment</span> annotations:

{% include screengrab.html src="transcript/layer-picker-many-annotations.png" %}

Annotation counts can give us clues about the structure of the data and how layers relate to one another.
For example, `HD06interview1.eaf` has one fewer <span class="layer">orthography</span> annotation than <span class="layer">word</span> annotations, unlike `CB01interview3.eaf`.
That's because the second word of the interview is redacted---Interviewer HD says the speaker's name (as the cornflower-blue <span class="layer">redaction</span> annotation shows).
Otherwise, every <span class="layer">word</span> annotation has a corresponding <span class="layer">orthography</span> annotation.

Like the layer picker's [icons](#icons), there's a _Hide annotation counts_ setting, which APLS remembers if you navigate to other <span class="apls-page">Transcript</span> pages in the same browser tab:

{% include screengrab.html src="transcript/layer-picker-hide-annotation-counts.png" %}

{: .note}
> While other pages have layer pickers (<span class="apls-page">Transcripts</span>, <span class="apls-page">Search</span>, <span class="apls-page">Search results</span>), only the <span class="apls-page">Transcript</span> page's layer picker has annotation counts.


### Empty layers

Some layers in some transcripts have annotation counts of 0.
That is, they're <span class="keyterm">empty layers</span> in that transcript.
You'll most often see empty layers in the _imported_ [project](#projects), as the original transcriber(s) might not have had anything to redact from the transcript (<span class="layer">redaction</span>), any comments to make (<span class="layer">comment</span>), etc.
This is the case with `CB01interview3.eaf`, where the <span class="layer">redaction</span> and <span class="layer">lexical</span> layers are empty:

{% include screengrab.html src="transcript/layer-picker-empty-layers.png" %}

There are a few visual clues that these layers are empty:

- Their checkboxes are grayed-out and cannot be selected
- Their names and icons are grayed-out
- Their annotation counts are 0

By contrast, the <span class="layer">word</span> layer has a grayed-out checkbox that can't be **de**selected and grayed-out icons, but `word` itself is in black and its annotation count isn't 0.


### Displaying phonological layers in DISC

Phonological layers like <span class="layer">segment</span> are displayed with IPA symbols:

{% include screengrab.html src="transcript/layer-picker-segment.png" %}

However, as mentioned [above](#phonological-layers-and-disc), APLS stores these annotations internally in the DISC phonemic alphabet.
You can choose to display these annotations in DISC instead by clicking {% include labbcat-icon.html src="interpreted.svg" %} (the IPA/DISC toggle) to the right of the layer name:

{% include screengrab.html src="transcript/layer-picker-segment-disc.png" %}

As you can see, the IPA/DISC toggle also changes appearance to {% include labbcat-icon.html src="interpreted.svg" %}{:style="opacity:33;"}.
To change back to IPA, simply click the IPA/DISC toggle again.

You can choose different settings for different phonological layers:

{% include screengrab.html src="transcript/layer-picker-segment-disc-phonemes.png" %}
<!-- N.B. Update this screengrab once I merge commit ead12ef into apls branch -->

{: .note}
> Don't forget: You can also view an annotation's DISC representation in its [tooltip](#annotation-tooltips):
> {% include screengrab.html src="transcript/segment-tooltip.png" %}


## Creating permalinks

You can create permalinks for individual lines (<span class="layer">utterance</span>s) or words in the transcript in the [word menu](#word-menu) by clicking on _Utterance_ or _Word_:

{% include screengrab.html src="transcript/permalink-hover.png" %}

This will update the URL in the address bar and highlight the line/word in the transcript body:

{% include screengrab.html src="transcript/permalink-utterance.png" %}

{: .under-the-hood}
> A permalink ID is not a random string of characters!
> Here's how to decode an ID like `em_12_109241`:
>
> - `e` stands for **edge**, as in [graph theory](https://en.wikipedia.org/wiki/Graph_theory). [LaBB-CAT] corpora like APLS are based on the annotation graph data model ([Bird and Liberman 1999]; [Fromont 2017]), which defines annotations as graph-theoretic edges.
> - `m` stands for **meta layer**, the original term in LaBB-CAT for [phrase layers]({{ '/doc/layer-typology#scope' |relative_url }}), since <span class="layer">utterance</span> is a phrase layer. LaBB-CAT underwent some naming changes in [version 20210208](https://sourceforge.net/p/labbcat/code/HEAD/tree/CHANGELOG.txt#l407), but there are still vestiges of the old conventions (including for backward compatibility).
> - `12` is the <span class="layer">utterance</span> layer **layer ID**. This is [pre-defined in new installations of LaBB-CAT](https://github.com/nzilbb/labbcat-server/blob/main/server/src/main/java/nzilbb/labbcat/server/db/SqlConstants.java).
> - `109241` is this <span class="layer">utterance</span>'s **annotation ID** in the MySQL table that stores <span class="layer">utterance</span> annotations.

## Viewing transcript attributes

In [LaBB-CAT] corpora like APLS, <span class="keyterm">attributes</span> are [metadata about individual transcripts or participants]({{ '/doc/attribute-typology' | relative_url }}).
You can view a transcript's attributes by opening the _Attributes_ tab in the transcript header.
Here's what that looks like for `CB01interview3.eaf`:

{% include screengrab.html src="transcript/attributes.png" %}

<!-- Move this to Transcript attributes docpage instead? -->
This tab looks exactly like the transcript's [<span class="apls-page">Transcript attributes</span>]({{ '/doc/browse-transcripts#transcript-attributes-pages' | relative_url }}) page.
The left-hand column shows attributes' display titles (like `Duration (sec)`) and names (like `duration`).
The right-hand column shows attributes' values (e.g., `521.073`).

Most of the attributes are self-explanatory.
But just like layer names in the [layer picker](#layer-description), hovering over an attribute name will bring up a tooltip with its description:

{% include screengrab.html src="transcript/attributes-tooltip.png" %}

Blanks in the right-hand column mean that this transcript doesn't have any value for that attribute.
As you can see, for example, `Transcription AI tool(s)` has a blank for `CB01interview3.eaf` (meaning its <span class="transcript-attr">transcription_ai_tools</span> attribute is empty).
This is because no AI tools were used to transcribe `CB01interview3.eaf`.

{: .note }
> To export transcript attributes to a CSV file, use the [_Export Attributes_ menu on the <span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts#export-attributes' | relative_url }}).

The two checkboxes at the bottom of this tab control how the left-hand column is displayed.
If you want to see attributes' full [export names]({{ '/doc/attribute-typology#export-name' | relative_url }}), deselect _Hide attribute prefixes_:

{% include screengrab.html src="transcript/attributes-prefixes.png" %}

If you're finding the attribute names visually distracting, select _Hide attribute names_:

{% include screengrab.html src="transcript/attributes-hide-names.png" %}

Like in the [layer picker](#selecting-layers-to-display), APLS remembers these settings if you navigate to other <span class="apls-page">Transcript</span> or <span class="apls-page">Transcript attributes</span> pages in the same browser tab.

A detailed description of the different transcript attributes can be found in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).


## Viewing participant information

You can access information about participants by clicking the _Participants_ tab in the transcript header.
Here's what that looks like for `CB01interview3.eaf`:

{% include screengrab.html src="transcript/participants.png" %}

Just like in the transcript body, the _Participants_ tab uses bold to mark the transcript's <span class="keyterm">main participant</span>.
The buttons link to other APLS pages:

- _Attributes_ links to that participant's [<span class="apls-page">Participant attributes</span> page]({{ '/doc/browse-participants#participant-attributes-pages' | relative_url }}).
- _List Transcripts_ displays all the transcripts for that participant on the [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }}). This is the equivalent of the [_List Transcripts_]({{ '/doc/browse-participants#list-transcripts' | relative_url }}) button on the <span class="apls-page">Participants</span> page.

For example, here's what it looks like if you click _List Transcripts_ for `CB01`:

{% include screengrab.html src="transcripts/participant-filter.png" %}


## Searching the transcript/participants

Like the _Participants_ tab, the _Search_ tab provides shortcuts to a different APLS page: the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}).
The buttons pre-fill transcript or participant [search filters]({{ '/doc/search-filters-and-options' | relative_url }}) so you can quickly search for linguistic patterns in an individual transcript, the sociolinguistic interview (that is, the transcript's <span class="transcript-attr">episode</span>), or all utterances from the transcript's participants (in all transcripts where they appear).

{% include screengrab.html src="transcript/search.png" %}

For example, here's what it looks like if you click _CB01_ next to `Search transcript series`:

{% include screengrab.html src="search/episode-filter.png" %}

One thing that does **not** work for searching the transcript is `<ctrl>/<cmd>+F`.
Because of the way the <span class="apls-page">Transcript</span> page's HTML is structured, multi-word phrases will never match.
For example, even though the first two words of `CB01interview3.eaf` are `okay just`, searching the <span class="apls-page">Transcript</span> page for `okay just` yields zero hits:

{% include screengrab.html src="transcript/ctrl-f.png" %}

If you want to [search for multi-word phrases]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}), use APLS's <span class="apls-page">Search</span> page instead.


## Downloading audio

To download the audio file for the entire transcript, click _mp3_ or _wav_ in the media player:

{% include screengrab.html src="transcript/player-playing.png" %}

{: .note}
> If you want to [extract acoustic measurements]({{ '/doc/extract-acoustics' | relative_url }}) from the audio file, an easier option is to use the <span class="apls-page">Process with Praat</span> page.

To download audio for a single line (<span class="layer">utterance</span>) of the transcript, use the [word menu](#word-menu).
Click on a <span class="layer">word</span> in the line you want to download, then click _Extract audio_:

{% include screengrab.html src="transcript/no-praat-word-menu-context.png" %}

{: .note .no-collapse}
> As a reminder, APLS's [terms of use]({{ '/doc/terms' | relative_url }}) prohibit users from sharing audio files publicly.


### Audio channels

Almost all audio files are in stereo, with the interviewer appearing on the left channel and the interviewee (main participant) on the right channel.
Unfortunately, most files feature "bleed" between channels.
That is, the interviewer can usually be heard in the background of the right channel, and the interviewee can usually be heard in the background of the left channel.

{: .note}
> Some audio files don't follow this pattern:
>
> - `LV10` interviews are in mono, with both speakers appearing on both channels.
> - `LV08and09` interviews include the interviewer (`Barbara Johnstone`) and `LV09` sharing the left channel, and `LV08` alone on the right channel.

## Exporting the transcript

The _Export_ tab in the transcript header allows you to download the current transcript in any of the listed file types:

{% include screengrab.html src="transcript/export.png" %}

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page (<https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf>):
> 
> 1. Make sure only the <span class="layer">word</span> layer is selected.
> 1. Click the _Export_ tab.
> 1. Click _Praat TextGrid_.
> 1. Open the TextGrid in [Praat].

At a minimum, the exported file will include the <span class="layer">utterance</span> and <span class="layer">word</span> layers.
It will also include any layers you have [selected](#toggling-layers-on-and-off) to show in the transcript body.
Here's what the exported TextGrid looks like when only the <span class="layer">word</span> layer is selected (<span class="layer">noise</span> is deselected):

{% include screengrab.html src="transcript/export-praat-0.png" %}

As you can see, the exported TextGrid has four tiers: `Barbara Johnstone`, `CB01`, `word - Barbara Johnstone`, and `word - CB01`.
The tiers named after the participants (`Barbara Johnstone` and `CB01`) represent their <span class="layer">utterance</span> annotations.
The tiers that start with `word - ` represent each participant's <span class="layer">word</span> annotations.

{: .under-the-hood }
> Technically speaking, the tiers named after the participants (`Barbara Johnstone` and `CB01`) only get their **timings** from the <span class="layer">utterance</span> layer.
> Both <span class="layer">utterance</span> and <span class="layer">turn</span> are [timing-only layers]({{ '/doc/layer-typology#data-type' | relative_url }}), which means their annotations don't have a label, only a start and end time.
> When APLS exports a transcript to TextGrid, it takes the timings from <span class="layer">utterance</span> annotations and fills them in with that participant's <span class="layer">word</span> annotations within that <span class="layer">utterance</span>.

{: .try-it }
> 1. Open the TextGrid from the previous try-it.
>
> You should see four tiers, two per participant: one for each participant's <span class="layer">utterance</span> annotations (labeled `Barbara Johnstone` and `CB01`) and one for each participant's <span class="layer">word</span> annotations (labeled `word - Barbara Johnstone` and `word - CB01`).
> * * *
> Now let's zoom into the first Barbara Johnstone utterance (`okay just a few questions about you as an individual`):
>
> 1. Click that interval in the `Barbara Johnstone` tier.
> 1. Either click _sel_ in the bottom-left of the TextGrid window, or hit `<ctrl>/<cmd>+N`.
> 
> You should see that each of the words in the utterance has its own interval in `word - Barbara Johnstone`:
> 
> {% include screengrab.html src="transcript/export-praat-1.png" %}
> * * *
> Finally, let's see how overlaps look in an exported TextGrid.
> According to the <span class="apls-page">Transcript</span> page, there's an overlap when Barbara Johnstone says `what you'd say you're` and CB01 says `okay`, right after Barbara's first utterance
> 
> 1. Zoom into the next `Barbara Johnstone` interval in the TextGrid.
>
> You should see a `CB01` interval that lines up with the `Barbara Johnstone` interval, plus words on _both_ participants' `word - ` tiers.
> {% include screengrab.html src="transcript/export-praat-2.png" %}

Exporting transcripts to TextGrid is a good way to understand some of the details of annotations (and their timing) that are hard to glean from the Transcript page.
(This is true for Elan EAF transcripts, too.)
In particular, if a layer allows [vertical peers](#horizontal-and-vertical-peers) ({% include labbcat-icon.html src="vertical-peers.svg" %} [icon](#icons) in the layer picker), the exported TextGrid may show multiple tiers per participant.

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page:
> 
> 1. Click the _Layers_ tab.
> 1. Select <span class="layer">dictionary_phonemes</span>.
> 1. Click the _Export_ tab.
> 1. Export to _Praat TextGrid_ and open in [Praat].
>
> You should see **three** `dictionary_phonemes - ` tiers per participant.
> This is because some words have more than one possible phonemic representation, such as /æz/ or /əz/ for _as_.
> {% include screengrab.html src="transcript/export-praat-4.png" %}

{: .note }
> Some tier names in the exported TextGrid are long enough that they get cut off in the Praat TextGrid window.
> In the previous try-it, you can't tell which tiers are `dictionary_phonemes - Barbara Johnstone` and which are `dictionary_phonemes - CB01`.
> To see the full name of a TextGrid tier:
>
> 1. Select the tier.
> 1. Go to the _Tier_ menu and click _Rename tier..._.
>
> Then you can see the tier's full name (even if you don't rename it).

So far, we've only been looking at Praat TextGrids.
Other file formats affect not only which layers are exported, but how they are displayed.
Some transcript formats also show additional layers from the [original uploaded transcription]({{ '/doc/transcription' | relative_url }}): <span class="layer">noise</span>, <span class="layer">comment</span>, and <span class="layer">pronounce</span>.
For example, here's an <span class="layer">utterance</span> from `CB01interview3.eaf` that includes all three of those layers, with <span class="layer">comment</span> in purple, <span class="layer">noise</span> in magenta, and <span class="layer">pronounce</span> in periwinkle:

{% include screengrab.html src="transcript/imported-layers.png" %}

Here's what the same <span class="layer">utterance</span> looks like in an exported *Plain Text Document*:

```
CB01:  but even though th~[D] the reality is . [tap] I don't even know what they would call [tap] themselves {mid-word laugh} but [laughs]
```

Unlike in Praat TextGrids and Elan EAF transcripts, where all annotations have time alignments, in *Plain Text Document*s and *PDF Document*s, <span class="layer">utterance</span>s are separated by line breaks and <span class="layer">word</span>s are simply listed within each utterance.
That is, these annotations are _not_ time-aligned and there's no way to tell whether speech is overlapping.
As a result, the *Plain Text Document*s and *PDF Document* formats are better for a readable or skimmable overview of who said what, and not very useful as structured linguistic data.

{: .note }
> If you need greater control over which layers to export, use the [_Export Formatted_ menu on the <span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts#export-formatted' | relative_url }}).

As previously mentioned, the exported file will include any layers you have selected in the [layer picker](#toggling-layers-on-and-off).
The Export tab displays these layers on the top line:

{% include screengrab.html src="transcript/export-layers.png" %}

Phonological layers (like <span class="layer">segment</span>) are always displayed in the [DISC phonemic alphabet]({{ '/doc/phonemic-transcription' | relative_url }}).

{: .try-it }
> On the `CB01interview3.eaf` <span class="apls-page">Transcript</span> page:
> 
> 1. Click the _Layers_ tab.
> 1. Select the <span class="layer">segment</span> layer.
> 1. Click the _Export_ tab.
> 1. Click _Praat TextGrid_.
> 1. Open the TextGrid in Praat.
>
> Compared to the previous try-it, you should see two new tiers: a `segment - ` tier for each participant.
> If you zoom in on an individual word, you should see that each of the segments has its own interval.
>
> {% include screengrab.html src="transcript/export-praat-3.png" %}


## Opening utterances in Praat

Similar to [downloading audio](#downloading-audio) and [exporting an entire transcript](#exporting-the-transcript), you can open an individual <span class="layer">utterance</span> in [Praat].
This requires installing the Praat integration (see [this page]({{ '/doc/praat-integration' | relative_url }})).
If you've installed the Praat integration, you'll see three Praat commands in the [word menu](#word-menu) that appears when you click on a <span class="layer">word</span>:

{% include screengrab.html src="transcript/word-menu-context.png" %}

These commands are:

- _Open audio in Praat_: Open just the <span class="layer">utterance</span> audio in Praat (in a Sound editor window).
- _Open TextGrid in Praat_: Open the <span class="layer">utterance</span> audio and TextGrid in Praat (in a TextGrid editor window).
- _Open TextGrid incl. ± 1 utterance in Praat_: Same as the previous, potentially including the previous and/or next <span class="layer">utterance</span>.

{: .note}
> If Praat isn't already open on your computer, these commands will also open Praat.

Here's what it looks like when you select _Open TextGrid in Praat_ for the first <span class="layer">utterance</span> of `CB01interview3.eaf` when only <span class="layer">word</span> is selected in the [layer picker](#selecting-layers-to-display) (<span class="layer">noise</span> is deselected):

{% include screengrab.html src="transcript/textgrid.png" %}

As you can see, there are just two tiers: `Barbara Johnstone` and `word - Barbara Johnstone`.
Like when you [export an entire transcript](#exporting-the-transcript) on the _Export_ tab, these tiers correspond to the <span class="layer">utterance</span> and <span class="layer">word</span> layers.

**Unlike** with an entire transcript, there are no tiers for `CB01`.
That is, _Open TextGrid in Praat_ will only include participant(s) who are speaking in that line.
If you select the second line of `CB01interview3.eaf` instead, the exported TextGrid does include tiers for both participants due to the overlapping speech:

{% include screengrab.html src="transcript/textgrid-overlap.png" %}

Like when you [export an entire transcript](#exporting-the-transcript) on the _Export_ tab, the TextGrid will include any layers that you have selected in the [layer picker](#selecting-layers-to-display).
Here's the result of _Open TextGrid in Praat_ for the first <span class="layer">utterance</span> of `CB01interview3.eaf` with <span class="layer">segment</span> selected in the [layer picker](#selecting-layers-to-display):

{% include screengrab.html src="transcript/textgrid-segment.png" %}

If you're exporting a layer that allows [vertical peers](#horizontal-and-vertical-peers), the exported TextGrid will include additional tiers to accommodate vertical peers (again, like with an entire transcript):

{% include screengrab.html src="transcript/textgrid-vertical-peers.png" %}

However, it will only include as many tiers as needed within that <span class="layer">utterance</span>:

{% include screengrab.html src="transcript/textgrid-no-vertical-peers.png" %}

As mentioned above, the _Open TextGrid incl. ± 1 utterance in Praat_ command may include the previous and/or next <span class="layer">utterance</span>.
However, the adjacent <span class="layer">utterance</span>(s) will only be included if they're [within the same <span class="layer">turn</span>](#turns-and-utterances).
This means that if there's a time gap between the <span class="layer">utterance</span> you selected and its adjacent <span class="layer">utterance</span>, the adjacent <span class="layer">utterance</span> won't be included.
If you need adjacent <span class="layer">utterance</span>s, [export the entire transcript](#exporting-the-transcript) to TextGrid and manipulate the TextGrid as needed.

Finally, the Praat integration downloads these files to a temporary folder.
If you want to save them to your computer, use the _Save_ menu on the Praat Objects window.

## Accessing <span class="apls-page">Transcript</span> pages 

There are multiple ways to reach a <span class="apls-page">Transcript</span> page in APLS:

- The <span class="apls-page">Transcripts</span> page at <https://apls.pitt.edu/labbcat/transcripts>, as described on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.
  > Go to the <span class="apls-page">Transcripts</span> page (<https://apls.pitt.edu/labbcat/transcripts>) and click on _CB01interview3.eaf_ to view that transcript.
  {: .try-it }
- Via the <span class="apls-page">Transcript</span> page's URL, which is in the form of `https://apls.pitt.edu/labbcat/transcript?transcript=` followed by the transcript's name.
  > Click the URL <https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview3.eaf>.
  > This will take you directly to the <span class="apls-page">Transcript</span> page for `CB01interview3.eaf`.
  {: .try-it }
- Via a [permalink](#creating-permalinks) to a line or word in the transcript.
- Once you have a <span class="apls-page">Transcript</span> page open, you can use <span class="keyterm">navigation arrows</span> to move to a different transcript, as described [above](#navigating-to-other-transcripts).

In addition, there are two ways to access transcripts from the results of a search (see [Searching the corpus]({{ '/doc/search' | relative_url }})):

- Through the <span class="apls-page">Search results</span> page by clicking on hyperlinked text. This will load the <span class="apls-page">Transcript</span> page and scroll directly to the search result you clicked.
- If you export search results to CSV (see [Exporting data]({{ '/doc/export-data' | relative_url }})), the `URL` column has links that load the <span class="apls-page">Transcript</span> page and scroll directly to the search result corresponding to each row.

{% include linklist.html %}
