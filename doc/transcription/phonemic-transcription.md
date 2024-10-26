---
title: Phonemic transcription with the DISC alphabet
layout: default
permalink: /doc/phonemic-transcription
parent: Transcription
nav_order: 3
last_modified_date: 2024-10-26T16:15:12-04:00
---


# {{ page.title }}
{:.no_toc}

<!-- At some point, split this out into its own page for end-users rather than transcribers -->
APLS primarily uses the **DISC phonemic alphabet**[^celex] for representing speech sounds (specifically, phonemes), rather than the [International Phonetic Alphabet](https://en.wikipedia.org/wiki/International_Phonetic_Alphabet) (IPA).
DISC creates a one-to-one mapping between sounds and symbols like the IPA, but _unlike_ the IPA, DISC only uses symbols that appear on a standard [QWERTY keyboard](https://en.wikipedia.org/wiki/QWERTY).
While the IPA is well-recognized among linguists, many IPA characters are hard for end-users to input and difficult for computers to store.[^why-not-ipa]
As a result, APLS uses DISC internally for _storing_ and _searching_ phonological data, it _exports_ phonological data in DISC, and APLS _transcribers_ use DISC for ["pronounce codes"](https://djvill.github.io/APLS/doc/transcription-convention#pronounce-codes) when a word's pronunciation needs to be specified (e.g., an incomplete word).
In APLS, IPA is used only for _displaying_ phonological data to end-users.

[^celex]: DISC, developed for the [CELEX](https://catalog.ldc.upenn.edu/LDC96L14) project, stands for **di**stinct **s**ingle **c**haracters. For more details, see CELEX [English documentation](https://catalog.ldc.upenn.edu/docs/LDC96L14/eug_let.pdf), section 2.4.1 (starting on p. 30 of the PDF).

[^why-not-ipa]: 
    For the purpose of representing speech sounds in a database like APLS, IPA has several substantial drawbacks:

    - Variability in representations: What is the IPA transcription for the phoneme in English _prize_? Depending on the author, it might be `aɪ` or `aj` or `ai`. The "ch" affricate might be `t͡ʃ` or `tʃ`; the last sound(s) in _apple_ might be `əl` or `əɫ` or `l̩`. This effectively breaks the one-to-one sound-symbol mapping that is absolutely necessary from a data perspective.
    - Lookalike characters: `g` (typewriter g) is often substituted for `ɡ`, `:` (colon) for `ː`, `'` (apostrophe) for `ˈ`, superscript `j` for `ʲ`, etc. This also breaks the one-to-one mapping, and it can lead to hard-to-detect inconsistencies in the data.
    - Multiple characters per phoneme: Some phonemes are represented with more than one IPA character because they're multi-part sounds (e.g., diphthongs, affricates). This makes it harder to split strings of phonemes into individual phonemes, which has implications for large-scale processing of phonological data.
    
    It must be said that DISC is not drawback-free:
    
    - Unfamiliarity and adoption: Very few linguists are familiar with DISC, although [most non-syllabic consonants](#non-syllabic-consonants) match their IPA counterparts.
    - Linguistically limited: Although it's not relevant to APLS, DISC is limited to English, German, and Dutch.
    - Pre-/ɹ/ vowels: In keeping with [Wells lexical sets](https://en.wikipedia.org/wiki/Lexical_set), DISC provides different symbols for (e.g.) the vowels in _near_ and _fleece_. There is phonetic, phonological, and historical evidence for these being different phonemes in even rhotic varieties of English---hence why it was decided that the APLS subset of DISC would retain this distinction---but this may present a learning curve for North American Englishes researchers who aren't accustomed to thinking of these as separate phonemes. ([By convention](#transcribing-words-using-disc), these are always followed by the `r` phoneme in APLS.)
    - Some overlap: Two symbols each correspond to a pair of [Wells lexical sets](https://en.wikipedia.org/wiki/Lexical_set): `@` for commA and lettER, `$` for thought and force. 
    - Escape characters: Some DISC characters have special meaning in regular expressions (e.g., `{`, `$`), so they need to be "escaped" to be interpreted literally. That said, some other ASCII-based phonetic alphabets are much more challenging in this regard (e.g., [X-SAMPA](https://en.wikipedia.org/wiki/X-SAMPA) uses `\`).

APLS uses a subset of DISC relevant to North American Englishes.
In APLS, we use DISC symbols for _phonemic_ representations of sounds, not _phonetic_ representations.
As a result, the APLS subset of DISC doesn't have symbols for [ɾ] or [ʔ] (flap or glottal stop); in North American Englishes, these surface only as allophones of /t/.

In this document, `fixed-width font` is used for symbols you actually type into APLS search fields or a transcription program (Praat or Elan).


{% include page_toc.html collapsible=true %}


## DISC consonants


### Non-syllabic consonants

| IPA | DISC |    English   |      DISC     |
|-----|------|--------------|---------------|
|  p  |   p  | **p**at      |  **p**{t      |
|  b  |   b  | **b**ad      |  **b**{d      |
|  t  |   t  | **t**ack     |  **t**{k      |
|  d  |   d  | **d**ad      |  **d**{d      |
|  k  |   k  | **c**ad      |  **k**{d      |
|  ɡ  |   g  | **g**ap      |  **g**{p      |
|  f  |   f  | **f**ad      |  **f**{d      |
|  v  |   v  | **v**at      |  **v**{t      |
|  θ  |   T  | **th**in     |  **T**In      |
|  ð  |   D  | **th**en     |  **D**En      |
|  s  |   s  | **s**ap      |  **s**{p      |
|  z  |   z  | **z**ap      |  **z**{p      |
|  ʃ  |   S  | **sh**eep    |  **S**ip      |
|  ʒ  |   Z  | mea**s**ure  |  mE**Z**@r    |
|  h  |   h  | **h**ad      |  **h**{d      |
|  tʃ |   J  | **ch**eap    |  **J**ip      |
|  dʒ |   _  | **j**eep     |  **\_**ip     |
|  m  |   m  | **m**ad      |  **m**{d      |
|  n  |   n  | **n**at      |  **n**{t      |
|  ŋ  |   N  | ba**ng**     |  b{**N**      |
|  l  |   l  | **l**ad      |  **l**{d      |
|  ɹ  |   r  | **r**ad      |  **r**{d      |
|  w  |   w  | **w**et      |  **w**Et      |
|  j  |   j  | **y**et      |  **j**Et      |
{:.disc-table}


### Syllabic consonants

| IPA | DISC |    English   |      DISC     |
|-----|------|--------------|---------------|
|  m̩  |   F  | idealis**m** |  2dilIz**F**  |
|  n̩  |   H  | burd**en**   |  b3rd**H**    |
|  l̩  |   P  | dang**le**   |  d{Ng**P**    |
{:.disc-table}


## DISC vowels 

### Monophthongs not before /ɹ/ {#monophthongs-not-before-r}

| IPA | DISC |    English   |      DISC     |
|-----|------|--------------|---------------|
|  i  |   i  | fl**ee**ce   |  fl**i**s     |
|  ɪ  |   I  | k**i**t      |  k**I**t      |
|  ε  |   E  | dr**e**ss    |  dr**E**s     |
|  æ  |   {  | tr**a**p     |  tr**{**p     |
|  ɑ  |   Q  | l**o**t      |  l**Q**t      |
|  ɔ  |   \$ | th**ough**t  |  T**\$**t     |
|  ʌ  |   V  | str**u**t    |  str**V**t    |
|  ʊ  |   U  | f**oo**t     |  f**U**t      |
|  u  |   u  | g**oo**se    |  g**u**s      |
|  ə  |   @  | comm**a**    |  kQm**@**     |
{:.disc-table}


### Monophthongs before /ɹ/ {#monophthongs-before-r}

| IPA | DISC |    English   |      DISC     |
|-----|------|--------------|---------------|
|  ɪɹ |  7r  | n**ear**     |  n**7r**      |
|  εɹ |  8r  | squ**are**   |  skw**8r**    |
|  aɹ |  #r  | st**ar**t    |  st**#r**t    |
|  ɝ  |  3r  | n**ur**se    |  n**3r**s     |
|  ɔɹ |  \$r | f**or**ce    |  f**\$r**s    |
|  ʊɹ |  9r  | c**ure**     |  kj**9r**     |
|  ɚ  |  @r  | lett**er**   |  lEt**@r**    |
{:.disc-table}


### Diphthongs

| IPA | DISC |    English   |      DISC     |
|-----|------|--------------|---------------|
|  eɪ |   1  | f**a**ce     |  f**1**s      |
|  aɪ |   2  | pr**i**ce    |  pr**2**s     |
|  aʊ |   6  | m**ou**th    |  m**6**T      |
|  ɔɪ |   4  | ch**oi**ce   |  J**4**s      |
|  oʊ |   5  | g**oa**t     |  g**5**t      |
{:.disc-table}


## Transcribing words using DISC

As noted above, DISC transcription is phonemic rather than phonetic.
Here are some other things to note:

- Monophthongs before /ɹ/ should always be transcribed with the DISC `r` symbol (see examples [above](#monophthongs-before-r))
	- Exception: the speaker cuts off the word before an /ɹ/ (e.g., cutting off _start_ as `sta~[st#]`
- IPA makes a distinction between _stressed_ central vowels /ʌ ɝ/ and _unstressed_ central vowels /ə ɚ/. Similiarly, use DISC `V`/`3r` for _stressed_ vowels and `@`/`@r` for _unstressed_ vowels
	- Exception: Always use `3r` for _-burg(h)_, even if it's unstressed (e.g., _Pittsburghese_ is `pItsb3rgiz` not <code class="counterex">pItsb@rgiz</code>)
- Use the DISC symbols for syllabic consonants, `F`/`H`/`P`, rather than <code class="counterex">@m</code>/<code class="counterex">@n</code>/<code class="counterex">@l</code> (see examples [above](#syllabic-consonants))
	- Exception: Don't use these symbols for onsets (e.g., _Panera_ is `p@n8r@`, not <code class="counterex">pH8r@</code>)
- For word-final high front vowels, use `i` rather than `I` (i.e., we assume universal [_happy_-tensing](https://en.wikipedia.org/wiki/Phonological_history_of_English_close_front_vowels#Happy-tensing))
- When /ŋ/ comes before a vowel or syllabic consonant, assume it's followed by /g/ (e.g., _dangle_ is `d{NgP`, not <code class="counterex">d{NP</code>)
- Don't forget that _nk_ in English spelling is usually /ŋk/ (DISC `Nk`) rather than /nk/ (DISC <code class="counterex">nk</code>)
- If you have the _cot_–_caught_ merger in production and/or perception, ask a non-merged friend to help you decide whether to transcribe `Q` or `$`.
- Unstressed vowels can be tricky!
  - For "schwi", use `@` rather than `I` (e.g., _breathless_ is `brETl@s` not <code class="counterex">brETlIs</code>)
  - Same for _'s_ after a sibilant (e.g., _Lutz's_ is `lVts@z` not <code class="counterex">lVtsIz</code>)
  - Again, use `@` for unstressed mid-central vowels ("schwa") and `@r` pre-/ɹ/
- There's no [ɾ] (flap) symbol; instead, use `t` or `d` as suggested by orthography, even if it doesn't match the voicing of the surface segment (e.g., _Bettis_ is `bEtIs`, not <code class="counterex">bEdIs</code>)

## Suggesting new dictionary entries

APLS uses two sources to look up phonemic representations: (1) the Unisyn English dictionary (which is supposed to be a universal English dictionary), and (2) a [custom dictionary](/APLS/files/custom-entries).
Occasionally you'll run across a word that needs to be added to APLS's custom dictionary.
Most often this will be a Pittsburgh/western PA geographic name (e.g., neighborhoods like _Shadyside_, municipalities like _Sewickley_, streets like _Baum_, schools like _Milliones_), a brand name (e.g., _Highmark_, _Panera_), or a Pittsburgh lexical feature (e.g., _redd_, _gumband_).
However, there are words that aren't Pittsburgh-specific that are absent from Unisyn, sometimes unexpectedly;
for example, we've had to manually add entries for _artsy_, _bachelorette_, _homie_, _Kwanzaa_, _microbrew_, _stepdad_, _tarp_, and _y'all_ (among others).


If a word falls into one of the preceding categories, it should be added to the APLS dictionary.
On the other hand, if a word is unlikely to be used by more than one speaker, it's better to just use an [inline pronounce code](transcription-convention#pronounce-codes).


Everything from the previous sections applies to new words that you suggest for the custom dictionary, plus the following:

1. If applicable, you can suggest 2+ phonemic representations per word (but this is optional)
1. Use the speech community's pronunciation(s)
1. Add symbols to mark syllabification and stress


### Multiple phonemic representations

APLS's custom dictionary can contain multiple phonemic representations for any given word.
For example, the first vowel in _Lawrenceville_ can rhyme with either _shore_ or _far_ (`$r` or `#r`).
In that case, just suggest the full DISC representation twice: `'l$r-Hs-"vIl` or `'l#r-Hs-"vIl`.


Keep in mind that these are _phonemic_ representations.
This means that we don't add separate entries that reflect variable phonological processes like consonant cluster deletion.
For example, even though Pittsburghers pronounce _gumband_ as both [ˈgʌmbæ**nd**] and [ˈgʌmbæ**n**], only `'gVm-b{nd` should go in APLS's custom dictionary.


### Use the speech community's pronunciation(s)

APLS's dictionary entries should reflect Pittsburgh English speakers' mental lexicons.
That means that if Pittsburgh English speakers have a different mental representation for a word than we'd expect based on the word's spelling or our experience, APLS's dictionary needs to include the local phonemic representation.
For example, Pittsburghers often pronounce _Carnegie_ as [kɑɹ.ˈneɪ.gi], whereas non-Pittsburghers almost always use [ˈkɑɹ.nə.gi].
In the course of a single transcription, it's impossible to know whether a particular pronunciation is widespread, so use your best judgment.
As mentioned [above](#multiple-phonemic-representations), you can suggest multiple representations for a word, as long as they're _phonemic_ representations.


### Syllabification and stress

| DISC | Function          | Note                             |
|------|-------------------|----------------------------------|
|  `-` | Syllable boundary |                                  |
|  `'` | Primary stress    |                                  |
|  `"` | Secondary stress  |                                  |
|  `0` | No stress         | Only for the **syllables** layer |
{:#syll-table .no-bg}

For example, _Pennsylvanian_ is `"pEn-sP-'v1n-jH`. 
Stress markers go before any other DISC symbols, but (if applicable) after the syllable boundary.
Unstressed syllables get no stress markers.

A few finer points:

- Every _complete_ word has one primary-stressed syllable. _Incomplete_ words with hesitations might not have a primary-stressed syllable, but the APLS custom dictionary won't have incomplete words
	- Most words don't have secondary stress. Compounds often do have secondary stress (e.g., _Sandcastle_ is `'s{nd-"k{-sP`)
- Use secondary stress for city-name morphemes _-burg(h)_, _-ville_, _-vale_, _-dale_, _-town_, etc.
	- Exception: There are derivational affixes that change the stress pattern (e.g., _Pittsburgh_ is `'pIts-"b3rg`, but _Pittsburghese_ is `"pIts-b3r-'giz`)
- Intervocalic consonants should be syllabified as onsets rather than codas (e.g., _Bettis_ is `'bE-tIs` not <code class="counterex">'bEt-Is</code>)
	- Exception 1: Intervocalic /ɹ/ should be syllabified as a coda (e.g., _Panera_ is `p@-'n8r-@` not <code class="counterex">p@-'n8-r@</code>)
	- Exception 2: In environments where prevocalic /t/ becomes [ʔ] (e.g., before /n̩/), the /t/ should be syllabified as a coda (e.g., _outen_ is `'6t-H` not <code class="counterex">'6-tH</code>)

<script>
	/* Add headers above consonants and vowels tables */
	var newHead = `
		<tr class="ex-word">
			<th colspan='2'/>
			<th colspan='2'>
				<div>Example word</div>
			</th>
		</tr>
	`;
	var t = document.querySelectorAll(".disc-table thead tr");
	t.forEach(a => a.insertAdjacentHTML('beforebegin', newHead));

	/* Bold non-counterexamples not in tables */
	var c = document.querySelectorAll("*:not(td) > code:not(.counterex)");
	c.forEach(a => a.classList.add("fw-700"));

	/* <code>: Replace hyphen with nonbreaking hyphen */
	var h = document.querySelectorAll("#main-content code");
	h.forEach(a => a.innerText = a.innerText.replaceAll("-", "\u2011"));
</script>

### Pause marker (**foll_segment** only)

| DISC | Function |
|------|----------|
|  `.` | Pause    |
{: .no-bg}

The **foll_segment** layer uses all the usual DISC characters with one addition: `.` as a pause marker. 
Knowing that a segment is followed by a phone can be useful for categorizing certain phonological effects, and an explicit symbol signals to end-users that this is not missing data.
`.` was chosen because it is a keyboard (ASCII) character, and it already denotes pauses in similar notation systems: [Extensions to the IPA](https://en.wikipedia.org/wiki/Extensions_to_the_International_Phonetic_Alphabet#Prosodic_notation_and_indeterminate_sounds), [Jeffersonian (conversation analysis) transcription](https://en.wikipedia.org/wiki/Conversation_analysis#Jeffersonian_transcription), etc.
