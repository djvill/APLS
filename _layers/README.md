# `_layers`

This directory holds:

- Markdown files with layer definitions (one file per layer), with
  - Long prose description in the body of the file
  - [Attributes in a YAML header](#yaml-attributes), including
    - Attributes from layer definitions saved to APLS (`synced`)
    - Manually-input attributes
- `sync-layers.R`, an R script that creates files and populates/updates files' YAML headers based on layer definitions saved to APLS
  - `session-info.txt`, output of `sessionInfo()` within `sync-layers.R`

These files, in turn, will get used to populate the layer reference pages in `doc/`.
(Not _all_ the YAML fields will necessarily go into those pages.)


## YAML attributes

- `name`: Layer name
- `synced`: Attributes from layer definitions saved to APLS, automatically synced by `sync-layers.R`
  - `short_description`
  - `layer_id`
  - `alignment`
  - `project`
  - `data_type` (though in `doc/`, just use `notation` instead)
  - `parent`
  - `scope`
  - `extra`
- `parallel`: Whether there are parallel tags per annotation (e.g., multiple possible phonemic representations)
- `notation`: Notation system used (links to `doc/notation-systems`)
  - `primary`: Main category of notation system (e.g., English, downcased English, Penn Treebank tags, DISC)
  - `additional`: Symbols that augment the primary notation system (e.g., transcription prosody symbols, morpheme marker, DISC syllabification/stress, foll_segment pause symbol)
  - `missing`: How missing values should be interpreted
- `inputs`: Layers and/or other inputs (e.g., APLS custom dictionary) that go into the layer. In a bulleted list where each entry has:
  - `number`: Index for referring to the input in the body of the Markdown file (also sequential input)
  - `input`: Name of input
  - `type`: `layer` or `other`
  - `layer_manager`: If applicable
- `versions`: APLS versions (once versioning begins in earnest), where layer...
  - `first_appeared`
  - `last_modified`
- `last_modified_sync_date`: When the _layer config_ was last modified
- `last_modified_date`: When the _Markdown_ file was last modified (may be after `last_modified_sync_date`). This works the same as `last_modified_date` in the `doc/` Markdown files.


## Rules for use

- **Don't create new Markdown files** for new layers. Instead:
  1. Create the new layer straightaway in APLS. This should include:
     - Any auxiliaries, if applicable
     - A short description suitable for:
       - Tooltip in APLS
       - The "quick reference card" table at `doc/quick-reference-card`
  1. Run `sync-layers.R` to create a Markdown file for the new layer and populate its YAML header
     - If you want to test out a layer config **without the layer showing up in `doc/`, add it to the `testing` project** (you're probably doing that anyway!). While all layers in APLS get a Markdown file, those with `project: testing` get ignored
  1. Fill the following YAML fields manually: `inputs`, `downstream layers`, `notation` (with children `primary`, `additional`)
  1. Fill the body of the Markdown file with a long description
- If you **change _anything_ about a layer config in APLS**:
  1. Re-run `sync-layers.R` to update that layer's YAML header
  1. It may be necessary to update `last_modified_sync_date` and/or `versions: last_updated` manually, in case it's a change that `sync-layers.R` can't detect
  1. Modify the long description in the Markdown file as needed
- If you **delete a layer in APLS**, it won't be deleted here...yet
  - I like the idea of having `sync-layers.R` shunt deleted files to a `deleted/` subfolder, or adding a `deleted: yes` flag that tells `doc/` to ignore that Markdown file. But that's not a priority right now

