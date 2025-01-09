---
synced:
  short_description: All possible base forms of the word
  layer_id: 42
  alignment: complete interval
  project: lexicon
  parent: word
  vertical_peers: yes
  data_type: text
  scope: word
  layer_manager: CELEX-English
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  extra: "#Fri Nov 22 21:40:46 EST 2024\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT
    cxen_lemma.HeadDia\\r\\n FROM cxen_wordform\\r\\n INNER JOIN cxen_wordformortho
    ON cxen_wordform.IdNum \\= cxen_wordformortho.IdNum\\r\\n INNER JOIN cxen_lemma
    ON cxen_wordform.IdNumLemma \\= cxen_lemma.IdNumLemma\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_lemma.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2024-11-25T13:43:35-0500
notation:
  primary: English spelling (lowercase)
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
last_modified_date: 2024-11-25T14:02:30-05:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
