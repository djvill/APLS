---
layout: default
nav_exclude: yes
permalink: /
num_aw_closed: 4420
last_modified_date: 2024-10-16T11:36:01-04:00
---

# Documentation

Welcome to the documentation homepage for the **Archive of Pittsburgh Language and Speech** (aka **APLS**, pronounced like _apples_)!
APLS is a linguistic data resource, powered by the open-source linguistic corpus software [LaBB-CAT], that contains:
- **recordings** of interviews conducted with speakers native to Pittsburgh and surrounding neighborhoods,
- **annotations** of linguistic information at the level of phrases, words, and individual speech sounds, allowing us to treat these recordings as structured linguistic data, and
- **metadata** on interviewees and transcripts that facilitate large-scale (socio)linguistic analysis.

APLS is (and will always be) **free to use**.
APLS is currently under construction, but when complete, it will contain 270 sound files totaling 45 hours of audio from 40 speakers.
<!-- In total, APLS contains 270 sound files totaling 45 hours of audio from 40 speakers. -->


## Demo: Measuring F1 and F2 for /aw/ in closed syllables
{: .no_toc }

<!-- Each step is illustrated with a screen-cap GIF: back-to-back portions of a single continuous screen-cap. Login test-student, clear Downloads folder for screen-cap, regular-size screen.
- GIF 1: search for orthography ``, segment `6` _from IPA picker_, syllables `.*6[pbtdkgfvTDszSZhJ_mnNlrwjFHP]`, and the results page that pops up
  - As of 16 Oct 2024, this yields 4420 results
- GIF 2: click CSV Export, open csv file in Excel, switch back to APLS
- GIF 3: click upload > process with praat, upload file, specify sample points 0.2 0.5 0.8, process, open csv file in Excel
  - Add a timer to the bottom-left, then speed up the video during processing "downtime"
-->

Some speakers of Pittsburgh English use a monophthongal variant of the /aw/ phoneme. 
This variant, stereotyped as "_dahntahn_" for _downtown_, holds important social meanings in Pittsburgh (e.g., [Johnstone et al. 2006](https://doi.org/10.1177/0075424206290692)).
A pretty typical data task would be to identify all tokens matching a specific linguistic context (say, /aw/ in closed syllables) and extract a set of acoustic measurements (say, [F1 and F2](https://corpus.eduhk.hk/english_pronunciation/index.php/2-2-formants-of-vowels/) at 3 timepoints).
Normally, performing this sort of batch acoustic measurement on a dataset this big would take hours of manual effort, even if you use state-of-the-art speech technologies for automatic speech recognition and segmental alignment.
{: .mb-1 }

With APLS, it takes **_as little as 2 minutes_** to measure all **{{ page.num_aw_closed }}** tokens of /aw/ in closed syllables in the corpus.
{: .fs-6 .fw-600 .mt-1 }


{: .try-it-title }
> Show me how!
>
> 1. [Search]({{ '/doc/search' | relative_url }}) for tokens
>   - Using [regular expressions]({{ '/doc/regex' | relative_url }}) to search across multiple [annotation layers]({{ '/doc/layer-reference' | relative_url }}), we find **{{ page.num_aw_closed }}** time-aligned /aw/ tokens
>     <!-- GIF 1 -->
>     
> 1. [Extract]({{ '/doc/export-data' | relative_url }}) search results to a CSV file
>   - We get a search-results file with one token per row, and columns for different [annotation layers]({{ '/doc/layer-reference' | relative_url }})
>     <!-- GIF 2 -->
>     
> 1. [Upload]({{ '/doc/extract-acoustics' | relative_url }}) search results to APLS's built-in Praat module
>   - Our search-results file gets updated with acoustic measurements that we specify (in this case, F1 and F2 at the vowel's 20%, 50%, and 80% timepoints)
>     <!-- GIF 3 -->


Ready to get started with APLS? Click [here]({{ '/doc/getting-started' | relative_url }})
{: .fs-6 .fw-600 }


{% include linklist.html %}
