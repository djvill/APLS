---
title: Coding tokens
permalink: /doc/code-tokens
parent: How to use APLS
nav_order: 65
has_toc: false
last_modified_date: 2025-11-11T14:26:20-05:00
---

# {{ page.title }}
{:.no_toc}

The linguistic subfield of language variation and change studies <span class="keyterm">linguistic variables</span>: speakers' choices between multiple linguistic forms that exist in the same linguistic environment.
For example, some speakers of Pittsburgh English pronounce the /aw/ vowel (the vowel sound in words like _out_ and _downtown_) more like "ah" (stereotyped as "_aht_" and "_dahntahn_").
The multiple forms of the /aw/ variable ("aw" and "ah") are known as <span class="keyterm">variants</span>.
In order to research this variable, a researcher has to listen to every token of /aw/ and manually identify whether the speaker pronounced it as "aw" or "ah".
This process, which is called <span class="keyterm">coding</span>, is often tedious and time-consuming.

Fortunately, APLS makes coding much easier and faster.
On this page, we'll discuss three common coding scenarios:

- Variables for which codes can be [extracted from annotations](#coding-tokens-by-extracting-annotations) without you needing to manually code tokens
- Variables that can be coded based on the [text of the transcript](#coding-tokens-by-reading-context) alone
- Variables for which you need to [listen to transcript audio](#coding-tokens-by-listening-to-audio) in order to code them
  
  {: .note .no-collapse}
  > This is often the most challenging of the three coding scenarios.
  > To make it easier and faster, we've created a program, [`CodeTokens.praat`]({{ '/doc/codetokens-praat-script' | relative_url }}).

While this page focuses mosly on coding variants, these scenarios can also apply to [predictors](#coding-predictors).
Not covered on this page is [measuring tokens' acoustic properties]({{ '/doc/extract-acoustics' | relative_url }}), which you might want to do instead of (or in addition to) coding them.

{: .note .no-collapse}
> If you haven't yet, read the documentation section on [searching the corpus]({{ '/doc/search' | relative_url }}) and the page on [exporting data]({{ '/doc/export-data' | relative_url }}) before reading this page.

{% include page_toc.html collapsible=true %}

## The coding workflow

The coding (and data analysis) workflow usually looks something like this:

1. Create a [search]({{ '/doc/search' | relative_url }}) where each match is one token of the variable you're interested in, for the participants and/or transcripts in your sample.
   - This can take some trial and error!
1. [Export search results to CSV]({{ '/doc/export-data#csv-export' | relative_url }}).
   - If [coding by listening to audio](#coding-tokens-by-listening-to-audio), export [utterances as Praat TextGrids]({{ '/doc/export-data#utterance-export' | relative_url }}) and [audio files]({{ '/doc/export-data#audio-export' | relative_url }}) as well.
1. Enter codes in a new CSV column.
   - CSVs can be read and edited in spreadsheet programs like Microsoft Excel, Numbers for Mac, or Google Sheets.
   - If coding by listening to audio, you can use the [`CodeTokens.praat` Praat script](#codetokens_praat) to make this much faster.
1. If needed, [code predictors](#coding-predictors) (aka independent variable(s) or constraints) in new CSV column(s).
1. Use a program like Excel or R for statistical modeling and/or data visualization.


## Coding tokens by extracting annotations

In this scenario, annotations that are already in APLS provide the codes.
This works well for many lexical variables (like _slippy_ vs. _slippery_), morphological variables (like _don't_ vs. _doesn't_), and syntactic variables (like _will_ vs. _going to_ vs. _gonna_).
In each of those cases, you can export annotations on the <span class="layer">orthography</span> layer.

In some cases, you still might need to categorize or relabel exported annotations into variants in order to get your codes.
For example, if you're looking at a set of "Pittsburghese" lexical items, you might need to create a new CSV column that categorizes some <span class="layer">orthography</span> annotations as `Pittsburgh` (such as _slippy_, _nebby_, _sweeper_) and others as `non-Pittsburgh` (such as _slippery_, _nosey_, _vacuum_).
<!-- Easier to do if you define a formula in Excel or use a program like R -->

With these variables, the tricky thing isn't coding, it's figuring out which forms are actual tokens of the variable vs. unrelated forms, and encoding that in your search.
For example, if you're investigating English future-tense variation (_will_ vs. _going to_ vs. _gonna_), you'll want to exclude forms that aren't in the future tense (like "a strong will" or "going to the store").
In this particular example, you can use the <span class="layer">part_of_speech</span> layer to only include _will_ tokens that are modal verbs (<span class="layer">part_of_speech</span> `MD`) and _going to_ tokens where the _to_ is an infinitival marker (<span class="layer">part_of_speech</span> `TO`).
In other situations, you might have to consult the [context of the words in the transcript](#coding-tokens-by-reading-context) to figure out which tokens to include or exclude.


### Not for phonological variables

This scenario generally **doesn't** apply to phonological variables (like [ɪŋ] vs. [ɪn] endings in words like _working_ or _something_).
Instead, these variables need to be coded by [listening to audio](#coding-tokens-by-listening-to-audio).

This is because annotations on [phonological layers]({{ '/doc/layer-typology#data-type' | relative_url }}) like <span class="layer">segment</span> are **phonemic, not phonetic**.
To generate the <span class="layer">segment</span> layer, APLS first uses [<span class="keyterm">pronouncing dictionaries</span>]({{ '/doc/custom-dictionary' | relative_url }}) to match each word's <span class="layer">orthography</span> annotation to a phonemic representation (like /ˈwɝɹkɪŋ/ for _working_, /ˈsʌmθɪŋ/ for _something_), then uses the [HTK] algorithm to find the start and end time of each of these sounds.
While some <span class="layer">orthography</span> annotations have multiple phonemic representations in the dictionary, this is restricted to homophones (like _desert_ as /dəˈzɝt/ vs. /ˈdɛzɚt/) or reduced vs. unreduced pronounciations of highly common words (like _to_ as /tə/ vs. /ˈtu/).
As a result, _working_ and _something_ are always represented in APLS as ending with /ɪŋ/, regardless of whether the speaker said [wɝɹkɪ**ŋ**] or [wɝɹkɪ**n**].

{% comment %}
#### Why not phonetic representations?
{: .no_toc}

While this "phonemic, not phonetic" principle may seem inconvenient, it has several benefits:

- It's easier to search for patterns. If you're interested in where speakers could have chosen one form or another, it's easier to search for a single phonemic form rather than several possible phonetic forms. This is especially the case where one form involves deletion. For example, <!-- CSD: how do you tell the difference between words that have an underlying cluster vs. don't? -->
  - <!-- Principle of Accountability -->
- <!-- Using phonetic representations would mean we need to create a 'variant dictionary'. This has been investigated via individual variables, but there are many possible variables and accounting for them all at the same time is hard. By sticking to phonemes, we don't have to exhaustively define all the possible variables or their variants ahead of time -->
  - <!-- The variants point is especially crucial. We might not know variants ahead of time, and even if we do, different users will have different levels of granularity. Variants != narrow phonetic transcriptions. By going with phonemes, we say "we're not worried about narrowness" -->
- <!-- For vowels, this wouldn't be compatible with how sociophonetics is currently done. While older approaches would've coded /aw/ as different narrow phonetic transcriptions, nowadays you just measure the formants for /aw/ -->
- <!-- It's not clear how well these work. See my NWAV 2024 presentation. -->
- <!-- Simplifies the task of transcription by separating 'coding while transcribing' -->
- <!-- APLS isn't meant to be static. Codes can be contributed by users to save future users' effort -->
- <!-- Representing narrow transcriptions would require a different notation system than DISC -->
{% endcomment %}

## Coding tokens by reading context

In this scenario, coding is done manually by looking at the context of the words in the transcript.
In the previous scenario, the codes come from the **form** of the token (that is, the annotation);
in this scenario, the codes come from the **meaning or function** of the token.
This works well for variables such as _like_, which can be a verb on its own ("I would like that"), part of the quotative verb _be like_ ("she was like, 'what do you mean?'"), a preposition ("things like that"), a subordinating conjunction ("like I said"), or a discourse particle ("my like role model").

On the <span class="apls-page">Search results</span> page, you can use the context selector to view the entire text of the <span class="layer">utterance</span> that contains each token.
Here's what that looks like for a simple search for <span class="layer">orthography</span> `like`:

{% include screengrab.html src="matches/context-utterance.png" %}

{: .note}
> This search also uses the _Only include matches from the main participant in a transcript_ [search option]({{ '/doc/search-filters-and-options#search-options' | relative_url }}).

Then you can enter codes in a new column in your results CSV file.
If you're using Windows, you can use [Snap](https://support.microsoft.com/en-us/windows/snap-your-windows-885a9b1e-a983-a3b1-16cd-c531795e6241) to put your browser and CSV file side-by-side:

{% include screengrab.html src="matches/coding-side-by-side.png" %}

You might also find it convenient to hide columns in the CSV file ([Excel instructions](https://support.microsoft.com/en-us/office/hide-or-show-rows-or-columns-659c2cad-802e-44ee-a614-dde8443579f8)) so you can make sure you're coding the correct row:

{% include screengrab.html src="matches/coding-side-by-side-hide.png" %}

Since the `Before Match`, `Text`, and `After Match` columns show the same search context that's on the <span class="apls-page">Search results</span> page, you can use only the CSV file if you don't want to use multiple windows.
This can be useful if you have a lot of tokens to code and can't count on internet access the whole time.
That said, it does take some tweaking of the display settings to look nice.
Here's what it looks like in Excel when you hide all columns except those three and the coding column, adjust the column widths, select [Wrap text](https://support.microsoft.com/en-us/office/wrap-text-in-a-cell-in-excel-2a18cff5-ccc1-4bce-95e4-f0d4f3ff4e84) so the whole context is visible when it's long, and adjust row heights so they're not too tall:

{% include screengrab.html src="matches/coding-just-in-csv.png" %}

{: .note}
> If you want to return to the <span class="apls-page">Search results</span> page interface after you've closed APLS, you can reupload your CSV file to the <span class="apls-page">Extract data based on search results</span> page (<https://apls.pitt.edu/labbcat/matches/upload>).
{%- comment %}TODO point this to the relevant page/section once it's built{% endcomment %}


### Viewing tokens on the <span class="apls-page">Transcript</span> page

In some cases, you may need more context than is available on the <span class="apls-page">Search results</span> page or in the `Before Match`/`After Match` CSV columns.
For example, the third _like_ search result is ambiguous without knowing what comes after "like at home here".
Clicking on a search result on the <span class="apls-page">Search results</span> page will open the <span class="apls-page">Transcript</span> page in a new tab and highlight/scroll to that token.
Here's what it looks like when you click the third _like_ search result:

{% include screengrab.html src="transcript/matches.png" %}

As you can see, the _like_ in "like at home here" has been highlighted in yellow.
The next _like_ token (in "like this is home") has been highlighted in green, and if you scroll elsewhere in the transcript, you'll see other _like_ tokens highlighted in green too.
If you're working with a CSV, you can access these links in the `URL` column.

{: .under-the-hood}
> Like on the <span class="apls-page">Search results</span> page, the CSV `URL` links open the <span class="apls-page">Transcript</span> page, scroll to that token, and highlight it in yellow.
> However, other tokens aren't highlighted in green.
> This is because highlighting other tokens requires APLS to save stored data on [search tasks](https://nzilbb.github.io/labbcat-server/apidocs/nzilbb/labbcat/server/task/Task.html).
> Once a user closes the <span class="apls-page">Search</span> or <span class="apls-page">Search results</span> page, APLS cleans out the stored search task data to save space.


## Coding tokens by listening to audio

In this scenario, coding is done manually by listening to how speakers produce tokens of a variable.
This is known as <span class="keyterm">auditory coding</span>.
Auditory coding works well for phonological variables (like [ɪŋ] vs. [ɪn] endings in words like _working_ or _something_) and suprasegmental variables (like creaky voice vs. modal voice).
In other words, auditory coding is necessary for coding variables where the different variants don't correspond to annotations in APLS and can't be determined from reading the transcript.
(See above for [why phonological annotations are phonemic, not phonetic](#not-for-phonological-variables).)

One way to do auditory coding in APLS would be to [open each search result on the <span class="apls-page">Transcript</span> page](#viewing-tokens-on-the-transcript-page) and use the [word menu]({{ '/doc/view-transcript#listening-to-the-transcript' | relative_url }}) to play just the utterance that contains the token.
But we've created a faster way: `CodeTokens.praat`.
`CodeTokens.praat` is a program (running within [Praat]) that makes coding faster and easier by seamlessly integrating with the APLS <span class="apls-page">Search results</span> page, playing tokens one-at-a-time, providing a graphical user interface for selecting variants, and writing your codes to a CSV file:

{% include screengrab.html src="code-tokens/coding-screen.png" %}

To learn more, visit the [`CodeTokens.praat` documentation page]({{ '/doc/codetokens-praat-script' | relative_url }}).


## Coding predictors

The same token-coding scenarios discussed above apply to coding predictors (aka independent variables or constraints):

- Coding predictors by [extracting annotations](#coding-tokens-by-extracting-annotations). Works well when the predictor can come:
  - Directly from annotations on an APLS layer (like <span class="layer">frequency_in_corpus</span>) or attribute (like <span class="participant-attr">gender</span>)
  - From relabeled annotations (like providing nicer labels for <span class="layer">stress</span> markers or <span class="layer">part_of_speech</span> tags)
  - From categorized annotations (like categorizing <span class="layer">morphemes</span> annotations into `past tense` vs. `non-past tense`)
  
  {: .note}
  > Unlike coding tokens, this scenario can apply to phonological predictors, as long as the predictor is defined on the level of [phonemes rather than surface representations](#not-for-phonological-variables) (like the length of an [underlying] consonant cluster).
  
- Coding predictors by [reading context](#coding-tokens-by-reading-context). Works well for predictors that are difficult to extract from APLS annotations, on the level of:
  - Discourse (like topic or [stance](https://doi.org/10.1093/acprof:oso/9780195331646.003.0008)) <!-- Alternatively https://web.stanford.edu/~eckert/PDF/kiesling2009.pdf -->
  - Syntax (like the subject of a verb)
- Coding tokens by [listening to context](#coding-tokens-by-listening-to-audio). Works well for predictors that require listening on the level of:
  - Segmental phonology (like whether the vowel in the _-ing_ ending is [ɪ] or [i])
  - Suprasegmentals (like creaky voice vs. modal voice)
  - Discourse (like whether a speaker is being sarcastic)
- Measuring predictors by [extracting acoustic properties]({{ '/doc/extract-acoustics' | relative_url }}) of each token. Works well for measurable predictors like pitch


{% include linklist.html %}
