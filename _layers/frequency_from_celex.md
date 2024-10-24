---
synced:
  short_description: Word frequency in CELEX English reference corpus
  layer_id: 63
  alignment: complete interval
  project: lexicon
  parent: word
  data_type: numeric
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  viewable: yes
  extra: "#Wed Oct 18 14:15:41 EDT 2023\r\nSplitAnnotationDelimiters=\r\nLanguage=en.*\r\nGenerateSegments=false\r\nSql=SELECT
    cxen_wordform.Cob\\r\\n FROM cxen_wordform\\r\\n INNER JOIN cxen_wordformortho\\r\\n
    ON cxen_wordformortho.IdNum \\= cxen_wordform.IdNum\\r\\n WHERE cxen_wordformortho.WordDia
    \\= ?\\r\\n ORDER BY cxen_wordform.Cob DESC\r\nPronounceOverridesCelex=false\r\nLayerId=2\r\n"
last_sync_modified_date: 2024-10-24T16:25:31-0400
parallel: Whether there are parallel tags per annotation (e.g., multiple possible
  phonemic representations)
notation:
  primary: Main category of notation system (e.g., English, downcased English, Penn
    Treebank tags, DISC); links to `doc/notation-systems`
  additional: _If applicable_, symbols that augment the primary notation system (e.g.,
    transcription prosody symbols, morpheme marker, DISC syllabification/stress, foll_segment
    pause symbol). Delete if not applicable
  missing: How missing values should be interpreted
inputs:
  - input: Name of input
    type: '`layer`, `dictionary`, `algorithm`, `transcription`, or `other`'
  - input: Name of input
    type: '`layer`, `dictionary`, `algorithm`, `transcription`, or `other`'
versions:
  first_appeared: Where layer first appeared
  last_modified: Where layer was last modified
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}
