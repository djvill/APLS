---
synced:
  short_description: All possible phonemic representations of the word
  layer_id: 65
  alignment: complete interval
  project: phonology
  parent: word
  vertical_peers: yes
  data_type: phonological
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
  primary: DISC
  missing: No dictionary entry found
inputs:
  - input: orthography
    type: layer
  - input: Unisyn lexicon
    type: dictionary
  - input: APLS custom dictionary
    type: dictionary
  - input: orthography_no_clitic
    type: layer
  - input: phonemes_no_clitic
    type: layer
  - input: pronounce
    type: layer
alignment_dependent: no
versions:
  first_appeared: 0.1.0
  last_updated: 0.1.2
last_modified_date: '2024-11-05T15:44:38-05:00'
---

This layer contains all possible phonemic representations of the word.
It is used in segmental forced-alignment to tell the aligner which phonemes to find in the utterance.
If there are multiple possible phonemic representations, the aligner chooses the one that is the most plausible given the acoustic features in the utterance.

### Examples




### Search

- The <span class="layer">dictionary_phonemes</span> layer is not as useful for search as <span class="layer">phonemes</span>. <!-- Expand on this -->
<!-- This could be boilerplate for parallel layers -->
- If a word has parallel <span class="layer">dictionary_phonemes</span> annotations, search will match _any_ of the annotations. For more info, see [the "parallel annotations" section of the "Search" page]({{ '/doc/search#parallel-annotations' | relative_url }}).



### Viewing in a transcript

<!-- This could be boilerplate for parallel layers -->
- If a word has parallel <span class="layer">dictionary_phonemes</span> annotations, only the first annotation will be visible on the transcript page. For more info, see [the "parallel annotations" section of the "Data export" page]({{ '/doc/view-transcript#parallel-annotations' | relative_url }}).


### Export

<!-- This could be boilerplate for parallel layers -->
- If a word has parallel <span class="layer">dictionary_phonemes</span> annotations, this will appear in multiple columns of the CSV file. For more info, see [the "parallel annotations" section of the "Data export" page]({{ '/doc/data-export#parallel-annotations' | relative_url }}).



### How it's generated

1. The word's <span class="layer">{{ page.inputs[0].input }}</span> annotation is used to look up phonemic representations in the [{{ page.inputs[1].input }}] and [{{ page.inputs[2].input }}]({{ 'doc/custom-dictionary-entries/' | relative_url }}), returning multiple entries if applicable.
1. If the <span class="layer">{{ page.inputs[0].input }}</span> annotation ends in one or more clitics (*'s*, _s'_, _'d_, _'ll_, _'ve_, _'d've_, *'ll've*) and there's no corresponding dictionary entry, a form of this annotation _without_ any clitics (<span class="layer">{{ page.inputs[3].input }}</span>) is used to look up phonemic representations in the dictionaries (<span class="layer">{{ page.inputs[4].input }}</span>). 
1. If the word has a <span class="layer">{{ page.inputs[5].input }}</span> annotation, this overrides the output of the previous steps.
