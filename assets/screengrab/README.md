# Screengrabs

There are a few different "pots" of screengrab files:

- `new-ui`: Screengrabs used for comparing old vs. new UI at <https://djvill.github.io/doc/user-interface>
- Screengrabs used for the bulk of the documentation
  - `_raw`: Raw screengrabs that are used to build some of the...
  - (All other subfolders) User-facing screengrabs

Within each of these "pots", file paths are based on the LaBB-CAT page (specifically, the end of the URL), **not** the documentation page.
For example:

- `transcript/attributes.png`
- `search/input-field-orthography2.png`
- `matches/layout.png`

This is so that when the UI is updated, the documentation side is as easy to maintain as possible.
For example, if only the <https://apls.pitt.edu/search> UI is updated, the screengrabs in `search/` are the only ones that need to be checked for needed updates (no need to trawl the documentation for all instances of a search screengrab).

This includes the **result of an export** on a given page, even though the page itself isn't the thing being screengrabbed.
For example, `transcript/export-praat-1.png`, a Praat screengrab, is the result of clicking things on <https://apls.pitt.edu/transcript/transcript=CB01interview3.eaf>.

Some exceptions to keep things less annoying:

- <https://apls.pitt.edu/extract> pages get sub-subfolders within the `extract/` subfolder (e.g., `extract/exportFragments/post-upload.png`).
- <https://apls.pitt.edu/participantsExport> is a sub-subfolder within the `participants` subfolder.
- <https://apls.pitt.edu/> goes in `home/`.
- Anything having to do with setting up the Praat integration goes in `praat-integration/`.
- Anything that doesn't relate to a specific page **within** APLS goes in `no-page/`. This includes troubleshooting things where no valid page loads, the login box, etc.
