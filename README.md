# Archive of Pittsburgh Language and Speech (APLS)

[![](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

This GitHub repository hosts documentation and files for users of the **Archive of Pittsburgh Language and Speech** aka **APLS** (pronounced like _apples_).
It powers the webpage https://djvill.github.io/APLS/, which is hosted by GitHub Pages.
This repository (unlike APLS itself) is licensed CC BY-NC-SA 4.0.


If you're looking for the APLS homepage, please visit https://apls.pitt.edu.
The APLS corpus is at https://apls.pitt.edu/labbcat.
This README page describes the repository itself, which may be of interest to developers.


This repo is still very much a work in progress.
However, I anticipate it'll contain info for not only end-users, but also transcribers and corpus maintainers.


## GitHub Pages

The public-facing pages are built and deployed to https://djvill.github.io/APLS/ using GitHub Pages.
The page source is built from the `main` branch's root directory, using the ["deploy from a branch"](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch) workflow;
by default, this workflow uses the [Primer](https://github.com/pages-themes/primer) Jekyll theme.


This repo only contains a few Jekyll files for customizing Primer (e.g., overwriting `_config.yml`).
As a result, the repo doesn't have all the files to preview the page locally (i.e., with `bundle exec jekyll serve`).
I decided this limitation was worth not clogging up the repository with a ton of Jekyll code.


## Repo contents

- `_includes/`: For [GitHub Pages](#github-pages)
- `_layouts/`: For [GitHub Pages](#github-pages)
- `doc/`: Documentation---the meat of the public-facing website
- `files/`: Files relevant to the corpus
	- `custom-dictionary/`: Custom dictionary entries
