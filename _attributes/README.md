# `_attributes`

This directory holds:

- Markdown files with attribute definitions (one file per attribute), with
  - Title that's `<attribute-name>.md`
  - Long prose description in the body of the file
  - [Properties in a YAML header](#yaml-properties), including
    - Properties from attribute definitions saved to APLS (`synced`)
    - Properties relating to how users can interact with attributes

These files, in turn, will get used to populate the layer reference pages in `doc/`.
(Not _all_ the YAML fields will necessarily go into those pages.)


## YAML attributes

- `synced`: Properties from attribute definitions saved to APLS, automatically synced by `sync-layers.R`
  - `layer_id`
  - `display_title`
  - `parent`
  - `multi_select`
  - `valid_labels`
  - `data_type`
  - `attribute`
  - `short_description`
  - `display_order`
  - `filterable`
  - `access`
  - `attrib_type`
  - `transcripts_exportable`
  - `attrib_page_viewable`
  - `matches_exportable`
  - `export_includeCounts`
- `last_sync_modified_date`: When `synced` was last modified
- `last_modified_date`: When the _Markdown_ file was last modified (may be after `last_modified_sync_date`). This works the same as `last_modified_date` in the `doc/` Markdown files.


## Rules for use

- **Don't create new Markdown files** for new attributes. Instead:
  1. Create the new attribute straightaway in APLS. This should include:
     - Any auxiliaries, if applicable
     - A short description suitable for:
       - Tooltip in APLS
       - The "quick reference card" table at `doc/quick-reference-card`
  1. Run `sync-layers.R` to create a Markdown file for the new attribute and populate its YAML header
  1. Fill the body of the Markdown file with a longer description
     - Any headings should be level-3
- If you **change _anything_ about an attribute config in APLS**:
  1. Re-run `sync-layers.R` to update that attribute's YAML header
  1. It may be necessary to update `last_modified_sync_date` manually, in case it's a change that `sync-layers.R` can't detect
  1. Modify the long description in the Markdown file as needed
- If you **delete an attribute in APLS**, it won't be deleted here...yet
  - I like the idea of having `sync-layers.R` shunt deleted files to a `deleted/` subfolder, or adding a `deleted: yes` flag that tells `doc/` to ignore that Markdown file. But that's not a priority right now

