---
title: APLS Documentation
nav_exclude: yes
permalink: /
last_modified_date: 2025-05-21T14:24:24-04:00
---

# {{ page.title }}
{:.no_toc}

Welcome to the documentation homepage for the **Archive of Pittsburgh Language and Speech** (aka **APLS**, pronounced like _apples_)!
APLS is a linguistic data resource, powered by the open-source linguistic corpus software [LaBB-CAT], that contains:
- **recordings** of interviews conducted with speakers native to Pittsburgh and surrounding neighborhoods,
- **annotated transcripts** with information at the phrase, word, and individual speech sound levels, allowing these recordings to be used as structured linguistic data, and
- **metadata** on interviewees and transcripts that facilitate large-scale (socio)linguistic analysis.

APLS is (and will always be) **free to use**.
{% assign curr_version = site.versions.last.stats -%}
{%- if curr_version.same_as -%}
  {%- assign where_str = "v.version == '" | append: curr_version.same_as | append: "'" -%}
  {%- assign same_version = site.versions | where_exp: "v", where_str -%}
  {%- assign curr_version = same_version.first.stats -%}
{%- endif -%}
{%- assign hours = curr_version.duration | slice: 0, 2 | plus: 0 -%}
{%- assign minutes = curr_version.duration | slice: 3, 5 | plus: 0 -%}
{%- if minutes < 45 -%}{%- assign dur = hours | prepend: "over " -%}
{%- else -%}{%- assign dur = hours | plus: 1 | prepend: "nearly " -%}{%- endif -%}
APLS contains {{curr_version.transcripts}} sound files totaling {{dur}} hours of audio from {{curr_version.transcript_series.size}} interviewees.
{: .mb-1 }

## Demo: Measuring F1 and F2 for /aw/ in closed syllables {#demo}
{: .no_toc }

Some speakers of Pittsburgh English pronounce the /aw/ vowel (the vowel sound in words like _out_ and _downtown_) more like "ah" (stereotyped as "_aht_" and "_dahntahn_").
This pronunciation is noticeable to Pittsburghers as a marker of Pittsburgh identity and social meanings like working-class status (e.g., [Johnstone et al. 2006](https://doi.org/10.1177/0075424206290692)).

Let's say we wanted to investigate how different speakers pronounce /aw/ in different situations.
A pretty typical data task would be to identify all tokens (individual instances in speech) matching a specific linguistic context (for example, when /aw/ is followed by a consonant in the same syllable) and extract a set of acoustic measurements (for example, [F1 and F2](https://corpus.eduhk.hk/english_pronunciation/index.php/2-2-formants-of-vowels/) at 3 timepoints).
Normally, performing this sort of batch acoustic measurement on a dataset this big would take hours of manual effort, even if you use state-of-the-art speech technologies for automatic speech recognition and segmental alignment.
{: .mb-1 }

{% assign num_aw_closed = page.num_aw_closed | default: curr_version.num_aw_closed %}
With APLS, it takes **_as little as 2 minutes_** to measure all **{{ num_aw_closed }}** tokens of /aw/ in closed syllables in the corpus.
{: .fs-6 .fw-600 .mt-1 }

{: .try-it-title }
> Show me how!
>
> 1. [Search]({{ '/doc/search' | relative_url }}) for tokens
>   - Using [regular expressions]({{ '/doc/regex' | relative_url }}) to search across multiple [annotation layers]({{ '/doc/layers-and-attributes' | relative_url }}), we find **{{ num_aw_closed }}** time-aligned /aw/ tokens
>     {% include vimeo-embed.html video_code="1080583360" privacy_code="ad1b027fba" %}
>     
> 1. [Export]({{ '/doc/export-data' | relative_url }}) search results to a CSV file
>   - We get a search-results file with one token per row, and columns for different [annotation layers]({{ '/doc/layers-and-attributes' | relative_url }})
>     {% include vimeo-embed.html video_code="1080583387" privacy_code="501beb5ca0" %}
>     
> 1. [Extract]({{ '/doc/extract-acoustics' | relative_url }}) acoustic measurements for search results using APLS's built-in Praat module
>   - Our search-results file gets updated with acoustic measurements that we specify (in this case, F1 and F2 at the vowel's 20%, 50%, and 80% timepoints)
>     {% include vimeo-embed.html video_code="1080583413" privacy_code="e859876ecf" %}


## Ready to get started with APLS? Click [here]({{ '/doc/apls-101-getting-started' | relative_url }})!
{: .no_toc }

{% include linklist.html %}
