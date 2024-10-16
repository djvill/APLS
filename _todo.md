# TODO

## Layer reference

- Write `sync-layers.R` (see [`_layers/README.md`](_layers/README.md))


## Glossary

- Mark key terms as `<span class="keyterm">` in `doc/` files
- Create a YAML file that looks kinda like this:
  ```yaml
  - term: transcript
    definition: | Multiple
                | lines
                | if necessary
    incontext:
      - links to anchors
      - on pages
      - where the term appears
      - (once per page)
    related:
      - similar concepts
      - and/or
      - terms that could be easily confused (e.g., _transcript_ vs. _transcription_)
  ```
- Create an R/bash script that trawls the `doc/` files and updates the YAML file to:
  - Create new entries if needed
  - Update `incontext` links
- Create JS that makes the `incontext` links work


## Site

- Figure out how to create a list of links that should always go to the same spot (using the Markdown link shortcut syntax) so that (e.g.) doing [LaBB-CAT][] always goes to https://apls.pitt.edu/labbcat, or [some text][htk] always goes to the HTK page

## Style

- Style external links differently
- Set `#main-content > main` min-height so the footer never appears in the middle of the page (e.g., 404 page: https://djvill.github.io/APLS/files/blah%20blah)
	- Something to do with [finding height of <hr> + <footer>](https://stackoverflow.com/a/23749355) and maybe also .main-header and doing some math
- 404 issue link: Prefill some values (https://github.com/isaacs/github/issues/99#issuecomment-24584307)

## Fun but not necessary

- Callouts: Add icon to `::before` based on (e.g.) `site.note.icon`
	- This is tricky because it's an SVG and it's hard to target `::before` w/ JS. 
	- Prob easier in CSS/Sass if Liquid variables allowed there
