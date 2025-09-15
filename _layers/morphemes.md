---
synced:
  layer_id: 69
  short_description: All possible ways to break down the current word into morphemes
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
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  color_hex: '#6ed116'
  extra: "#Thu Oct 19 14:37:22 EDT 2023\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT\\r\\n
    COALESCE(CONCAT(COALESCE(cxen_lemmamorphologyparse.Imm,cxen_lemma.HeadDia,''),\\r\\n
    REPLACE(COALESCE(cxen_wordformmorphology.TransInfl,''), '@','')),'')\\r\\n FROM
    cxen_wordformmorphology\\r\\n INNER JOIN cxen_wordform ON cxen_wordformmorphology.IdNum
    \\= cxen_wordform.IdNum\\r\\n INNER JOIN cxen_wordformortho ON cxen_wordformmorphology.IdNum
    \\= cxen_wordformortho.IdNum\\r\\n INNER JOIN cxen_lemma ON cxen_wordform.IdNumLemma
    \\= cxen_lemma.IdNumLemma\\r\\n INNER JOIN cxen_lemmamorphologyparse ON cxen_wordform.IdNumLemma
    \\= cxen_lemmamorphologyparse.IdNumLemma\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_lemma.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2025-09-13T22:23:08-0400
notation:
  primary: English spelling (lowercase)
  additional: Morpheme boundary
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
color: apple green
last_modified_date: 2025-09-15T09:59:46-04:00
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
