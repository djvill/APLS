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


### Pre-commit hook

This repo works best with a [pre-commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks#_committing_workflow_hooks) that does two things:

- Populates/modifies the `last_modified_date` YAML parameter for Markdown files that have this parameter in their headers
	- Rendered pages include this date [in their footer](https://github.com/just-the-docs/just-the-docs/blob/main/_includes/components/footer.html#L15-L19)
	- To suppress this for a given page, just don't add `last_modified_date` to the header.
- Throws an error if the Jekyll theme is set incorrectly in `_config.yml`, to catch an [un-runnable](https://github.com/djvill/APLS/actions/runs/7646841999) [commit](https://github.com/djvill/APLS/commit/85682ae3a72f2b7727664d36e28366d3325eb1c5#diff-ecec67b0e1d7e17a83587c6d27b6baaaa133f42482b07bd3685c77f34b62d883L13-R14) before it gets pushed to GitHub
	- If building locally, `theme` parameter needs to be set and `remote_theme` cannot be set
	- If building on GitHub Pages, it's the opposite


_This hook [does not get cloned with the repo](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks#_client_side_hooks)._
If you clone this repo, copy the following into `.git/hooks/pre-commit`:

```bash
#!/bin/sh
# Pre-commit hook for https://github.com/djvill/APLS

# Replace `last_modified_date` timestamp with current time
# Credit: https://mademistakes.com/notes/adding-last-modified-timestamps-with-git/
git diff --staged --name-status | egrep -i "^(A|M|R).*\.(md)$" | while read a b; do
	if grep -q ^last_modified_date $b ; then
    # If there are unstaged changes (i.e. from git add -p), stash them first, then unstash them after adding last_modified_date
    patched=$(git diff --name-status | grep $b)
    [ "$patched" ] && git stash push -kq -m "Pre-commit hook - $b" -- $b
		cat $b | sed -b "/---.*/,/---.*/s/^last_modified_date:[0-9Tz: -]*\(\r\?\)$/last_modified_date: $(date "+%Y-%m-%dT%H:%M:%S%:z")\1/" > tmp
		mv tmp $b
		git add $b
    [ "$patched" ] && git stash pop -q
	fi
done

# Ensure *staged version* of _config.yml has Jekyll theme options set correctly
theme=$(git show :_config.yml | grep ^theme)
remotetheme=$(git show :_config.yml | grep ^remote_theme)
if [ -n "$theme" ] || [ -z "$remotetheme" ] ; then
	echo "ERROR: Commit not completed."
	echo "  Ensure _config.yml has theme commented-out and remote_theme uncommented."
	echo "  Then try committing again."
	exit 1
fi

# N.B. From https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks#_client_side_hooks:
# 	It’s important to note that client-side hooks are not copied when you clone a 
#		repository. If your intent with these scripts is to enforce a policy, you’ll 
#		probably want to do that on the server side; see the example in An Example Git-
#		Enforced Policy. (https://git-scm.com/book/en/v2/Customizing-Git-An-Example-Git-Enforced-Policy#_an_example_git_enforced_policy)
```

Solution courtesy of https://mademistakes.com/notes/adding-last-modified-timestamps-with-git/.


### Sass deprecation patch

As of just-the-docs version 0.10.0, building the site locally will yield deprecation warnings about Sass `darken()`: https://github.com/just-the-docs/just-the-docs/issues/1541.
As a patch for these deprecation warnings, modify `Gemfile.lock` so it pins the `sass-embedded` gem to version 1.78.0.


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
