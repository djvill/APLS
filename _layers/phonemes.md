---
synced:
  layer_id: 51
  short_description: Sequence of speech sounds in the word
  alignment: complete interval
  project: phonology
  parent: word
  peers: no
  vertical_peers: no
  data_type: phonological
  layer_manager: Python
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#ddb098'
  extra: (none)
last_sync_modified_date: 2025-09-13T22:23:08-0400
notation:
  primary: DISC
  missing: The current word doesn't have any <span class="layer">segment</span> annotations
inputs:
  - input: segment
    type: layer
  - input: phonemes.py
    type: script
segment_dependent: yes
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.3
last_modified_date: 2025-09-13T22:24:50-04:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
