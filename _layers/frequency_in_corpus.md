---
synced:
  short_description: How often the current word appears in 'interview' and 'metalinguistic'
    transcripts
  layer_id: 64
  alignment: complete interval
  project: lexicon
  parent: word
  peers: no
  vertical_peers: no
  data_type: numeric
  scope: word
  layer_manager: Frequency
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: min_max
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: no
  export_includeAnchorSharing: no
  extra: "#Wed Oct 18 14:16:59 EDT 2023\r\nCorpusId=\r\nSummary=Count\r\nLayerId=2\r\nPauseMarkers=\r\nWordPairs=false\r\nAnnotateTokens=true\r\nParticipantFilterLayer=\r\nMainSpeakerOnly=false\r\nReferenceCorpus=\r\nExcludedTranscriptTypes=6,5,3\r\nScope=Database\r\nParticipantFilterPattern=.*\r\nFilterLayer=\r\nWordPairScope=0\r\nExcludeParticipantFilter=\r\nExcludeFilter=\r\n"
last_sync_modified_date: 2025-02-06T16:25:20-0500
notation:
  primary: Count
  missing: Word is in a "reading" or "pairs" transcript
inputs:
  - input: orthography
    type: layer
segment_dependent: no
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
last_modified_date: 2025-06-16T14:12:12-04:00
---

Frequency counts do not include transcripts in the categories "reading" or "pairs", since these would inflate frequency counts for words in those tasks.


{% include linklist.html %}
