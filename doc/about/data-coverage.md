---
title: Data coverage
permalink: /doc/data-coverage
parent: About APLS
nav_order: 22
checks:
  participant: [participant-names.Rmd, participant-attributes.Rmd]
  transcript: [transcript-names.Rmd, transcript-attributes.Rmd, transcript-episodes.Rmd, transcript-required-layers.Rmd]
  timepoints: [turn-timepoints.Rmd, utterance-timepoints.Rmd, word-timepoints.Rmd, segment-timepoints.Rmd]
  utterance_layers: [utterance-word-noise.Rmd, utterance-overlaps.Rmd, utterance-overlap-timepoints.Rmd, utterance-redaction.Rmd, utterance-redaction-timepoints.Rmd]
  word_representations: [word-orthography.Rmd, orthography-dictionary.Rmd, orthography-tilde-pronounce.Rmd]
  alignment: [utterance-htk.Rmd, segment-htk.Rmd]
  frequency_layers: [frequency-in-corpus.Rmd, interview-word-frequency.Rmd]
last_modified_date: 2026-03-04T10:04:19-05:00
---

# {{ page.title }}
{:.no_toc}

{% include page_toc.html collapsible=true %}

{% assign checks = site.data.data-coverage.check-results | where: "dataVersion", "0.4.3" %}
{% assign notation_checks = site.data.data-coverage.notation-check-results | where: "dataVersion", "0.4.3" %}

## Participants

{% for check_script in page.checks.participant -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All participants follow naming conventions
- [x] No attributes have "NA" values

## Transcripts

{% for check_script in page.checks.transcript -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All transcripts follow naming conventions
- [x] No required attributes have "NA" values
- [x] All transcripts are in their expected family and the order of episodes is logical
- [x] All transcripts have at least one annotation on all required layers

## Layers

### Annotation timepoints

{% for check_script in page.checks.timepoints -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All **turn** annotations' end time is _after_ their start time
- [x] All **utterance** annotations' end time is _after_ their start time
- [x] All **word** annotations' end time is _after_ their start time
- [x] All **segment** annotations' end time is _after_ their start time
- [ ] All anchors are rounded to the nearest millisecond

### Utterance layers

{% for check_script in page.checks.utterance_layers -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All **utterance** annotations contain at least one word or overlap with one noise
- [x] All **utterance** annotations have exactly one **overlap** annotation
- [ ] All **overlap** annotations span exactly one **utterance** annotation
- [x] For all **utterance** annotations with exactly one **overlap** annotation, the **utterance** and **overlap** annotation share timepoints
- [x] All **utterance** annotations have either 0 or 1 **redaction** annotations
- [x] For all **utterance** annotations with exactly one **redaction** annotation, the **utterance** and **redaction** annotation share timepoints
- [ ] All **redaction** annotations span exactly one **utterance** annotation
- [ ] All **speech_rate** annotations span exactly one **utterance** annotation
- [ ] All **htk** annotations span exactly one **utterance** annotation
- [x] All **overlap** annotations are either `TRUE` or `FALSE`
  - [ ] (Move this check to notation)


### Word representations

{% for check_script in page.checks.word_representations -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All non-redacted **word** annotations have exactly one **orthography** annotation
- [x] All **orthography** annotations have at least one **dictionary_phonemes** annotation
- [x] All **orthography** annotations with a tilde have a **pronounce** annotation (or are in the APLS dictionary)


### Segmental alignment

{% for check_script in page.checks.alignment -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] All **utterance** annotations not in overlaps or redactions have exactly one **htk** annotation
- [x] All **segment** annotations have an **htk** annotation

### Frequency layers

{% for check_script in page.checks.frequency_layers -%}
  {%- assign check = checks | where: "check_script", check_script | first -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

- [x] For all words in **frequency_in_corpus**, there's the same value across all transcripts
- [x] All **word** annotations from interview and metalinguistic transcripts have a **frequency_in_corpus** annotation


## Notation systems

{% for check in notation_checks -%}
- {% include coverage-check.html check=check %}
{%- endfor %}

{: .note .no-collapse }
> This section omits some layers:
> - Layers in the "temp" project, because they're [not meaningful for end-users]({{ '/doc/layer-typology#project' | relative_url }})
> - <span class="layer">turn</span> and <span class="layer">utterance</span>, because they [don't have labels and therefore don't have a notation system]({{ '/doc/layer-typology#notation-system' | relative_url }})

{% include linklist.html %}

