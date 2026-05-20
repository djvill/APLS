---
synced:
  layer_id: 101
  short_description: Segment or pause preceding the current segment
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
  search_numValidLabels: 71
  search_targetable: segment
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  color_hex: '#144233'
  num_annotations: 120101
  extra: (none)
last_sync_modified_date: 2026-05-19T23:21:30-0400
notation:
  primary: DISC
  additional: DISC pause
  missing: There's no <span class="layer">segment</span> or <span class="layer">prec_pause</span>
    annotation
inputs:
  - input: segment
    type: layer
  - input: prec_pause
    type: layer
  - input: prec_segment.py
    type: script
segment_dependent: yes
versions:
  first_appeared: 0.4.5
  last_modified: 0.4.5
color: pine green
last_modified_date: 2026-05-19T23:39:50-04:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
