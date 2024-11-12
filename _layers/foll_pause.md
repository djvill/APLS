---
synced:
  short_description: Duration of pause (in seconds) following the current word
  layer_id: 93
  alignment: complete interval
  project: timing
  parent: word
  vertical_peers: no
  data_type: numeric
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  search_targetable: 'no'
  viewable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2024-11-12T17:03:17-0500
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
alignment_dependent: yes
versions:
  first_appeared: 0.1.2
  last_modified: 0.1.2
last_modified_date: Handled by Git pre-commit hook
---

**within-participant**


**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
