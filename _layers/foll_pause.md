---
synced:
  short_description: Pause (if any) following the current word
  layer_id: 93
  alignment: complete interval
  project: timing
  parent: word
  data_type: numeric
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  extra: (none)
last_sync_modified_date: 2024-10-24T16:25:31-0400
parallel: no
notation:
  primary: Numeric (number of seconds)
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
versions:
  first_appeared: 0.1.2
  last_modified: 0.1.2
last_modified_date: Handled by Git pre-commit hook
---

**within-participant**


**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
