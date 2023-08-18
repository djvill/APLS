# TODO

- Basic fonts/colors styling
	- Number headings
	- TOC numbering: 1.2.1 rather than 1.b.a
- Remove link from page-top `<h1>`s

## Fun but not necessary

- Switch from light mode to dark mode
	- https://just-the-docs.github.io/just-the-docs/docs/customization/#switchable-custom-scheme
	- https://dev.to/whitep4nth3r/the-best-lightdark-mode-theme-toggle-in-javascript-368f
- Callouts: Add icon to `::before` based on (e.g.) `site.note.icon`
	- This is tricky because it's an SVG and it's hard to target `::before` w/ JS. 
	- Prob easier in CSS/Sass if Liquid variables allowed there
