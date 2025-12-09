# APLS versioning

This folder contains individual files, each describing a version of APLS.
It is implemented as a [Jekyll collection](https://jekyllrb.com/docs/collections/) so content can be added dynamically to [`doc/version`](../doc/version).


## Numbering scheme

Versioning refers to both APLS itself and the APLS documentation site [`djvill.github.io/APLS/`](https://djvill.github.io/APLS/) (including the splash page at [`apls.pitt.edu`](https://apls.pitt.edu/)).
Ideally, the APLS documentation will always keep up with changes to APLS itself.
Versions are numbered with the scheme `major.minor.sub`:

- The **major** version should be incremented anytime there's a substantial overhaul. I still have to figure out what that means in practice. It will remain 0 until all of the "phase 1" transcriptions are uploaded
- The **minor** version should be incremented when layers are added or changed, including when hand-corrections are added.
- The **sub**version should be incremented when LaBB-CAT is updated, and/or when there are UI/documentation changes that don't affect actual functionality.

The current version (0.1.4) is a pre-release version of APLS that is undated.
Once APLS and its documentation pages stabilize, versioning will begin in earnest.

## Versioning implementation

Version files are named with the version number.
Their contents should be as follows:

```
---
version: VERSION
date: D MMM YYYY
labbcat_version: LABBCAT_VERSION
---

SUMMARY

#### Credits (if applicable)
{:.no_toc}

[Kilgore Trout](https://kilgore-trout.github.io/) contributed hand-corrections for STRUT tokens in Hill District interview files.
Thanks, Kilgore!


#### New features (if applicable)
{:.no_toc}

- Description
- Description
  - Details

#### Breaking changes (if applicable)
{:.no_toc}

- Description
- Description
  - Details

```

### Repository versioning

When incrementing a version, the `djvill/APLS` repository should be tagged with the version number, and a release should be added (with the version file serving as release notes).

## Handy hints

To figure out what's changed in the UI since the last APLS version, go to the `labbcat-server` repo.
Let's say I'm in version 0.4.2 and I want to figure out changes since 0.4.1.

```bash
# Changes to UI since 0.4.1
cd user-interface/src/main/angular/projects
git log --oneline --no-merges apls-dev ^96d80f5 -- .

# Changes to a particular component since 0.4.1
git log --oneline --no-merges apls-dev ^96d80f5 -- labbcat-view/src/app/transcript

# Changes to multiple components since 0.4.1
git log --oneline --no-merges apls-dev ^96d80f5 -- labbcat-view/src/app/transcript labbcat-common/src/lib/layer-checkboxes

# Changes since 0.4.1 authored by me
git log --oneline --no-merges apls-dev ^96d80f5 --author="Dan" -- .

# Changes since 0.4.1 not in upstream
git log --oneline --no-merges apls-dev ^96d80f5 ^upstream -- .
```
