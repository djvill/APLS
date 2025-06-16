---
synced:
  short_description: All possible phonemic representations of the word, after removing
    all clitics
  layer_id: 62
  alignment: complete interval
  project: temp
  parent: word
  peers: yes
  vertical_peers: yes
  data_type: phonological
  scope: word
  layer_manager: Unisyn
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  extra: "#Mon Jul 31 14:26:51 EDT 2023\r\nLanguage=\r\nLexiconId=5\r\nFirstOnly=false\r\nField=pron_disc\r\nRecoverSyllables=false\r\nStripSyllStress=true\r\nLayerId=61\r\n"
last_sync_modified_date: 2025-01-11T16:50:28-0500
notation:
  primary: DISC
  missing: Word does not end in a clitic
inputs:
  - input: orthography_no_clitic
    type: layer
  - input: Unisyn lexicon
    type: dictionary
  - input: APLS custom dictionary
    type: dictionary
segment_dependent: no
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
last_modified_date: 2025-06-16T14:12:24-04:00
---

### Notes

A word are tagged only if its **orthography** annotation ends in the following: _'s_, _s'_, _'d_, _'ll_, _'ve_, _'d've_, _'ll've_.
Otherwise, words are un-tagged (meaning the large majority of words are un-tagged).

This layer exists solely to provide data for the **dictionary_phonemes** layer.


### Downstream layers

Used by **dictionary_phonemes** for tagging phonemic representations of cliticized forms.


{% include linklist.html %}
