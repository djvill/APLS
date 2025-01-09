---
synced:
  short_description: How often the current word appears in the CELEX English reference
    corpus
  layer_id: 63
  alignment: complete interval
  project: lexicon
  parent: word
  vertical_peers: yes
  data_type: numeric
  scope: word
  layer_manager: CELEX-English
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: min_max
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  extra: "#Wed Oct 18 14:15:41 EDT 2023\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT
    cxen_wordform.Cob\\r\\n FROM cxen_wordform\\r\\n INNER JOIN cxen_wordformortho\\r\\n
    ON cxen_wordformortho.IdNum \\= cxen_wordform.IdNum\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_wordform.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2024-11-20T10:20:29-0500
notation:
  primary: Count
  missing: Word is not in CELEX
inputs:
  - input: orthography
    type: layer
  - input: CELEX English
    type: dictionary
alignment_dependent: no
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
last_modified_date: 2024-11-20T10:21:43-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}