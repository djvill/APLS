---
synced:
  layer_id: 100
  short_description: Duration of pause (in seconds) preceding the current word
  alignment: complete interval
  project: timing
  parent: word
  peers: no
  vertical_peers: no
  data_type: numeric
  layer_manager: Python
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: min_max
  search_numValidLabels: 0
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#97313b'
  num_annotations: 396974
  extra: (none)
last_sync_modified_date: 2026-05-19T23:21:30-0400
notation:
  primary: Decimal
  missing: |
    Either:

    - The current word's end-point is "low-confidence" (which usually means the word doesn't have <span class="layer">segment</span> annotations), or
    - The next word's start-point is "low-confidence", or
    - The current word is the participant's last word in the transcript
inputs:
  - input: word
    type: layer
  - input: prec_pause.py
    type: script
segment_dependent: yes
versions:
  first_appeared: 0.4.5
  last_modified: 0.4.5
color: brick red
last_modified_date: 2026-05-19T23:31:29-04:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
