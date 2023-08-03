# `custom-dictionary/`

This folder contains files for APLS's custom dictionary (browse files [here](https://github.com/djvill/APLS/tree/main/files/custom-dictionary)).

APLS uses **pronouncing dictionaries** to match individual words in a transcript to their phonemic representations.
Its 'default' dictionary is the [Unisyn](https://www.cstr.ed.ac.uk/projects/unisyn/) lexicon for American English, which covers most of the words in any given transcript.
The custom dictionary supplements Unisyn, with words in a few categories:

- Names from Pittsburgh/western PA physical geography, human geography, and/or culture (e.g., neighborhoods like _Shadyside_, municipalities like _Sewickley_, streets like _Baum_, schools like _Milliones_, notable local figures like _Stargell_)
- Brand/business names, whether local (e.g., _Pelusi_) or not (e.g., _Highmark_, _Panera_)
- Pittsburgh lexical features, whether stereotypical (e.g., _redd_, _gumband_) or not (e.g., _Trib_, _WAMO_)
- Non-Pittsburgh-specific words that are absent from Unisyn, sometimes unexpectedly (_artsy_, _bachelorette_, _homie_, _Kwanzaa_, _microbrew_, _stepdad_, _tarp_, _y'all_)
- Restricted mini-lexicons specified in the APLS transcription convention: [colloquial spellings](https://djvill.github.io/APLS/doc/Transcription-Convention.html#colloq-spellings) (e.g., _gonna_), [interjections](https://djvill.github.io/APLS/doc/Transcription-Convention.html#other-interjections) (e.g., _yup_), and [single-phoneme hesitation codes](https://djvill.github.io/APLS/doc/Transcription-Convention.html#single-cons-unfinished) (e.g., _f~_ for [f])



## (For maintainers) How to add dictionary entries

1. Decide whether you even _need_ to add a new entry
2. Add the word, plus any inflectional forms like plurals or _-ing_, to [`APLS-dict.csv`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/APLS-dict.csv)
3. Update the Elan file checker's dictionary ([`updateDict.sh`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/updateDict.sh) + commit/push changes)
4. Update APLS's internal dictionary


### To add or not to add?

Transcribers will suggest new dictionary entries as they work on transcriptions, typically because a word got flagged by the [Elan file checker's](https://djvill.shinyapps.io/apls_elan_file_checker/) step 2.
It's up to the corpus maintainer whether to add these entries, or whether transcribers should specify the phonemic transcription inline (see [transcription convention sec. 3.4](https://djvill.github.io/APLS/doc/Transcription-Convention.html#novel-words)).

Add the word if:

1. It's likely to be used by **more than one speaker**
		- **Examples:** <span class="goodex">Monongahela</span>  <span class="goodex">Panera</span>  <span class="badex">(word made up on the spot)</span>
		- **Rationale:** If a word gets added to the dictionary, it'll save future transcribers time and ensure quality control
		- **Transcribers should:** Use an inline pronounce code
		- **Note:** This criterion is by far the most subjective! If the word satisfies all the other criteria, err on the side of adding it
2. It's not a **new [colloquial spelling](https://djvill.github.io/APLS/doc/Transcription-Convention.html#colloq-spellings) or [interjection](https://djvill.github.io/APLS/doc/Transcription-Convention.html#other-interjections)**
		- **Examples:** <span class="badex">dunno</span>  <span class="badex">er</span>  <span class="badex">ahem</span>
		- **Rationale:** We want to avoid "coding while transcribing". If transcribers have the choice between (e.g.) _don't know_ and _dunno_, they'll have to spend time deciding which one the speaker uttered. That's really a question for future sociolinguistic investigation, not something to be decided at the transcription stage
		- **Transcribers should:** Depending on the situation, use a standard spelling, a [hesitation code](https://djvill.github.io/APLS/doc/Transcription-Convention.html#unfinished-words-and-novel-words), or a [noise code](https://djvill.github.io/APLS/doc/Transcription-Convention.html#unfinished-words-and-novel-words)
3. It doesn't **violate existing rules** in the transcription convention
		- **Examples:** <span class="badex">412</span>  <span class="badex">IBM</span>  <span class="badex">colllect</span>  <span class="badex">jumpin'</span>  <span class="badex">résumé</span>  <span class="badex">Picksburgh</span>
		- **Rationale:** We have those rules for good reasons! Plus, allowing "eye dialect" forms like _Picksburgh_ leads to "coding while transcribing"
		- **Transcribers should:** Correct their spelling
4. It's not **already in the Unisyn dictionary**
		- **Rationale:** LaBB-CAT won't update a dictionary entry if it's in Unisyn (it will update custom dictionary entries if needed)
		- **Transcribers should:** Do nothing
		- **Note:** Don't assume that pluralized forms are in the Unisyn dictionary! If the Elan file checker flags a form, it's not in either dictionary
5. It's not a **vulgar and/or objectionable** word
		- **Rationale:** Since the APLS dictionary gets published on the open web, we don't want it to show up in search engine results associated with racial slurs, etc.
		- **Transcribers should:** Use an inline pronounce code


_Non_-criteria:

- Words do **not** have to be Pittsburgh-specific to be added to the dictionary
- Words do **not** have to conform to prescriptive notions of what is or isn't a word---as long as they're not colloquial or "eye dialect" spellings


#### Example: _lemme_


#### Idiosyncratic pronunciations vs. dialect pronunciations

[Ex: _Carnegie_]


### Add the word

Add the word to [`APLS-dict.csv`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/APLS-dict.csv).
Edit the file in a text editor, **not in Excel**, as Excel will mess up the formatting by adding extra characters.
Simply add a new line under the appropriate category heading: `<word>,<phonemes>`.
The category headings are semi-arbitrary and don't affect anything meaningful, so just pick whichever one seems right.

Use the DISC phonemic alphabet, as described [here](https://djvill.github.io/APLS/doc/Phonemic-Transcription).
Please pay attention to the extra considerations for [suggesting new dictionary entries](https://djvill.github.io/APLS/doc/Phonemic-Transcription#suggesting-new-dictionary-entries): multiple phonemic representations per word, the speech community's pronunciation(s), and syllabification/stress.

You'll also need to add inflectional forms, like plurals, verbal forms like _-s_, _-ing_, etc.
You do **not** need to add [cliticized forms](https://djvill.github.io/APLS/doc/Transcription-Convention.html) (e.g., _Pittsburgh's_);
APLS automatically adjusts pronunciations to account for clitics, and the Elan file checker is programmed to ignore _X's_ if _X_ is in the dictionary.
(The transcription convention says certain clitics can be added to any _noun_, but the implementation of clitics in APLS and the file checker aren't actually restricted to nouns.)
If you supplied multiple entries for the base-form of the word, you should also add multiple entries for each inflected form.


### Update the Elan file checker's dictionary

This is the easiest part---once you've got your computer set up for it.
Simply run [`updateDict.sh`](https://github.com/djvill/APLS/blob/main/files/custom-dictionary/updateDict.sh), then commit and push your changes to the [GitHub repository](https://github.com/djvill/APLS).
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
		- R must be in your PATH (directions for [Windows](https://docs.oracle.com/en/database/oracle/machine-learning/oml4r/1.5.1/oread/creating-and-modifying-environment-variables-on-windows.html#GUID-DD6F9982-60D5-48F6-8270-A27EC53807D0), [macOS](https://www.architectryan.com/2012/10/02/add-to-the-path-on-mac-os-x-mountain-lion/#.Uydjga1dXDg), [Unix](https://unix.stackexchange.com/a/26059)). If R is in your PATH, then at the command line `Rscript -e R.version.string` will print your R version
- GitHub account
- Push access to https://github.com/djvill/APLS


### Update APLS's internal dictionary

[Both dictionary_phonemes and phonemes_no_clitic]
