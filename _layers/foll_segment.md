---
synced:
  short_description: Segment or pause following the current segment
  layer_id: 67
  alignment: complete interval
  project: phonology
  parent: segment
  peers: no
  vertical_peers: no
  data_type: phonological
  scope: segment
  layer_manager: Python
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: segment
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2025-01-11T16:50:28-0500
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
last_modified_date: 2025-06-16T14:12:10-04:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
