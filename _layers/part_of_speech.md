---
synced:
  short_description: The word's part of speech
  layer_id: 89
  alignment: sub-interval(s)
  project: syntax
  parent: word
  vertical_peers: no
  data_type: text
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2024-11-05T15:56:24-0500
parallel: yes
notation:
  primary: Treebank part-of-speech tags
  missing: Word is redacted or an incomplete word
inputs:
  - input: orthography
    type: layer
  - input: Stanford POS Tagger
    type: algorithm
versions:
  first_appeared: 0.1.1
  last_updated: 0.1.2
last_modified_date: '2024-10-28T09:51:17-04:00'
---



### How it's generated

1. The {{ page.inputs[1].input }} is run on all <span class="layer">{{ page.inputs[0].input }}</span> annotations in a single <span class="layer">turn</span>, **excluding** redacted speech (`___`) and incomplete words (ending with `~`)
   - Version 4.2.0, with the "english-caseless-left3words-distsim.tagger" model
