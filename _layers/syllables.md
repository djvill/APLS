---
synced:
  short_description: Syllables in the word, including stress, derived from aligned
    segments
  layer_id: 66
  alignment: sub-interval
  project: phonology
  parent: word
  vertical_peers: no
  data_type: phonological
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: word
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2024-11-13T14:35:08-0500
notation:
  primary: DISC
  additional: Stress markers
  missing: The current word doesn't have any <span class="layer">segment</span> annotations
inputs:
  - input: segment
    type: layer
  - input: Unisyn lexicon
    type: dictionary
  - input: APLS custom dictionary
    type: dictionary
  - input: syllables__handle-stress.py
    type: script
  - input: pronounce
    type: layer
  - input: syllables__pronounce-aux.py
    type: script
alignment_dependent: yes
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.2
last_modified_date: 2024-11-20T10:15:04-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}

### How it's generated

1. The word's <span class="layer">{{ page.inputs[0].input }}</span> annotation is used to look up phonemic representations in the [{{ page.inputs[1].input }}] and [{{ page.inputs[2].input }}]({{ 'doc/custom-dictionary-entries/' | relative_url }}), returning multiple entries if applicable.
1. If the <span class="layer">{{ page.inputs[0].input }}</span> annotation ends in one or more clitics (*'s*, _s'_, _'d_, _'ll_, _'ve_, _'d've_, *'ll've*) and there's no corresponding dictionary entry, a form of this annotation _without_ any clitics (<span class="layer">{{ page.inputs[3].input }}</span>) is used to look up phonemic representations in the dictionaries (<span class="layer">{{ page.inputs[4].input }}</span>). 
1. If the word has a <span class="layer">{{ page.inputs[5].input }}</span> annotation, this overrides the output of the previous steps.

## Inputs

(1) **segment** layer
(2) (a) Unisyn APLS lexicon; (b) Supplemental APLS dictionary
(3) **pronounce** layer


### Input notes

- (1) is matched against entries in (2) to build up syllable intervals.
- (2b) is checked only if the wordform is not present in (2a).
- An annotation in (3) overrides the output of the previous step.
