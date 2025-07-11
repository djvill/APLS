---
synced:
  short_description: The word in all lowercase letters, after removing all clitics
  layer_id: 61
  alignment: complete interval
  project: temp
  parent: word
  peers: no
  vertical_peers: no
  data_type: text
  scope: word
  layer_manager: PatternMatcher
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2025-01-11T16:50:28-0500
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
last_modified_date: 2025-06-16T14:12:19-04:00
---

### Notes

A word are tagged only if its **orthography** annotation ends in the following: _'s_, _s'_, _'d_, _'ll_, _'ve_, _'d've_, _'ll've_.
Otherwise, words are un-tagged (meaning the large majority of words are un-tagged).

This layer exists solely to provide data for the **dictionary_phonemes** layer.


### Downstream layers

Used by **phonemes_no_clitic** for looking up phonemic representations of base forms.
Used by **dictionary_phonemes** for tagging phonemic representations of cliticized forms.


{% include linklist.html %}
