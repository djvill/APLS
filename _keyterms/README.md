# `_keyterms/`

This directory holds:

- A YAML file (`keyterms.yml`) with a glossary of key terms
- A template YAML file (`keyterm-template.yml`) that is used for new key terms
- `update-keyterm-list.R`, an R script that trawls `doc/` pages for key terms, populates `keyterms.yml` with new terms, and updates the `incontext` lists of back-links in `keyterms.yml`
  - `session-info.txt`, output of `sessionInfo()` within `sync-layers.R`

`keyterms.yml`, in turn, will get used to populate the glossary page (`doc/glossary`).

For the meaning of YAML attributes, see `keyterm-template.yml`.

I might want to add a "category" attribute for sorting/separating key terms into glossary sections;
currently I'm thinking "LaBB-CAT" (e.g., _transcript_) vs. "Linguistics" (e.g., _sociolinguistic interview_) vs. "Data science" (e.g., _unique identifier_).
I'll hold off for now, though, since that'd tempt me to create definitions for lots of terms that are low-priority.
