---
title: <code>CodeTokens.praat</code>
permalink: /doc/codetokens-praat-script
parent: Coding tokens
grand_parent: How to use APLS
nav_order: 10
last_modified_date: 2025-11-03T16:26:59-05:00
---

# {{ page.title }}
{:.no_toc}

Many <span class="keyterm">linguistic variables</span> that are important to language variation and change research in Pittsburgh English (or Englishes more generally) require a tedious and time-consuming step in the data preparation workflow: <span class="keyterm">auditory coding</span>, listening to individual tokens of a variable and determining which <span class="keyterm">variant</span> each token represents.
One way to do auditory coding in APLS would be to [open each search result on the <span class="apls-page">Transcript</span> page](#viewing-tokens-on-the-transcript-page) and use the [word menu]({{ '/doc/view-transcript#listening-to-the-transcript' | relative_url }}) to play just the utterance that contains the token.
But we've created a better way: `CodeTokens.praat`.

`CodeTokens.praat` is a program that runs within [Praat], a free program for phonetic analysis.
It makes auditory coding much easier and faster by seamlessly [integrating with the APLS <span class="apls-page">Search results</span> page](#preparing-files-for-coding), playing tokens one-at-a-time, providing a [graphical user interface for selecting variants](#coding-screen), and [writing your codes to a CSV file](#after-coding-is-done) that can then be imported into a program like Microsoft Excel or R for statistical modeling and/or data visualization.

{% include page_toc.html collapsible=true %}


## Prerequisites

You only need to complete these steps once per computer.

1. Download Praat from <https://praat.org/> and install it on your computer.
   - If you already have Praat, make sure it's at least version 6.4.32. You can check your Praat version in the Praat Objects window by selecting _Help_ > _About Praat_.
1. Download `CodeTokens.praat`
   - Go to <https://raw.githubusercontent.com/djvill/APLS/main/files/praat-coding-helper/codeTokens.praat>, right-click, select _Save as..._, and save somewhere on your computer.
   - When you open `CodeTokens.praat`, your computer will probably open it in Praat automatically. If not, open Praat and select _Praat_ > _Open Praat script..._


## Preparing files for coding

We'll use a simple example for demonstration purposes: the pronounciation of _the_ with a full [i] vowel vs. a reduced [ə] vowel.
To make this a manageable dataset, we'll only look at tokens from a single short transcript, `CB01pairs.eaf`.

1. Search for tokens on the <span class="apls-page">Search</span> page.
1. On the <span class="apls-page">Search results</span> page:
   1. Open the options panel for _CSV Export_
   1. Set `Include annotation start/end times:` to _(always) if manually, automatically, or default aligned_
      {% include screengrab.html src="matches/coding-csv-export.png" %}
   1. Click _CSV Export_
   1. Click _Utterance Export_
      - This will download a `.zip` folder with Praat TextGrids, one for each <span class="layer">utterance</span> that contains a search result
   1. Click _Audio Export_
      - This will download a `.zip` folder with audio files, one for each <span class="layer">utterance</span> that contains a search result
1. Unzip the two `.zip` folders you just downloaded
1. Back on the <span class="apls-page">Search results</span> page, copy the search name from the title at the top of the page.

{: .note .no-collapse}
> By default, `CodeTokens.praat` looks for these files in your Downloads folder.
> If you download them to a different folder, change the `Input folder` setting on the [basic settings window](#basic-settings)

For the example search, here's what the exported CSV looks like:

{% include screengrab.html src="matches/csv-pre-coding.png" %}

Here's what the unzipped folder of TextGrids looks like:

{% include screengrab.html src="matches/exported-textgrids.png" %}

For this search, the search name is `orthography=the`:

{% include screengrab.html src="matches/orthography-the.png" %}


## Running `CodeTokens.praat`

1. Open `CodeTokens.praat` in Praat.
1. Run the script by clicking the _Run_ menu then _Run_
   {% include screengrab.html src="code-tokens/run.png" %}


### Initial settings

This will bring up the [basic settings window](#basic-settings).
Most settings have defaults that should work for most cases (see below for information on [other settings](#codetokens_praat-settings)).
At the very least, you'll need to:

1. Paste the search name in the box under `Search name:`
   - `CodeTokens.praat` uses this to find the files you downloaded from the <span class="apls-page">Search results</span> page.
1. Specify the variants you want to code for in the box next to `Variants:`
   - Use commas to separate variants, like `diphthong,monophthong,intermediate` or `Full vowel,Reduced`
   - `CodeTokens.praat` uses this to set up the variant options in the coding screen.

{% include screengrab.html src="code-tokens/basic-settings.png" %}


### Coding screen

Once you've specified settings, click _Continue_ to start coding.
`CodeTokens.praat` will open a <span class="keyterm">coding screen</span> and autoplay a token.
Here's what that looks like:

{% include screengrab.html src="code-tokens/coding-screen.png" %}

As you can see, the coding screen consists of two windows:

- A <span class="keyterm">TextGrid window</span> with the audio and time-aligned annotations for a single token
  - In the previous image, this is the window with the title `3. TextGrid CB01pairs__110_670-112_280`.
  - The audio and annotations include the token itself (highlighted in pink) and some context before and after.
- A <span class="keyterm">popup window</span> with coding options
  - In the previous image, this is the window with the title `Pause: Code this token`

To code the token, on the popup window, click the variant you hear, then click _Code_.
When you click _Code_, the script will fill the code into the coding column at the row corresponding to this token, then it will open a coding screen for the next token.

{: .note}
> Instead of clicking _Code_, you can also press `Enter` (on a Windows keyboard) or `Return` (on a Mac keyboard).

The _Unsure_ and _Exclude_ buttons fill special codes (`(unsure)` and `(not a token)`) into the coding column.
Like the _Code_ button, both of these buttons will open a coding screen for the next token.
Here's some situations where you might use them:

- _Unsure_
  - You're early in the coding process and your ear hasn't been trained to the different variants.
    - You can come back to `(unsure)` tokens later by selecting the _File in progress_ checkbox on the [basic settings window](#basic-settings).
  - You want the dataset you analyze to only include tokens that clearly belong to one variant or another.
- _Exclude_
  - A search result isn't actually a token of the variable you're interested in.
    - For example, you might discover that a _the_ is actually a mis-transcribed _a_ or _this_, so the token shouldn't be included in the analysis.
  - You're planning to [extract acoustic measurements]({{ '/doc/extract-acoustics' | relative_url }}) and the token is misaligned (that is, its start and/or end time is incorrect)
    - If you're not planning to extract acoustic measurements, we recommend coding the token as-is even if it's misaligned
    - If you make manual corrections to token alignments, please [send them to us!]({{ '/doc/citing-contributing#contributing-back' | relative_url }})

The _Replay_ button replays the audio that's visible in the TextGrid window.
The _Save & exit_ button stops the coding process and saves a file with whatever codes you've filled in.

Finally, in the TextGrid window, you can zoom out to hear more context, scroll earlier or later in the utterance, and view acoustic information.
You can learn more about navigating the TextGrid window in section 7.1 of Will Styler's [Using Praat for linguistic research][praat-styler].


### After coding is done

Once you've coded the last token (or clicked _Save & exit_), the script will save the filled-out coding file and display a window telling you where to find it:

{% include screengrab.html src="code-tokens/praat-all-done.png" %}

{: .note}
> By default, the script saves the filled-out coding file with a `_coded` suffix in the input folder.
> You can choose a different location or name on the [advanced settings window](#advanced-settings).

Here's what that file looks like in Excel:

{% include screengrab.html src="code-tokens/csv-post-coding.png" %}

As you can see, the `HandCode` column has been filled in with codes.


## Settings

The [basic settings window](#basic-settings) appears when you run `CodeTokens.praat`.
You can reach the [advanced settings window](#advanced-settings) by clicking _Advanced settings_ on the basic settings window, then go back to the basic settings window by clicking _Basic settings_.
Clicking _Continue_ on either window will load the first token's [coding screen](#coding-screen).

{: .under-the-hood}
> If you're savvy with Praat scripting, you can save yourself time by hard-coding your preferred settings into `CodeTokens.praat` and setting `use_form = 0` toward the top of the script.
> To learn more about Praat scripting, check out section 12 of [Using Praat for linguistic research][praat-styler].


### Basic settings

{% include screengrab.html src="code-tokens/basic-settings.png" %}

- `Search name`
  - The search name, which you can get from
    - The title at the top of the <span class="keyterm">Search results</span> page, or
    - The `SearchName` column in the search results CSV you exported from APLS
  - `CodeTokens.praat` uses this to find the files you downloaded from APLS
  - **Cannot be blank**. If this is blank, `CodeTokens.praat` will display an error message and exit
- `Input folder`
  - The folder where you downloaded files from the APLS <span class="apls-page">Search results</span> page
  - Defaults to your Downloads folder
  - Click _Browse..._ to open a new window that helps you select a folder on your computer
- `File in progress`
  - You can use this option if you're doing your coding in multiple sessions
  - If `File in progress` is selected, `CodeTokens.praat` will look for a CSV file that ends with a `_coded` suffix and it will only present tokens that have a blank in the coding column
- `Code column`
  - The column for storing codes (including `(unsure)` and `(not a token)` codes)
  - If you and a collaborator are coding the same tokens for quality-control purposes, you can specify different coding columns with your names (like `Codes - Dan` and `Codes - Jack`)
- `Variants`
  - Use this to specify the variants that you can choose from on the [coding screen](#coding-screen)
  - Use commas to separate variants, like `diphthong,monophthong,intermediate` or `Full vowel,Reduced`
- `Number of autoplays`
  - Use this to have `CodeTokens.praat` automatically play the token (and context) when the [coding screen](#coding-screen) is loaded
  - Set this to 0 to disable autoplaying
  - If you set this to 2 or more, you can set the buffer between autoplays on the [advanced settings window](#advanced-settings)
- `Randomize token order`
  - Use this to present tokens in random order, to avoid having your codes be overly influenced by hearing tokens from the same speaker or transcript all in a row
  - If deselected, tokens will be presented in the order that they appear in the input CSV file
- `Save output to csv file`
  - If selected, once you finish coding tokens or click _Save & exit_ on the [coding screen](#coding-screen), `CodeTokens.praat` will save the filled-out coding file
  - You can set the output file location and name on the [advanced settings window](#advanced-settings)
  - If deselected, the coding file will still remain in your Praat Objects window as a Table object. It will be deleted once you close Praat unless you manually save it by clicking _Save_ > _Save as comma-separated file..._

### Advanced settings

{% include screengrab.html src="code-tokens/advanced-settings.png" %}

- `Input csv file (downloaded from APLS)`
  - The path to the CSV file that you downloaded from _CSV Export_ on the <span class="apls-page">Search results</span> page
  - Defaults to the input folder + `results_` + the search name + `.csv`
    - If you selected `File in progress` on the [basic settings window](#basic-settings), this defaults to the input folder + `results_` + the search name + <code class="language-plaintext highlighter-rouge"><strong>_coded</strong>.csv</code>
  - Click _Browse..._ to open a new window that helps you select a file on your computer
- `Folder that contains TextGrid files`
  - The **unzipped** folder that you downloaded from _Utterance Export_ on the <span class="apls-page">Search results</span> page
  - Defaults to the input folder + `fragments_` + the search name
  - Click _Browse..._ to open a new window that helps you select a folder on your computer
- `Folder that contains wav files`
  - The **unzipped** folder that you downloaded from _Audio Export_ on the <span class="apls-page">Search results</span> page
  - Defaults to the input folder + `media_` + the search name
  - Click _Browse..._ to open a new window that helps you select a folder on your computer
- `Output csv file (will be created if it doesn't exist)`
  - The path to a CSV file where `CodeTokens.praat` will save your filled-out coding file once you finish coding tokens or click _Save & exit_ on the [coding screen](#coding-screen)
  - If the file doesn't exist, `CodeTokens.praat` will create it
  - Defaults to the input folder + `results_` + the search name + `_coded.csv`
  - Click _Browse..._ to open a new window that helps you select a file on your computer
  - This option is hidden if `Save output to csv file` is deselected on the [basic settings window](#basic-settings)
- `Input column names`
  - Column names that `CodeTokens.praat` will look for in the input CSV file to find utterance/audio files and zoom in to the token when it loads each token's [coding screen](#coding-screen)
- `Time between autoplays`
  - Time buffer (in seconds) between autoplays when `CodeTokens.praat` loads the coding screen
  - This option is hidden if `Number of autoplays` is set to 0 or 1 on the [basic settings window](#basic-settings)

{% include linklist.html %}
