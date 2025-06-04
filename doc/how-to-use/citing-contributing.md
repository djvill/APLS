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
    year: 2025
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
last_modified_date: 2025-06-04T13:51:26-04:00
---

# {{ page.title }}
{:.no_toc}

**If you use APLS, please [cite it](#citing-apls)!**
Studies show that research software is under-cited. <!-- Add cites -->
Not citing research software makes it hard for creators to gauge how often it's used, understand how to improve it, or get credit when others use it.
(Citing APLS is also part of APLS's [terms of use]({{ '/doc/terms#citation' | relative_url }}).)

In addition, if you use APLS in published research, you may be obligated <!-- wording --> to [contribute back](#contributing-back) to the corpus so future fellow users can benefit.
Our goal is to make contributing back as seamless as possible.

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

<!-- I should really have a "how did you use APLS?" form. A lot of the implementation details for contributing-back (e.g., coverage) can be relegated to that. And then I can make it "we'll reach out to you"-based rather than "you have to submit this whole big thing"-based -->

APLS is a community effort.
If you've used APLS in published or ongoing research, you may be obligated <!-- wording --> to contribute back to the corpus.
We're here to help you contribute back to APLS! 
Simply fill out the ["How did you use APLS?" form](LINK), and we'll contact you with more information about next steps.


### What we're looking for

This covers two main cases:

- Adding annotations to your own downloaded version of APLS data
	- Note: This doesn't have to cover the whole corpus, a whole speaker, or even a whole transcript
	- Examples:
		- Coding tokens of a sociolinguistic variable
		- Tagging stretches of interview speech for stances or topics
		- Identifying ideal formant-measurement settings for particular tokens
		- Generating [gradient predictions](https://www.journal-labphon.org/article/id/6264/) of auto-coded variables
		- Grouping participants into class categories based on education and occupation <!-- Link to participant attributes page/section -->
- Correcting issues in current annotations
	- This could cover either [human-generated or computer-generated]({{ '/doc/data-sources#humans-and-computers' | relative_url }}) <!-- check heading link later --> annotations
	- Examples:
		- Identifying transcription errors, or identifying correct transcriptions for passages marked `[unclear]`
		- Correcting morphemic parses or segmental alignments
		- Running part-of-speech tagging through a different POS algorithm of your choice

<!-- is this too many examples? -->

In addition, we welcome:

- Any feedback on APLS's user interface (the corpus itself or this website)
- Requests for particular features
- Calling our attention to something that needs [troubleshooting]({{ '/doc/troubleshooting' | relative_url }})


However, you are _not_ obligated <!-- wording --> to contribute back to the corpus if you use APLS data:

- To create stimuli for perceptual/experimental research
- To train some sort of language model
	- Exception: The model results in some annotations of existing APLS data that you can contribute back
- To inform fieldwork methods in Pittsburgh or other places
- Completely 'as is' without any further annotations or corrections


### Why contribute back to APLS?

If you're in a position to contribute back to APLS, then please note that the [terms of use]({{ '/doc/terms' | relative_url }}) technically obligate <!-- wording --> you to do so.
More importantly, we think it's the right thing to do, since you can save future researchers the time and effort of reinventing the wheel---it's why we try to make it as easy as possible for researchers to contribute back.
<!-- Maybe mention some Open Methods-y stuff here -->
As with other forms of Open Methods, contributing back helps to encourage contributors to adopt reproducible research practices.
Finally, if your contribution gets accepted, your name gets added to APLS's [contributors page]({{ '/doc/contributors' | relative_url }})---a feather in your cap!


## Citing documentation

{% assign apls_doc = page.cites | where: "cite", "apls-doc" | first %}

In most cases where you want to cite APLS, your citation will be to APLS itself (see [above](#citing-apls)).
However, if you need to cite _this documentation website_, please use one of the following citations:

| Style | Bibliography entry <!--(click to copy)--> |
|-------|--------------------------|
{% for style in page.styles -%}
| [{{style.name}}]({{style.url}}) | {% include cite.html style=style.style ref=apls_doc %} |
{% endfor %}

<!-- CITE -->
