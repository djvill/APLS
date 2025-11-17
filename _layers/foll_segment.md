---
synced:
  layer_id: 67
  short_description: Segment or pause following the current segment
  alignment: complete interval
  project: phonology
  parent: segment
  peers: no
  vertical_peers: no
  data_type: phonological
  layer_manager: Python
  scope: segment
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex_caseSensitive
  search_numValidLabels: 48
  search_targetable: segment
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#8d7b7b'
  extra: (none)
last_sync_modified_date: 2025-11-17T11:32:47-0500
notation:
  primary: DISC
  additional: DISC pause
  missing: There's no <span class="layer">segment</span> or <span class="layer">foll_pause</span>
    annotation
inputs:
  - input: segment
    type: layer
  - input: foll_pause
    type: layer
  - input: foll_segment.py
    type: script
segment_dependent: yes
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.2
color: gray
last_modified_date: 2025-11-17T11:34:49-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
