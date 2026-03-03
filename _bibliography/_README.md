# `_bibliography/`

This folder provides scripts and data for the Bibliography docpage: <https://djvill.github.io/APLS/doc/bibliography>.
There are separate files for each of the three sections on that page:

- publications based on the original fieldwork from which APLS data is drawn
- publications that use APLS
- publications that are about APLS itself

How to use:

1. In Zotero, Export Collection (if selecting collection in folder pane) or Export Items (if selecting items in item listing) to BibTeX format
1. Run `Rscript bib-to-yml.R NAME.bib > ../_data/bibliography/NAME.yml`
1. Take a look at the output to make sure there's not anything weird introduced by the Zotero export or in-R `.cff` conversion. Examples:
   - Zotero exported the journal _Language & Communication_ as `Language \& Communication`
   - `.cff` conversion deleted a final literal `"` that should've been preserved within the title `...enregisterment of "Pittsburghese"`
