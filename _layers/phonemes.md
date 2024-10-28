---
synced:
  short_description: The sequence of speech sounds in the word
  layer_id: 51
  alignment: complete interval
  project: phonology
  parent: word
  data_type: phonological
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  extra: (none)
last_sync_modified_date: 2024-10-24T16:25:31-0400
parallel: no
notation:
  primary: DISC
  missing: "The current word doesn't have any <span class=\"layer\">segment</span> annotations"
inputs:
  - input: segment
    type: layer
  - input: phonemes.py
    type: script
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.3
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
