---
synced:
  layer_id: 93
  short_description: Duration of pause (in seconds) following the current word
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
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#304552'
  extra: (none)
last_sync_modified_date: 2025-09-13T22:23:08-0400
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
  - input: foll_pause.py
    type: script
segment_dependent: yes
versions:
  first_appeared: 0.1.2
  last_modified: 0.1.2
color: slate gray
last_modified_date: 2025-09-15T09:59:45-04:00
---

**within-participant**


**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
