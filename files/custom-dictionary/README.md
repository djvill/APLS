# `custom-dictionary/`

This folder contains files for APLS's custom dictionary.

APLS uses dictionaries to match individual words in a transcript to their phonemic representations.
Its 'default' dictionary is the [Unisyn](https://www.cstr.ed.ac.uk/projects/unisyn/) lexicon for American English, which covers most of the words in any given transcript.
The custom dictionary supplements Unisyn, with words in a few categories:

- Names from Pittsburgh/western PA physical geography, human geography, and/or culture (e.g., neighborhoods like _Shadyside_, municipalities like _Sewickley_, streets like _Baum_, schools like _Milliones_, notable local figures like _Stargell_)
- Brand/business names, whether local (e.g., _Pelusi_) or not (e.g., _Highmark_, _Panera_)
- Pittsburgh lexical features, whether stereotypical (e.g., _redd_, _gumband_) or not (e.g., _Trib_, _WAMO_)
- Non-Pittsburgh-specific words that are absent from Unisyn, sometimes unexpectedly (_artsy_, _bachelorette_, _homie_, _Kwanzaa_, _microbrew_, _stepdad_, _tarp_, _y'all_)
- Restricted mini-lexicons specified in the APLS transcription convention: [colloquial spellings](https://djvill.github.io/APLS/doc/Transcription-Convention.html#colloq-spellings) (e.g., _gonna_), [interjections](https://djvill.github.io/APLS/doc/Transcription-Convention.html#other-interjections) (e.g., _yup_), and [single-phoneme hesitation codes](https://djvill.github.io/APLS/doc/Transcription-Convention.html#single-cons-unfinished) (e.g., _f~_ for [f])


## Contents of this folder


[The txt gets used for ELAN file checker]


## How to add dictionary entries


### Deciding on entries and phonemic transcription

First, decide whether you even _need_ to add a new entry.
Words made up on the spot shouldn't be added, nor should words that aren't likely to be used by more than one speaker.
For these "novel words", transcribers should instead specify the phonemic transcription inline, as described in the [transcription convention](https://djvill.github.io/APLS/doc/Transcription-Convention.html#novel-words).
I am _much_ more wary of adding entries to the restricted mini-lexicons specified in the APLS transcription convention;
having transcribers decide, for example, between _don't know_ and _dunno_ only adds to the complexity of the task of transcription.
Aside from these restricted mini-lexicons, feel free to err on the side of adding a word to the dictionary.

[Give lemme example]

### Building the custom dictionary

You'll need the following software:

- 
