---
layout: default
nav_exclude: true
search_exclude: true
permalink: /README
---

# Archive of Pittsburgh Language and Speech (APLS)

[![](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

The GitHub repository [`djvill/APLS`](https://github.com/djvill/APLS) hosts documentation and files for users of the **Archive of Pittsburgh Language and Speech** aka **APLS** (pronounced like _apples_).
It powers the website [djvill.github.io/APLS](https://djvill.github.io/APLS) and APLS 'splash page' [apls.pitt.edu](https://apls.pitt.edu), both of which are hosted by GitHub Pages.
This repository (unlike APLS itself) is licensed CC BY-NC-SA 4.0.


If you're looking for the APLS homepage, please visit [apls.pitt.edu](https://apls.pitt.edu).
The APLS corpus is at [apls.pitt.edu/labbcat](https://apls.pitt.edu/labbcat).
This README page describes the repository itself, which may be of interest to developers.


This repo is still very much a work in progress.
However, I anticipate it'll contain info for not only end-users, but also transcribers and corpus maintainers.


## GitHub Pages/Jekyll

The public-facing pages are built and deployed to [djvill.github.io/APLS](https://djvill.github.io/APLS) using GitHub Pages.
The page source is built from the `main` branch's root directory, using the ["deploy from a branch"](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch) workflow.
This repo uses the [just-the-docs theme](https://github.com/just-the-docs/just-the-docs).


This repo only contains a few Jekyll files for customizing just-the-docs (e.g., overwriting `_config.yml`).
As a result, the repo doesn't have all the files to preview the page locally (i.e., with `bundle exec jekyll serve`).
I decided this limitation was worth not clogging up the repository with a ton of Jekyll code.


### Page `last_modified_date`

Markdown files that have the `last_modified_date` parameter set in their YAML headers will have "Page last modified: DATE" appear [in the footer](https://github.com/just-the-docs/just-the-docs/blob/main/_includes/components/footer.html#L15-L19).
(To suppress this, just remove/don't add `last_modified_date` to the header.)
To have this parameter automatically updated when changes are committed to a page, add a pre-commit hook as the file `.git/hooks/pre-commit`:

```bash
#!/bin/sh
# Replace `last_modified_date` timestamp with current time
# Credit: https://mademistakes.com/notes/adding-last-modified-timestamps-with-git/

git diff --cached --name-status | egrep -i "^(A|M).*\.(md)$" | while read a b; do
  cat $b | sed -b "/---.*/,/---.*/s/^last_modified_date:.*$/last_modified_date: $(date "+%Y-%m-%dT%H:%M:%S")/" > tmp
  mv tmp $b
  git add $b
done
```

Solution courtesy of https://mademistakes.com/notes/adding-last-modified-timestamps-with-git/.



## Repo contents

- `_includes/`: Content stubs (see [Jekyll doc](https://jekyllrb.com/docs/includes/))
- `_layouts/`: Page layouts (see [Jekyll doc](https://jekyllrb.com/docs/layouts/))
- `_sass/`: Sass partials (see [Jekyll doc](https://jekyllrb.com/docs/configuration/sass/))
- `assets/`: Site assets (CSS, JavaScript, image files)
- `doc/`: Documentation---the meat of the public-facing website
- `files/`: Files relevant to the corpus
	- `custom-dictionary/`: Custom dictionary entries
	- `layer-scripts/`: Script files for APLS layers annotated by Python layer manager
- `./` (this folder):
	- `.gitignore`: For [Git version control](https://git-scm.com/docs/gitignore)
	- `_config.yml`: Site configuration file (see [Jekyll doc](https://jekyllrb.com/docs/configuration/))
	- `_todo.md`: Site maintenance to-do list
	- `404.md`: Custom "Page not found" error page (see [Jekyll doc](https://jekyllrb.com/tutorials/custom-404-page/))
	- `LICENSE.md`: Markdown conversion of [legal code for CC BY-NC-SA 4.0 license](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)
	- `README.md`: What you're reading right now!
	- `SPLASH.md`: APLS homepage (aka splash page), injected via `<iframe>` into [apls.pitt.edu](https://apls.pitt.edu)
