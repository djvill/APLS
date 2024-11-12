---
synced:
  short_description: All possible phonemic representations of the word, translated
    to Montreal Forced Aligner US English IPA phoneset
  layer_id: 82
  alignment: complete interval
  project: testing
  parent: word
  vertical_peers: yes
  data_type: text
  scope: word
  transcripts_exportable: yes
  matches_exportable: yes
  searchable: search-matrix
  search_targetable: 'no'
  viewable: yes
  export_includeCounts: yes
  export_includeAnchorSharing: no
  extra: (none)
last_sync_modified_date: 2024-11-12T17:03:17-0500
notation:
  primary: MFA IPA for English
  missing: No dictionary entry found
inputs:
  - input: ipa_phonemes
    type: layer
alignment_dependent: no
versions:
  first_appeared: 0.1.1
  last_modified: 0.1.2
last_modified_date: Handled by Git pre-commit hook
---

**Fill longer description here**

Any headings should be level-3


{% include linklist.html %}

## Notes

Developed based on:

- MFA US English IPA phoneset: https://mfa-models.readthedocs.io/en/latest/dictionary/English/English%20%28US%29%20MFA%20dictionary%20v2_2_1.html
- LaBB-CAT's DISC-to-IPA mapping: https://nzilbb.github.io/ag/apidocs/nzilbb/encoding/package-summary.html

## Inputs

(1) **ipa_phonemes** layer


## Downstream layers

Used by **mfa** for aligning the **mfaPhone** and **mfaWord** layers
