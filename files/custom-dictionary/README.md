---
title: Custom dictionary
layout: default
permalink: /files/custom-dictionary
last_modified_date: 2023-08-29T09:55:44-04:00
---

# {{ page.title }}
{:.no_toc}


The folder [`/files/custom-dictionary/`](https://github.com/djvill/APLS/tree/main/files/custom-dictionary) contains files for APLS's custom dictionary.

{% include page_toc.html collapsible=true %}

## Intro

APLS uses **pronouncing dictionaries** to match individual words in a transcript to their phonemic representations.
Its 'default' dictionary is the [Unisyn](https://www.cstr.ed.ac.uk/projects/unisyn/) lexicon for American English, which covers most of the words in any given transcript.
The custom dictionary supplements Unisyn, with words in a few categories:

- Names from Pittsburgh/western PA physical geography, human geography, and/or culture (e.g., neighborhoods like _Shadyside_, municipalities like _Sewickley_, streets like _Baum_, schools like _Milliones_, notable local figures like _Stargell_)
- Brand/business names, whether local (e.g., _Pelusi_) or not (e.g., _Highmark_, _Panera_)
- Pittsburgh lexical features, whether stereotypical (e.g., _redd_, _gumband_) or not (e.g., _Trib_, _WAMO_)
- Non-Pittsburgh-specific words that are absent from Unisyn, sometimes unexpectedly (_artsy_, _bachelorette_, _homie_, _Kwanzaa_, _microbrew_, _stepdad_, _tarp_, _y'all_)
- Restricted mini-lexicons specified in the APLS transcription convention: [colloquial spellings](/APLS/doc/Transcription-Convention#colloq-spellings) (e.g., _gonna_), [interjections](/APLS/doc/Transcription-Convention#other-interjections) (e.g., _yup_), and [single-phoneme hesitation codes](/APLS/doc/Transcription-Convention#single-cons-unfinished) (e.g., _f~_ for [f])



## (For corpus admins) How to add dictionary entries

{: .note }
> This section is meant for users with **admin access** to APLS. However, other users may find this section useful to understand the processes that go into making APLS.


1. Decide whether you even _need_ to add a new entry
2. Add the word, plus any inflectional forms like plurals or _-ing_, to [`APLS-dict.csv`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/APLS-dict.csv)
3. Update the Elan file checker's dictionary ([`updateDict.sh`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/updateDict.sh) + commit/push changes)
4. Update APLS's internal dictionary


### To add or not to add?

Transcribers will suggest new dictionary entries as they work on transcriptions, typically because a word got flagged by the [Elan file checker's](https://djvill.shinyapps.io/apls_elan_file_checker/) step 2.
It's up to the corpus maintainer whether to add these entries, or whether transcribers should specify the phonemic transcription inline (see [transcription convention sec. 3.4](/APLS/doc/Transcription-Convention#pronounce-codes)).

Add the word if:

1. It's likely to be used by **more than one speaker**
   - **Examples:** <span class="goodex">Monongahela</span>  <span class="goodex">Panera</span>  <span class="badex">(word made up on the spot)</span>
   - **Rationale:** If a word gets added to the dictionary, it'll save future transcribers time and ensure quality control
   - **Transcribers should:** Use an inline pronounce code
   - **Note:** This criterion is by far the most subjective! If the word satisfies all the other criteria, err on the side of adding it
2. It's not a **new [colloquial spelling](/APLS/doc/Transcription-Convention#colloq-spellings) or [interjection](/APLS/doc/Transcription-Convention#other-interjections)**
   - **Examples:** <span class="badex">dunno</span>  <span class="badex">er</span>  <span class="badex">ahem</span>
   - **Rationale:** We want to avoid "coding while transcribing". If transcribers have the choice between (e.g.) _don't know_ and _dunno_, they'll have to spend time deciding which one the speaker uttered. That's really a question for future sociolinguistic investigation, not something to be decided at the transcription stage
   - **Transcribers should:** Depending on the situation, use a standard spelling, a [hesitation code](/APLS/doc/Transcription-Convention#pronounce-codes), or a [noise code](/APLS/doc/Transcription-Convention#pronounce-codes)
   - **Note:** We can consider waiving this criterion only if the evidence is really, really strong. See [below](#example-lemme) for an example of this principle in action.
3. It doesn't **violate existing rules** in the transcription convention
   - **Examples:** <span class="badex">412</span>  <span class="badex">IBM</span>  <span class="badex">colllect</span>  <span class="badex">jumpin'</span>  <span class="badex">résumé</span>  <span class="badex">Picksburgh</span>
   - **Rationale:** We have those rules for good reasons! Plus, allowing "eye dialect" forms like _Picksburgh_ leads to "coding while transcribing"
   - **Transcribers should:** Correct their spelling
4. It's not **already in the Unisyn dictionary**
   - **Rationale:** LaBB-CAT won't update a dictionary entry if it's in Unisyn (it will update custom dictionary entries if needed)
   - **Transcribers should:** Do nothing
   - **Notes:**
     - Don't assume that pluralized forms are in the Unisyn dictionary!
     - If the Elan file checker flags a form, it's not in either dictionary.
     - If you accidentally add a word that turns out to have been in Unisyn, you'll get the message <span class="lc-error">word in the read-only part of the dictionary</span> when you try to [upload it to APLS](https://djvill.github.io/APLS/files/custom-dictionary#update-aplss-internal-dictionary). If that happens, simply delete the word from the custom dictionary
5. It's not a **vulgar and/or objectionable** word
   - **Rationale:** Since the APLS dictionary gets published on the open web, we don't want it to show up in search engine results associated with racial slurs, etc.
   - **Transcribers should:** Use an inline pronounce code


_Non_-criteria:

- Words do **not** have to be Pittsburgh-specific to be added to the dictionary
- Words do **not** have to conform to prescriptive notions of what is or isn't a word---as long as they're not colloquial or "eye dialect" spellings


#### Example: _lemme_

In May 2023, an RA asked:

>  I've had a speaker use _lemme_ and was wondering if it's a potential candidate to be added to the conventions alongside _gonna_ and the like?

In other words, is it worth adding _lemme_ as an alternative to _let me_?

_lemme_ clearly satisfies most criteria;
it is not vulgar or objectionable, it's not already in Unisyn (we know because it was flagged by the Elan file checker), it doesn't violate any existing rules, and it seems likely to be used by more than one speaker.
However, it would mean expanding a restricted mini-lexicon, colloquial spellings, so it deserves extra scrutiny.


If we added _lemme_ to the dictionary, we would have to think about whether existing tokens of _let me_ should remain _let me_ or be re-transcribed as _lemme_.
I performed a search in APLS for tokens of _let me_ (searching the **orthography** layer for `let` followed by `me`); 
the results are in [`results_(let)_(me).csv`](results_(let)_(me).csv).
I sent the RAs the wav and TextGrid files for these tokens, along with this message:

> There are currently 19 tokens of _let me_ in APLS. Give a listen to some of them, and we can consider adding "lemme" only if (1) it's obvious that there's variation between _lemme_ vs. _let me_ and (2) it's obvious which is which. In general, there's lots of expressions that get phonologically reduced in spontaneous speech beyond their orthographic representation, so I want to be conservative with which ones get added to the list


After listening to the files, the RAs found that it wasn't always obvious whether a token was _lemme_ or _let me_.
In other words, having to decide between _lemme_ or _let me_ would have required transcribers to "code while transcribing".
We decided not to add _lemme_ to the dictionary.


#### Dialect pronunciations

In rare cases, a word that exists across dialects will have a unique pronunciation in just one speech community that is unrelated to more general phonological features that characterize the dialect.
For example, _Carnegie_ is /ˈkɑɹ-nə-gi/ in "general American", /kɑɹ-ˈneɪ-gi/ in Pittsburgh, which doesn't seem to be the result of a phonological process affecting other words in Pittsburgh English.


We have to handle these words in a special way.
If a word is already in Unisyn, LaBB-CAT won't update the word's dictionary entry;
you'll get an error like <span class="lc-error">Line 1 word _water_ ignored: word in the read-only part of the dictionary</span>.
So rather than adding the word to the custom dictionary, we have to change Unisyn's representation of the word;
if you have access to the `APLS-Admin` repo, see here for directions: https://github.com/djvill/APLS-Admin/blob/main/doc/dictionary-phonemes/README.md.


Note: These "dialect pronunciations" are not the same as [_idiosyncratic pronunciations_](../../doc/Transcription-Convention#pronounce-codes).
The former are shared by a speech community (or a decent subset thereof);
the latter are isolated to a single speaker and should be transcribed with an inline pronounce code.
Of course, what might appear at first blush to be an idiosyncratic pronunciation may, upon further examination, turn out to be more common in the speech community;
if that happens, we can always revisit the issue and add a new dialect pronunciation.


### Add the word

Add the word to [`APLS-dict.csv`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/APLS-dict.csv).
Edit the file in a text editor, **not in Excel**, as Excel will mess up the formatting by adding extra characters.
Simply add a new line under the appropriate category heading: `<word>,<phonemes>`.
The category headings are semi-arbitrary and don't affect anything meaningful, so just pick whichever one seems right.

Use the DISC phonemic alphabet, as described [here](/APLS/doc/Phonemic-Transcription).
Please pay attention to the extra considerations for [suggesting new dictionary entries](/APLS/doc/Phonemic-Transcription#suggesting-new-dictionary-entries): multiple phonemic representations per word, the speech community's pronunciation(s), and syllabification/stress.

You'll also need to add inflectional forms, like plurals, verbal forms like _-s_, _-ing_, etc.
You do **not** need to add [cliticized forms](/APLS/doc/Transcription-Convention) (e.g., _Pittsburgh's_);
APLS automatically adjusts pronunciations to account for clitics, and the Elan file checker is programmed to ignore _X's_ if _X_ is in the dictionary.
(The transcription convention says certain clitics can be added to any _noun_, but the implementation of clitics in APLS and the file checker aren't actually restricted to nouns.)
If you supplied multiple entries for the base-form of the word, you should also add multiple entries for each inflected form.


### Update the Elan file checker's dictionary

This is the easiest part---once you've got your computer set up for it:

1. Pull updates from the [GitHub repository](https://github.com/djvill/APLS)
2. Run [`updateDict.sh`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/updateDict.sh)
3. Commit and push your changes to GitHub.

That's it!

The [Elan file checker](https://djvill.shinyapps.io/apls_elan_file_checker/) reads `aplsDict.txt` from this repository;
in turn, `aplsDict.txt` gets created from `APLS-dict.csv` when you run `updateDict.sh`.
That means if you update `APLS-dict.csv` but don't do this step, the Elan file checker will throw errors in step 2.

Requirements:

- Software
	- Git
	- Bash (if not included as Git Bash in Git install)
	- R
		- Packages `readr`, `stringr`, `purrr`, and dependencies
		- R must be in your PATH (and it probably is, if you've installed R). You can tell that R is in your PATH if running `Rscript -e R.version.string` at the command line prints your R version. If not, follow directions for [Windows](https://info201.github.io/r-intro#windows-command-line), [macOS](https://www.architectryan.com/2012/10/02/add-to-the-path-on-mac-os-x-mountain-lion/#.Uydjga1dXDg), or [Unix](https://unix.stackexchange.com/a/26059)
- GitHub account
- Push access to <https://github.com/djvill/APLS>


### Update APLS's internal dictionary

Currently, you have to update the custom dictionary for **two** separate layers in APLS: **dictionary_phonemes** and **phonemes_no_clitic**.
Go to the [word layers page](https://labb-cat.linguistics.pitt.edu/labbcat/admin/layers/word) (note: you must have admin access, or else you'll get "ERROR 403").
For each layer:

1. Click on the dictionary icon: ![a yellow book with a white bookmark](https://labb-cat.linguistics.pitt.edu/labbcat/user-interface/en/assets/book.svg){:height="14px" width="14px"}
1. Drag and drop [`APLS-dict.csv`](APLS-dict.csv) to the "Choose File" button, and click "Import From CSV"
1. You'll see a ton of lines indicating entries that _weren't_ added, such as
   - **Line 1 word // APLS custom dictionary not deleted: isn't in the dictionary**
   - **Line 9 word Wilkinsburg definition 'wIl-kInz-"b3rg ignored: definition already in the dictionary**
1. These are normal. At the very bottom, you should see **Entries added: 17** (or some other number), with the new entries listed below.
1. If you see any lines in red like <span class="lc-error">Line 1 word _water_ ignored: word in the read-only part of the dictionary</span>, then either:
   - Delete the word (if you didn't mean to provide a dialect pronunciation), or
   - Follow the steps for [dialect pronunciations](#dialect-pronunciations)


### If you need to correct a custom entry

<!-- ADD -->
