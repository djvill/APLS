---
synced:
  short_description: 
  layer_id:
  alignment:
  project:
  data_type:
  parent:
  scope:
  transcripts_exportable:
  matches_exportable:
  searchable:
  viewable:
  extra:
last_sync_modified_date: 
parallel: yes
notation:
  primary: treebank_pos
  missing: "Word is redacted or a hesitation"
inputs:
  - input: orthography
    type: layer
  - input: Stanford POS Tagger
    type: dictionary
versions:
  first_appeared: 0.1.4
  last_updated: 0.1.4
last_modified_date: 2024-10-22T15:39:09-04:00
---



### How it's generated

1. The {{ page.inputs[1].input }} is run on all <span class="layer">{{ page.inputs[0].input }}</span> annotations in a single <span class="layer">turn</span>, **excluding** redacted speech (`___`) and hesitations (ending with `~`)
   - Version 4.2.0, with the "english-caseless-left3words-distsim.tagger" model
