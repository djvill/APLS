---
synced:
  layer_id: 61
  short_description: The word in all lowercase letters, after removing all clitics
  alignment: complete interval
  project: temp
  parent: word
  peers: no
  vertical_peers: no
  data_type: text
  layer_manager: PatternMatcher
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_numValidLabels: 0
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#e07b61'
  num_annotations: 12526
  extra: (none)
last_sync_modified_date: 2026-02-09T12:37:57-0500
notation:
  primary: English spelling (lowercase)
  missing: Word does not end in a clitic
inputs:
  - input: orthography
    type: layer
segment_dependent: no
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
color: coral
last_modified_date: 2026-02-09T12:47:54-05:00
---

### Notes

A word are tagged only if its **orthography** annotation ends in the following: _'s_, _s'_, _'d_, _'ll_, _'ve_, _'d've_, _'ll've_.
Otherwise, words are un-tagged (meaning the large majority of words are un-tagged).

This layer exists solely to provide data for the **dictionary_phonemes** layer.


### Downstream layers

Used by **phonemes_no_clitic** for looking up phonemic representations of base forms.
Used by **dictionary_phonemes** for tagging phonemic representations of cliticized forms.


{% include linklist.html %}
