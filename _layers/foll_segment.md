---
synced:
  short_description: Segment or pause following the current segment
  layer_id: 67
  alignment: sub-interval
  project: phonology
  parent: segment
  vertical_peers: no
  data_type: phonological
  scope: segment
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  search_targetable: segment
  viewable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2024-11-12T17:04:07-0500
notation:
  primary: DISC
  additional: '`.` for pauses'
  missing: There's no <span class="layer">segment</span> or <span class="layer">foll_pause</span>
    annotation
inputs:
  - input: segment
    type: layer
  - input: foll_pause
    type: layer
  - input: foll_segment.py
    type: script
alignment_dependent: yes
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.2
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
