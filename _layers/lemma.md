---
synced:
  short_description: All possible base forms of the word
  layer_id: 42
  alignment: complete interval
  project: lexicon
  parent: word
  data_type: text
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  extra: |
    #Wed Nov 24 00:11:58 EST 2021
    SplitAnnotationDelimiters=
    Language=en.*
    GenerateSegments=false
    Sql=SELECT cxen_lemma.HeadDia\r\n FROM cxen_wordform\r\n INNER JOIN cxen_wordformortho ON cxen_wordform.IdNum \= cxen_wordformortho.IdNum\r\n INNER JOIN cxen_lemma ON cxen_wordform.IdNumLemma \= cxen_lemma.IdNumLemma\r\n WHERE cxen_wordformortho.WordDia \= ?\r\n ORDER BY cxen_lemma.Cob DESC
    PronounceOverridesCelex=false
    LayerId=2
last_sync_modified_date: 2024-10-24T16:25:31-0400
parallel: yes
notation:
  primary: English spelling (lowercase)
  missing: Word is not in CELEX
inputs:
  - input: orthography
    type: layer
  - input: CELEX English
    type: dictionary
versions:
  first_appeared: 0.1.0
  last_modified: 0.1.0
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
