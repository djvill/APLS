---
synced:
  short_description: All possible ways to break down the current word into morphemes
  layer_id: 69
  alignment: complete interval
  project: lexicon
  parent: word
  vertical_peers: yes
  data_type: text
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: regex
  search_targetable: 'no'
  transcript_selectable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  extra: "#Thu Oct 19 14:37:22 EDT 2023\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT\\r\\n
    COALESCE(CONCAT(COALESCE(cxen_lemmamorphologyparse.Imm,cxen_lemma.HeadDia,''),\\r\\n
    REPLACE(COALESCE(cxen_wordformmorphology.TransInfl,''), '@','')),'')\\r\\n FROM
    cxen_wordformmorphology\\r\\n INNER JOIN cxen_wordform ON cxen_wordformmorphology.IdNum
    \\= cxen_wordform.IdNum\\r\\n INNER JOIN cxen_wordformortho ON cxen_wordformmorphology.IdNum
    \\= cxen_wordformortho.IdNum\\r\\n INNER JOIN cxen_lemma ON cxen_wordform.IdNumLemma
    \\= cxen_lemma.IdNumLemma\\r\\n INNER JOIN cxen_lemmamorphologyparse ON cxen_wordform.IdNumLemma
    \\= cxen_lemmamorphologyparse.IdNumLemma\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_lemma.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2024-11-13T14:35:08-0500
notation:
  primary: English spelling (lowercase)
  additional: Morpheme boundary
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
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
