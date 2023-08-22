# TODO

- Set `#main-content > main` min-height so the footer never appears in the middle of the page (e.g., 404 page: https://djvill.github.io/APLS/files/blah%20blah)
	- Something to do with [finding height of <hr> + <footer>](https://stackoverflow.com/a/23749355) and maybe also .main-header and doing some math
- 404 issue link: Prefill some values (https://github.com/isaacs/github/issues/99#issuecomment-24584307)
- Add glossary
  - Mark words as `<span class="glossary">`, have them link to anchors on a glossary page
- Convert Rmd to md

## Fun but not necessary

- Switch from light mode to dark mode
	- https://just-the-docs.github.io/just-the-docs/docs/customization/#switchable-custom-scheme
	- https://dev.to/whitep4nth3r/the-best-lightdark-mode-theme-toggle-in-javascript-368f
- Callouts: Add icon to `::before` based on (e.g.) `site.note.icon`
	- This is tricky because it's an SVG and it's hard to target `::before` w/ JS. 
	- Prob easier in CSS/Sass if Liquid variables allowed there
