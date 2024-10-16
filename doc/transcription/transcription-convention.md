---
title: Transcription convention
layout: default
permalink: /doc/transcription-convention
parent: Transcription
nav_order: 10
last_modified_date: 2024-10-16T11:50:54-04:00
---


# {{ page.title }}
{:.no_toc}

The purpose of transcription for APLS is to **facilitate large-scale processing of speech data** through the **LaBB-CAT** corpus analysis tool.
This means that we need to report speech as faithfully as possible and be consistent about little details like file names.
It also means that we _don't_ transcribe or notate things that LaBB-CAT can do automatically.

Once you've [set up the transcription file](#file-setup), transcription consists of two tasks: [**segmenting**](#segmentation) the file into turns, and [**annotating**](#annotation) the turns.
In other words, you first figure out who is speaking when, then you figure what they said.

In this document, `fixed-width font` is used for things you actually type into the transcription program (Praat or Elan), and _italics_ are used for menu commands (i.e., buttons you click).

{% include toggle.html id="trs-toggle" leftText="Select your transcription program:" label1="Praat" label2="Elan" labelWidth="3em" %}

{% include page_toc.html collapsible=true %}


## General tips

- It's strongly recommended to [segment](#segmentation) the sound file into turns first, then go back and [fill in](#annotation) the transcription
	- Some transcribers prefer to segment the entire file before annotating, and others prefer to segment and annotate in chunks
- Transcription usually takes longer at the start of the interview, then it speeds up once you get used to how a speaker talks
- The majority of the sound file will be relatively easy to transcribe. However, some parts of each file will take disproportionately long to transcribe due to [unfinished words](#pronounce-codes), [overlaps](#overlaps), and/or ambiguous speech
	- One recommendation is to create a temporary `Recheck` tier where you make note of speech you're having trouble hearing correctly, so you can return to these portions of the transcript with fresh ears after you're done the first pass. Make sure to delete the `Recheck` tier once you're done checking
- Use the same audio setup each time you transcribe. Some details that are easy to catch with headphones on are inaudible from laptop speakers.
- **Save your work often!**
	- <span class="praat">Praat</span><span class="elan">Elan</span> doesn't auto-save your work, unlike some programs you might be used to (e.g., Google Docs). <span class="praat">Praat usually doesn't crash, but better safe than sorry.</span>
		<li class="elan">Elan is known to crash occasionally, so you may want to set an automatic backup interval (File > Automatic Backup)</li>
- Once you've finished transcribing, check over your work!


## File setup

- The transcription file should have the same name as the sound file and end in <span class="praat">`.TextGrid`</span><span class="elan">`.eaf`</span> (e.g., <span class="praat">`CB20interview3.TextGrid`</span><span class="elan">`CB20interview3.eaf`</span>)
- Create **one tier for each speaker, plus <span class="praat">four</span><span class="elan">three</span> additional tiers**: `Noise`, `Comment`, <span class="elan">and </span>`Redaction`<span class="praat">, and `Transcriber`</span>
	- The tier name for the main speaker(s) should be that speaker's APLS code (e.g., `LV01`). Main speaker(s) are in the sound file name.
	- The tier name for the interviewer(s) should be the interviewer's name:
		- `Interviewer HD` for HD interviews
		- `Barbara Johnstone` for most CB/FH/LV interviews
		- `Jennifer Andrus` for CB02 or CB18
	- In most cases, any additional speakers should be named `Bystander` + main speaker's APLS code + a number (e.g., `Bystander CB01 1`, `Bystander CB01 2`)
		- The only exception is if the additional speaker is also in APLS (in which case, name their tier with their speaker code). This is very unlikely, so unless you happen to know the additional speaker is in APLS, just assume it's a `Bystander`
	- Pay attention to capitalization, plurals, and leading zeros (e.g., `Redaction` not <code class="counterex">redactions</code>, `FH01` not <code class="counterex">FH1</code>)
		<li class="praat">The <code>Transcriber</code> tier should have a single annotation: the names of all transcribers (including anyone who checked the transcription)</li>
	<li class="elan">For all tiers, set the Participant attribute to be the same as the tier name. To add tiers and set tier attributes, go to <em>Tier</em> > <em>Add New Tier</em>.</li>
	<li class="elan">Set the file's Author attribute to the names of all transcribers (including anyone who checked the transcription) by going to <em>Edit</em> > <em>Set Author</em></li>
- You may also want to create a (temporary) `Recheck` tier (see [below](#tips)) while you're transcribing
	- Make sure to delete this tier when you're ready to submit the file


## Segmentation

Before annotating speech, you should segment the file into turns by creating intervals on the appropriate speaker tier(s).
(Again, some transcribers prefer to segment the _entire_ file before annotating, and others prefer to segment and annotate in _chunks_.)
You can leave the `Noise`, `Comment`, and `Redaction` tiers empty until you're actually ready to annotate.


General segmentation tips:

<div class="praat">

<ul>
	<li>Most files are in stereo, with the interviewer on the left channel and the interviewee on the right channel (although the interviewee's audio often 'bleeds' to the left channel)
		<ul>
			<li>You can mute one channel at a time (Ctrl+click/Cmd+click on the speaker icon to the right of the waveform)</li>
			<li id="split-channels"> If you want to hear a single channel in <em>both</em> ears, do the following:
				<ul>
				<li>Go to the Praat Objects window, select the sound file, click <em>Convert</em> > <em>Extract one channel...</em>, and enter <code>1</code> for left (interviewer) or <code>2</code> for right (interviewee)</li>
				<li>Select the new sound file and the TextGrid, and click <em>View & Edit</em></li>
				<li>The new window will keep in sync time-wise with the original one, and any edits you make to the TextGrid will show up on both windows</li>
				</ul>
			</li>
		<li>Praat doesn't distinguish between empty and non-empty intervals. So when segmenting, add a filler character (e.g., <code>&gt;</code>) into each interval you intend to fill later</li>
		</ul>
	</li>
	<li>Copying boundaries between tiers is straightforward in Praat:
		<ul>
			<li>If you want to copy an existing <em>boundary</em> to a new tier, click the boundary, then either press Ctrl+F<em>n</em>/Cmd+F<em>n</em> (where <em>n</em> is the tier number you want to copy to) or click the blue circle on the tier</li>
			<li>If you want to copy an existing <em>interval</em> (pair of boundaries) to a new tier, click the interval, then press Ctrl+<em>n</em>/Cmd+<em>n</em> (where <em>n</em> is the tier number you want to copy to)</li>
			<li>You can also use these tricks to add a new boundary or interval to multiple tiers: position your cursor by clicking or click-and-dragging on the waveform, then press Ctrl/Cmd+<em>n</em> (interval) or Ctrl/Cmd+F<em>n</em> (boundary)</li>
		</ul>
	</li>
	<li>In the course of filling in the transcription, you will sometimes find that you want to adjust the turn segmentation
		<ul>
			<li>Click and drag boundaries to adjust them</li>
			<li>If you want to adjust boundaries on multiple tiers, drag a boundary to the right spot on one tier, copy it to the other tier, delete the old boundary on the other tier, and (if needed) cut & paste the text</li>
		</ul>
	</li>
</ul>

</div>

<div class="elan">

<ul>
	<li>In Elan, segment using Annotation Mode or Segmentation Mode, and transcribe using Transcription Mode</li>
	<li>Most files are in stereo, with the interviewer on the left channel and the interviewee on the right channel (although the interviewee's audio often 'bleeds' to the left channel)
		<ul>
			<li>If you're using earphones, you can remove one to isolate the other channel. Unfortunately, there's no native way to isolate one channel in Elan</li>
		</ul>
	</li>
	<li>In the course of filling in the transcription, you will sometimes find that you want to adjust the turn segmentation
		<ul>
			<li>This is easy to do in Segmentation Mode. Double-click the tier you want to adjust. Then drag turn boundaries to adjust them, or right-click on the turn to split/merge the turn</li>
		</ul>
	</li>
	<li>Elan doesn't make it easy to precisely sync boundaries across tiers, so just get it close enough
		<ul>
			<li>Before transcriptions are uploaded to APLS, they are run through a program that 'snaps together' turn boundaries across tiers</li>
		</ul>
	</li>
</ul>

</div>


### Turns of speech

- Segment speakers' speech into turns based on breath groups, not sentences&mdash;spontaneous speech seldom consists of sentences as we know them from written language!
	- Breath groups are stretches of speech in between **longer** breaths; don't break up turns at every breath
- Turns should be no longer than ~10 seconds, even if there's just one speaker for a long stretch of time
- In word list sections, don't give each word its own turn but group words into sets of ~5 within a turn
- Never put a breakpoint in the middle of a word.


### Overlaps

We have to handle **overlapping speech** carefully because of how LaBB-CAT treats overlapping turns: it excludes them from phonetic forced-alignment.
That is, any audio transcribed as overlapping can't be searched for individual segments.

- When speakers overlap speech, make the overlapped portion a separate turn on each of the speakers' tiers
	- For example, Speaker A speaks continuously from 4:00 to 4:08 and Speaker B speaks from 4:04 to 4:05 (talking over Speaker A). You should create 3 turns for Speaker A (4:00&ndash;4:04, 4:04&ndash;4:05, 4:05&ndash;4:08) and 1 turn for Speaker B (4:04&ndash;4:05)
	- Don't break up words, even if the speakers only overlap for one syllable
		<li class="elan">Again, Elan doesn't make it easy to precisely sync boundaries across tiers, so just get it close enough</li>
- This only applies to when speakers overlap speech
	- Boundaries on the `Noise` or `Comment` tiers don't have to align with speaker tiers
	- The `Redaction` tier is handled a little differently, as described just below


### Redaction

To help protect our speakers' privacy, we use **redaction** to keep sensitive personal information out of APLS.
When we mark a stretch of speech as redacted, LaBB-CAT deletes the audio and removes the redacted text

- To redact a stretch of speech, create separate turns on **two** tiers: the speaker who utters the sensitive information, plus the `Redaction` tier
- On the speaker's tier, enter `REDACT`
	- On the `Redaction` tier, enter a brief description of why you're redacting the speech (e.g., `speaker name`)
	- Treat these redactions like overlaps: they should be as short as possible to avoid deleting more information than necessary, and they should be separate from other turns. As usual for overlaps, don't split up words
	- If a redaction coincides with overlapped speech (e.g., Speaker A says their name while Speaker B says something else), enter `REDACT` on Speaker A's tier, and transcribe Speaker B normally
- You should redact any information that could uniquely identify the speaker, such as their name (first, last, or maiden name), family members' names (including distant relatives), their street address (current or childhood), etc.
	- This information comes up quite rarely in sociolinguistic interviews. More likely is _non_-unique identifying information, which does not need to be redacted: the speaker's high school, the street they grew up on (but not the street _and_ number), etc.
	- If you're unsure about whether something needs to be redacted, contact Dan





## Annotation

Once you've segmented your transcript into turns, it's time to **annotate**.
For the most part, APLS transcriptions are **orthographic**.
That is, they consist mostly of the words that speakers say, written with conventional American English spelling.
Within that framework, though, there are some important things to consider.

Reminder: In this document, `fixed-width font` is used for things you actually type into the transcription program (Elan or Praat).


### Spelling

* **Careless typos cause difficulties for our parsers&mdash;please be careful**!
- Use conventional American English spelling
- If you are unsure of how to spell something, look it up in a dictionary or Google it
	- When the speaker refers to a neighborhood or city, the name should always be capitalized even if the individual words are common nouns (e.g., `Larimer`, `the Hill`)
- <a id="dict-form"/> With the exception of disfluencies or obvious mispronunciations, words should be spelled out in their "dictionary form". That means:
	- Do **not** represent typical phonological/sociolinguistic processes like "g dropping" or consonant cluster deletion in the spelling. For example, [dʒʌmpɪ**ŋ**] and [dʒʌmpɪ**n**] should both be transcribed `jumping` not <code class="counterex">jumpin'</code>; [æ**nd**] and [æ**n**] should both be `and` not <code class="counterex">an'</code>. Do not substitute apostrophes for letters (e.g., `old` not <code class="counterex">ol'</code>).
	- <a id="eye-dialect"/> Do **not** use "eye dialect" spellings for common words (`downtown` not <code class="counterex">dahntahn</code>; `Steelers` not <code class="counterex">Stillers</code>).
		- You _can_ use a [comment](#comments-and-noises) to mention speakers' performative use of "dialect pronunciations", but this is strictly optional.
	- Using non-dictionary forms makes it harder to find words in search results and prevents the corpus software from using computational methods (e.g., part-of-speech lookup)
- **Don't tidy up the speech**. Leave in the repetitions, fillers, speech errors, bad words, mean sentiments, etc.
- Don't use capital letters for the start of new sentences. Only use capital letters for proper nouns and the pronoun _I_
- Write all numbers out in full, with spaces instead of hyphens (e.g., `one hundred and twenty three` not <code class="counterex">123</code> or <code class="counterex">one hundred and twenty-three</code>)
- When abbreviations or acronyms are used:
<<<<<<< HEAD:doc/Transcription-Convention.md
	- If each letter is said separately, use capital letters with spaces in between each letter (e.g., `P G H`)
=======
  - If each letter is said separately, use capital letters with spaces in between each letter (e.g., `P G H`)
>>>>>>> pages-in-progress:doc/transcription/transcription-convention.md
    - If the letter is pluralized, add `s` _plus_ a ["pronounce" code](#pronounce-codes) to the last letter (e.g., `D V Ds[diz]`)
	- If the word is pronounced as a word, use capitals with no spaces (e.g., `FEMA`)
- Don't use any diacritics that are not part of the English alphabet (e.g., `fiancee` not <code class="counterex">fiancée</code>)
- A single word should always be spelled as an entire word, even if there is a pause between syllables. **Never** put a breakpoint in the middle of a word.
- <a id="colloq-spellings"/> The following list represents all and only colloquial spellings that may be used in transcription: 
	- `gonna`
	- `sorta`
	- `'cause` (from _because_)
	- `kinda`
	- `gotta`
	- `I'mma`
	- `wanna`
	- `tryna`
	- `lotta`
	- `'til` (from _until_)
	- `'nother` (as in _a whole 'nother_)
	{:.wrap .fb-15 .no-bg}
- <a id="clitics"/> Standard contractions are fine (e.g., `might've`). The clitics `'d`, `'ll`, `'ve`, and `'s` can be attached to any noun
- <a id="other-interjections"/> For other interjections, select a representation from the list (IPA symbols for clarity):
	- `yup`
	- `yeah`
	- `okay` (even if [m̩keɪ])
	- `mmm`
	- `eh` /eɪ/
	- `uh huh`
	- `nah`
	- `mmm hmm`
	- `hmm`
	- `um`
	- `uh` 
	- `aw` /ɔ/
	- `oh` /oʊ/
	- `oo` /u/
	- `ahh` /ɑ/
	- `gee`
	- `jeez`
	- `whoops`
	- `ow`
	- `ha`
	- `huh`
	- `yuck`
	- `damn`
	- `hey`
	- `oof`
	- `blah`
	- `woohoo`
	{:.wrap .fb-10 .no-bg}


### Punctuation

- The only allowable punctuation marks are apostrophes and hyphens (within words) and periods, hyphens, and question marks (between words)
- Correctly use apostrophes as they would be used in standard writing (e.g., `can't`, `it's`, `John's`, `the Johnsons' house`)
- Use within-word hyphens when the hyphenated representation of a word is common in writing (e.g., `self-esteem` not <code class="counterex">short-necked</code>)
- Other than apostrophes, there should always be a space between letters and punctuation (e.g., `I know it .` not <code class="counterex">I know it.</code>)
- Don't use commas or periods to indicate clauses and sentences. Instead, use `.` for a shorter prosodic break or `-` for a longer break (a 'beat' or more)
	- You can use the hyphen to avoid breaking up halting speech into a bunch of short turns
- Do use question marks, especially if the grammatical structure does not indicate a question, but the intonation does.
	- Again, there should always be a space between question marks and any other characters.
- Don't use quotation marks around reported speech (e.g., `then he said well I suppose you could try it`)


### Comments and noises

- Non-speech noises should be notated with a brief description
	- Noises produced by individuals should be transcribed between square brackets on that individual speakers' tier (e.g., `[laughs]`, `[sniffs]`)
	- General noises should appear on the Noise tier **without** square brackets (e.g., `loud truck goes by`, `interviewer plays drums`)
	- You don't need to transcribe every single breath or sniff, just the ones that are prominent enough that a computer could confuse them for a speech sound
- Comments can be about individuals' speech or general comments
	- Comments about individuals' speech or behavior should be placed between curly brackets on the speaker's tier (e.g., `{pretends to talk like a man}`)
	- General comments can be placed on the `Comment` tier **without** curly brackets (e.g., `long period not transcribed due to microphone failure` or `the two speakers whisper together`)
	- In the "Pittsburghese" or "AAE" section of the interview, if the speaker performs "dialect forms", curly brackets can be used to remark upon their performance (e.g., `you often hear people saying downtown {performs monophthong aw}`).
		- Remember: [don't use "eye dialect" spellings](#eye-dialect), even if the speaker is clearly performing an accent other than their own.
- If a speaker laughs while speaking a single word, use the notation `{mid-word laugh}` on their tier. If a speaker laughs while speaking multiple words, use `mid-word laugh `on the `Comment` tier
- If you can't decipher what someone says, insert `[unclear]` on their tier
	- Try to minimize the use of `[unclear]`
	- It can help to re-listen to earlier sections of the interview once you've heard more of the speaker


### Pronounce codes

- There are 3 situations where you need to attach a "pronounce code" to the end of a word to help LaBB-CAT determine the phonemes that are in the word: (1) words that aren't in the dictionary, (2) idiosyncratic pronunciations, (3) hesitations/incomplete words
	- Attach the pronounce code with **no space after the word**, in square brackets (e.g., `yinzerific["jIn-z@r-'I-fIk]`)
<<<<<<< HEAD:doc/Transcription-Convention.md
	- The pronounce code uses the [DISC phonemic alphabet](phonemic-transcription) to give a phonemic representation of what was said
- <a id="novel-words"/> If a speaker uses a word that isn't in a standard dictionary or [APLS's custom dictionary](/APLS/files/custom-entries) (a word made up on the spot, a specific road name, etc.), just spell it the best you can, and provide a pronounce code in DISC (e.g., `yinzerific["jIn-z@r-'I-fIk]`)
=======
	- The pronounce code uses the [DISC phonemic alphabet]({{ '/doc/phonemic-transcription' | relative_url }}) to give a phonemic representation of what was said
- <a id="novel-words"/> If a speaker uses a word that isn't in a standard dictionary or [APLS's custom dictionary]({{ '/files/custom-entries' | relative_url }}) (a word made up on the spot, a specific road name, etc.), just spell it the best you can, and provide a pronounce code in DISC (e.g., `yinzerific["jIn-z@r-'I-fIk]`)
>>>>>>> pages-in-progress:doc/transcription/transcription-convention.md
	- If the word is used more than once in a transcript, the DISC code needs to be supplied every time
	- We can add words to APLS's custom dictionary, but only if it's a word that is likely to be used by more than just one speaker
- If a speaker pronounces a word in an idiosyncratic way (e.g., _bookshelves_ as _buckshelves_), provide a DISC code
	- Do not use a DISC code if their pronunciation is the result of a typical phonological/sociolinguistic process like pre-/l/ vowel laxing (e.g., _fail_ as [fεl]) or consonant cluster reduction (e.g., _waste_ as [weɪs]). If you're not sure, err on the side of not using a DISC code
	- Remember: [don't use "eye dialect" spellings](#eye-dialect), even if the speaker is clearly performing an accent other than their own
		- You _can_ use a [comment](#comments-and-noises) to remark upon speakers' performative use of "dialect pronunciations", but this is strictly optional
	- If the idiosyncratic pronunciation is used more than once in a transcript, the DISC code needs to be supplied every time
- Unfinished words use a tilde to mark incompleteness, plus a pronounce code and optional lexical code
	- For example, if the speaker starts to say _hesitate_ but stops after two syllables, either of the following two notations would be acceptable: `hesi~['hE-z@]`, `hesi~['hE-z@](hesitate)`
	- Optionally, you can add a lexical code, which uses English spelling to represent the intended word (if known). The lexical code goes in parentheses (`(hesitate)`) with **no space after the pronounce code**
	- <a id="single-cons-unfinished"/> You can omit pronounce codes for unfinished words that consist of just a consonant, since these are built-in to APLS's dictionary
		- For example, if the speaker just says [f], you can write just `f~` without a pronounce code
	- Words do **not** need to be marked as unfinished if their pronunciation is the result of a typical phonological/sociolinguistic process like or consonant cluster deletion
		- For example, if the speaker says _and_ as [æ**n**] rather than [æ**nd**], transcribe it as just `and`, not <code class="counterex">an~['{n]</code>
		- This is related to the principle that words should be spelled out in their ["dictionary form"](#dict-form)


## Converting between Elan and Praat

It's sometimes necessary to convert Praat (`.TextGrid`) files to Elan (`.eaf`), or vice versa.
Both can be accomplished in Elan.

### Praat to Elan

1. Import the `.TextGrid` file into Elan
	 1. In Elan, go to _File_ > _Import_ > _Praat TextGrid File_
	 1. Click _Browse..._ and find the file
	 1. Select "Skip empty intervals / annotations"
	 1. Click _Next_, then _Finish_
	 1. If you get an error message "Operation interrupted: No tiers detected in TextGrid file", the issue may be the file encoding. Redo the preceding steps but try a different encoding in the _Browse..._ popup window.
1. Link the audio with the transcript
	 1. Go to _Edit_ > _Linked Files_
	 1. Click _Add..._ and browse for the file
	 1. Click _Apply_
1. Set attributes
	 1. Set the Author attribute at _Edit_ > _Set Author_
	 1. Set each tier's Participant attribute to be the same as the tier name
		  1. Click _Tier_ > _Change Tier Attributes_
		  1. Select a tier, add the Participant attribute, and click _Change_
		  1. Repeat for all tiers, then click _Close_
	 1. Since we no longer need the `Transcriber` tier, delete it
		  1. Click _Tier_ > _Delete Tier_
		  1. Select the `Transcriber` tier, and click _Delete_
1. Save the `.eaf` file


### Elan to Praat

1. Open the `.eaf` file in Elan
1. Copy the contents of the Author attribute to a blank document so you can use it later
1. Export the file to `.TextGrid`
	 1. Go to _File_ > _Export As_ > _Praat TextGrid_
	 1. Leave all defaults as-is and click _OK_
	 1. Browse to where you want to save the file, check that the file name is correct, and click _Save_
1. Open the `.TextGrid` file in Praat and add a `Transcriber` tier
	 1. Select the file in the Objects window and click _Modify_ > _Insert interval tier..._
	 1. Fill in "Position:" with `10` and "Name:" with `Transcriber`
	 1. In the Objects window, click _View & Edit_
	 1. Click on the `Transcriber` tier and paste the contents of the Author attribute you copied earlier
1. Save the `.TextGrid` file


<script>
	/* Bold non-counterexamples not in tables */
	var c = document.querySelectorAll("*:not(td) > code:not(.counterex)");
	c.forEach(a => a.classList.add("fw-700"));

	/* <code>: Replace hyphen with nonbreaking hyphen */
	var h = document.querySelectorAll("#main-content code");
	h.forEach(a => a.innerText = a.innerText.replaceAll("-", "\u2011"));
</script>
