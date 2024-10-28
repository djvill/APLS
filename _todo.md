# TODO

## Layer reference

- In links JS, add layers' `short_description` as `title` attribute


### Down the line

It'd be cool to have `sync-layers.R` report on the number of annotations and/or a sampling of the most common annotations.


## Glossary

- Create JS that makes the `incontext` links work


## Style

- Set `#main-content > main` min-height so the footer never appears in the middle of the page (e.g., 404 page: https://djvill.github.io/APLS/files/blah%20blah)
	- Something to do with [finding height of <hr> + <footer>](https://stackoverflow.com/a/23749355) and maybe also .main-header and doing some math
- 404 issue link: Prefill some values (https://github.com/isaacs/github/issues/99#issuecomment-24584307)

## Fun but not necessary

- Callouts: Add icon to `::before` based on (e.g.) `site.note.icon`
	- This is tricky because it's an SVG and it's hard to target `::before` w/ JS. 
	- Prob easier in CSS/Sass if Liquid variables allowed there
