---
synced:
  layer_id: 42
  short_description: All possible base forms of the word
  alignment: complete interval
  project: lexicon
  parent: word
  peers: yes
  vertical_peers: yes
  data_type: text
  layer_manager: CELEX-English
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_numValidLabels: 0
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  color_hex: '#880759'
  num_annotations: 535113
  extra: "#Fri Nov 22 21:40:46 EST 2024\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT
    cxen_lemma.HeadDia\\r\\n FROM cxen_wordform\\r\\n INNER JOIN cxen_wordformortho
    ON cxen_wordform.IdNum \\= cxen_wordformortho.IdNum\\r\\n INNER JOIN cxen_lemma
    ON cxen_wordform.IdNumLemma \\= cxen_lemma.IdNumLemma\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_lemma.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2026-02-09T12:37:57-0500
notation:
  primary: English spelling (lowercase)
  missing: Word is not in CELEX
inputs:
  - input: orthography
    type: layer
  - input: CELEX English
    type: dictionary
segment_dependent: no
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
color: maroon
last_modified_date: 2026-02-09T12:47:52-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
