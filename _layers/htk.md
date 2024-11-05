---
synced:
  short_description: HTK alignment time
  layer_id: 38
  alignment: sub-interval(s)
  project: temp
  parent: turn
  vertical_peers: no
  data_type: text
  scope: phrase
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
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
last_sync_modified_date: 2024-11-05T15:56:24-0500
parallel: no
notation:
  primary: Time/date
  missing: Force-alignment failed for this utterance (line)
inputs:
  - input: dictionary_phonemes
    type: layer
  - input: HTK
    type: algorithm
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
