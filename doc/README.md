---
layout: default
nav_exclude: yes
permalink: /
num_aw: 4064
last_modified_date: 2024-10-09T12:00:34-04:00
---

# Documentation

Welcome to the documentation homepage for the **Archive of Pittsburgh Language and Speech** (aka **APLS**, pronounced like _apples_)!
APLS is a linguistic data resource, powered by the open-source linguistic corpus software [LaBB-CAT](https://sourceforge.net/projects/labbcat/), that contains:
- **recordings** of interviews conducted with speakers native to Pittsburgh and surrounding neighborhoods,
- **annotations** of linguistic information at the level of phrases, words, and individual speech sounds, allowing us to treat these recordings as structured linguistic data, and
- **metadata** on interviewees and transcripts that facilitate large-scale (socio)linguistic analysis.

APLS is (and will always be) **free to use**.
APLS is currently under construction, but when complete, it will contain 270 sound files totaling 45 hours of audio from 40 speakers.
<!-- In total, APLS contains 270 sound files totaling 45 hours of audio from 40 speakers. -->


## Demo: Measuring F1 and F2 for /aw/ tokens
{: .no_toc }

<!-- Each step is illustrated with a screen-cap GIF: back-to-back portions of a single continuous screen-cap. Login test-student, clear Downloads folder for screen-cap, regular-size screen.
- GIF 1: search for orthography ``, segment `6` _from IPA picker_, syllables `.*6.+`, only main participants, and the results page that pops up
  - As of 24 Sep 2024, this yields 4064 results
- GIF 2: click CSV Export, open csv file in Excel, switch back to APLS
- GIF 3: click upload > process with praat, upload file, specify sample points 0.2 0.5 0.8, process, open csv file in Excel
  - Add a timer to the bottom-left, then speed up the video during processing "downtime"
-->

Some speakers of Pittsburgh English use a monophthongal variant of the /aw/ phoneme; 
this variable holds important social meanings in Pittsburgh (CITES).
A pretty typical data task would be to identify all tokens matching a specific linguistic context (say, /aw/ in closed syllables) and extract a set of acoustic measurements (say, F1 and F2 at 3 timepoints).
Normally, performing this sort of batch acoustic measurement on a dataset this big would take hours, even if you use state-of-the-art speech technologies for automatic speech recognition and segmental alignment.
{: .mb-1 }

With APLS, it takes **_as little as 2 minutes_** to measure all **{{ page.num_aw }}** /aw/ tokens in the corpus.
{: .fs-6 .fw-600 .mt-1 }


{: .try-it-title }
> Show me how!
>
> 1. [Search](doc/search) for tokens
>   - Using [regular expressions](doc/regex) to search across multiple [annotation layers](doc/layer-reference), we find **{{ page.num_aw }}** time-aligned /aw/ tokens
>     <div class="tenor-gif-embed" data-postid="16744516" data-share-method="host" data-aspect-ratio="1.04235" data-width="100%"><a href="https://tenor.com/view/happy-april-fools-april1st-april-first-april1-april-fools-gif-16744516">Happy April Fools April1st GIF</a>from <a href="https://tenor.com/search/happy+april+fools-gifs">Happy April Fools GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
>     
> 1. [Extract](doc/export-data) search results to a CSV file
>   - We get a search-results file with one token per row, and columns for different [annotation layers](doc/layer-reference)
>     <div class="tenor-gif-embed" data-postid="13822234" data-share-method="host" data-aspect-ratio="1.24378" data-width="100%"><a href="https://tenor.com/view/hello-april-gif-13822234">Hello April GIF</a>from <a href="https://tenor.com/search/hello+april-gifs">Hello April GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
>     
> 1. [Upload](doc/extract-acoustics) search results to APLS's built-in Praat module
>   - Our search-results file gets updated with acoustic measurements that we specify (in this case, F1 and F2 at the vowel's 20%, 50%, and 80% timepoints)
>     <div class="tenor-gif-embed" data-postid="13986018" data-share-method="host" data-aspect-ratio="1" data-width="100%"><a href="https://tenor.com/view/happy-easter-monday-easter-monday-easter-flowers-gif-13986018">Happy Easter Monday Easter Flowers GIF</a>from <a href="https://tenor.com/search/happy+easter+monday-gifs">Happy Easter Monday GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>


Ready to get started with APLS? Click [here](doc/getting-started)
{: .fs-6 .fw-600 }
