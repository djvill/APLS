---
synced:
  short_description: Syllables in the word, including stress, derived from aligned
    segments
  layer_id: 66
  alignment: sub-interval(s)
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
  additional: Stress markers
  missing: "The current word doesn't have any <span class=\"layer\">segment</span> annotations"
inputs:
  - input: segment
    type: layer
  - input: Unisyn lexicon
    type: dictionary
  - input: APLS custom dictionary
    type: dictionary
  - input: syllables__handle-stress.py
    type: script
  - input: pronounce
    type: layer
  - input: syllables__pronounce-aux.py
    type: script
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.2
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
