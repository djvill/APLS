---
synced:
  short_description: The word's part(s) of speech
  layer_id: 89
  alignment: sub-interval
  project: syntax
  parent: word
  peers: yes
  vertical_peers: no
  data_type: text
  scope: word
  layer_manager: StanfordPosTagger
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: word
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: yes
  extra: (none)
last_sync_modified_date: 2025-01-11T16:50:28-0500
notation:
  primary: Treebank part-of-speech tags
  missing: Word is redacted or an incomplete word
inputs:
  - input: orthography
    type: layer
  - input: Stanford POS Tagger
    type: algorithm
segment_dependent: no
versions:
  first_appeared: 0.1.1
  last_updated: 0.1.2
last_modified_date: 2025-06-16T14:12:22-04:00
---



### How it's generated

1. The {{ page.inputs[1].input }} is run on all <span class="layer">{{ page.inputs[0].input }}</span> annotations in a single <span class="layer">turn</span>, **excluding** redacted speech (`___`) and incomplete words (ending with `~`)
   - Version 4.2.0, with the "english-caseless-left3words-distsim.tagger" model
