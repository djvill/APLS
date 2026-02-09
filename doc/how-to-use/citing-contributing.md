---
title: Citing and contributing back
permalink: /doc/citing-contributing
parent: How to use APLS
nav_order: 80
cites:
  - cite: apls
    version: selector
    authors: [Dan Villarreal, Barbara Johnstone, Scott Kiesling]
    title: Archive of Pittsburgh Language and Speech
    url: https://apls.pitt.edu
    type: open data resource
  - cite: apls-doc
    year: 2026
    authors: [Dan Villarreal, Jack Rechsteiner]
    title: Archive of Pittsburgh Language and Speech documentation
    url: https://djvill.github.io/APLS
file_formats:
  - file_format: bib
    name: BibTeX
    url: https://www.economics.utoronto.ca/osborne/latex/BIBTEX.HTM
  - file_format: bib
    name: Zotero
    url: https://www.zotero.org/
  - file_format: ris
    name: EndNote
    url: https://endnote.com/
styles:
  - style: unified
    name: Unified style sheet for linguistics
    url: https://web.archive.org/web/20210719165314/https://www.linguisticsociety.org/sites/default/files/style-sheet_0.pdf
  - style: apa
    name: APA 7th edition
    url: https://owl.purdue.edu/owl/research_and_citation/apa_style/apa_style_introduction.html
last_modified_date: 2026-02-09T11:43:35-05:00
---

# {{ page.title }}
{:.no_toc}

**If you use APLS, please [cite it](#citing-apls)!**
Studies show that [research](https://doi.org/10.1002/asi.23538) [software](https://doi.org/10.1371/journal.pone.0136631) [is](https://doi.org/10.1002/asi.24049) [under-cited](https://doi.org/10.5334/dsj-2024-024). 
Not citing research software makes it hard for creators to gauge how often it's used, understand how to improve it, or get credit when others use it.
(Citing APLS is also part of APLS's [terms of use]({{ '/doc/terms#citation' | relative_url }}).)

In addition, if you present or publish research based on APLS, we may ask you to [contribute back](#contributing-back) to the corpus so future fellow users can benefit.
Our goal is to make contributing back as seamless as possible---simply fill out the ["How did you use APLS?"] form.

{% include page_toc.html collapsible=true %}

## Citing APLS

{% assign apls = page.cites | where: "cite", "apls" | first %}

<label for="version-select">Select the version of APLS you would like to cite:</label>
<select name="version" id="version-select">
  {% for version in site.versions reversed -%}
  <option value="{{version.version}}">{{version.version}}</option>
  {% endfor -%}
</select>

{% assign curr_ver = site.versions | last %}

<script>
const setVersionYear = version => {
  let year;
  switch(version) {
    /* BEGIN Injected by Liquid */
    {% for version in site.versions reversed -%}
    case "{{version.version}}":
      year = {{ version.date | date: "%Y" }};
      break;
    {% endfor %}
    /* END Injected by Liquid */
  }
  const versionSpan = document.querySelectorAll(".version"),
        yearSpan = document.querySelectorAll(".year");
  versionSpan.forEach(a => a.innerText = version);
  yearSpan.forEach(a => a.innerText = year);
};
window.addEventListener('DOMContentLoaded', () => {
  const versSelect = document.querySelector("#version-select");
  /* Initial version */
  setVersionYear(versSelect.value);
  /* User-selected version */
  versSelect.addEventListener("change", e => setVersionYear(e.target.value));
});
</script>

<!-- If you downloaded any CSV files, the first column should contain the APLS version. -->

{% comment %}
### Citation manager files

| Citation manager | File <!--(click to download)--> |
|------------------|--------------------------|
{% for file_format in page.file_formats -%}
| [{{file_format.name}}]({{file_format.url}}) | {% include cite.html file_format=file_format.file_format key="apls_0.3.0" authors=apls.authors ref=apls %} |
{% endfor %}
{% endcomment %}

### Formatted bibliography entries

| Style | Bibliography entry <!--(click to copy)--> |
|-------|--------------------------|
{% for style in page.styles -%}
| [{{style.name}}]({{style.url}}) | {% include cite.html style=style.style ref=apls %} |
{% endfor %}


## Contributing back

Let's say you've downloaded some APLS data and modified or added to it in some way---you've coded some sociolinguistic variable, tagged some stances, or corrected a transcription.
This is valuable information that future users of APLS could benefit from!
If you've used APLS in published or ongoing research, please fill out the ["How did you use APLS?"] form (even if you don't think you have anything to contribute back), and we'll contact you with more information about next steps.
Finally, if your contribution gets accepted, your name gets added to APLS's [contributors list]({{ '/doc/credits#users-who-contributed-annotations' | relative_url }})---a feather in your cap!


### What we're looking for

This covers two main cases:

- **Adding annotations** to your own downloaded version of APLS data
	- Note: This doesn't have to cover the whole corpus, a whole speaker, or even a whole transcript
	- Examples:
		- Coding tokens of a sociolinguistic variable
		- Tagging stretches of interview speech for stances or topics
		- Identifying ideal formant-measurement settings for particular tokens
		- Generating [gradient predictions](https://www.journal-labphon.org/article/id/6264/) of auto-coded variables
		- Grouping participants into class categories based on <span class="participant-attr">education</span> and <span class="participant-attr">occupation</span>
- **Correcting issues** in current annotations
	- This could cover either <!-- [human-generated or computer-generated]({{ '/doc/data-sources#humans-and-computers' | relative_url }}) -->human-generated or computer-generated annotations
	- Examples:
		- Identifying transcription errors, or identifying correct transcriptions for passages marked `[unclear]`
		- Correcting morphemic parses or segmental alignments
		- Running part-of-speech tagging through a different POS algorithm of your choice

In addition, we welcome:

- Any feedback on APLS's user interface or this documentation website
- Requests for particular features
- Requests for new layers
- Calling our attention to something that needs [troubleshooting]({{ '/doc/troubleshooting' | relative_url }})


However, you are _not_ obligated to contribute back to the corpus if you use APLS data:

- To create stimuli for perceptual/experimental research
- To train some sort of language model
	- Exception: The model results in some annotations of existing APLS data that you can contribute back
- To inform fieldwork methods in Pittsburgh or other places
- Completely 'as is' without any further annotations or corrections


## Citing documentation

{% assign apls_doc = page.cites | where: "cite", "apls-doc" | first %}

In most cases where you want to cite APLS, your citation will be to APLS itself (see [above](#citing-apls)).
However, if you need to cite _this documentation website_, please use one of the following citations:

| Style | Bibliography entry <!--(click to copy)--> |
|-------|--------------------------|
{% for style in page.styles -%}
| [{{style.name}}]({{style.url}}) | {% include cite.html style=style.style ref=apls_doc %} |
{% endfor %}

{% include linklist.html %}
