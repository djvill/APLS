---
synced:
  layer_id: 38
  short_description: HTK alignment time
  alignment: sub-interval
  project: temp
  parent: turn
  peers: yes
  vertical_peers: no
  data_type: text
  layer_manager: HTK
  scope: phrase
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_numValidLabels: 0
  search_targetable: phrase
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: yes
  color_hex: '#9f6200'
  num_annotations: 40860
  extra: |
    #Wed Dec 01 16:47:47 EST 2021
    PronunciationLayerId=40
    LeftPattern=Barbara Johnstone|Trista Pennington|.*
    PauseMarkers=-- - .
    NoisePatterns=laugh.* unclear .*noise.* .*hit.* .*knock.* .*bump.* .*brush.* .*tap.*
    GroupBy=Speaker
    UseP2FA=false
    SampleRate=
    ScoreLayerId=39
    WordLayerId=0
    SegmentLayerId=1
    CleanupOption=0
    OverlapThresholdPercent=5
    IgnoreAlignmentStatuses=false
    HVitePruningThreshold=250
    RightPattern=Barbara Johnstone|Trista Pennington|.*
    OtherGroupBy=Not Aligned
last_sync_modified_date: 2026-02-09T12:37:57-0500
notation:
  primary: Time/date
  missing: Force-alignment failed for this utterance (line)
inputs:
  - input: dictionary_phonemes
    type: layer
  - input: HTK
    type: algorithm
segment_dependent: yes
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
color: bronze
last_modified_date: 2026-02-09T12:47:52-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
