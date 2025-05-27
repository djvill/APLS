---
title: Navigating APLS
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/navigation
parent: APLS 101/Getting started
nav_order: 50
last_modified_date: 2025-05-27T12:31:58-04:00
---

# {{ page.title }}
{:.no_toc}

After your [initial login]({{ '/doc/sign-up#initial-login' | relative_url }}), logging in at <https://apls.pitt.edu/labbcat> will bring you to the _home_ page for APLS.

This documentation page covers the basics of navigating APLS and the layout of the _home_ page.

{% include page_toc.html collapsible=true open=true %}

## _home_ page layout

<!-- creating blank section for Dan to add screengrabs and such -->

## APLS navigation menus

There are two menus that are present on every APLS page:

- The <span class="keyterm">header menu</span>
- The <span class="keyterm">footer menu</span>

The [header menu](#header-menu) is the main navigation tool for accessing the main pages of APLS.

The [footer menu](#footer-menu) provides links to documentation for citing APLS, the licenses governing the use of APLS, and the versions of APLS and [LaBB-CAT] currently being used.

### Header menu

The <span class="keyterm">header menu</span> is displayed at the top of every APLS webpage.

{% include screengrab.html src="navigation/navigation-header-menu.png" %}

From left to right, the links in the <span class="keyterm">header menu</span> allow you to navigate to:

- The user security page to change your password, like you did during your [initial login]({{ '/doc/sign-up#initial-login' | relative_url }}).
  - This link will display the username you are currently logged in with.
- The [_home_ page](#home-page).
- The [_search_ page]({{ '/doc/search' | relative_url }}).
- The [_extract_ page]({{ '/doc/export-data' | relative_url }}).
- The [_participants_ page]({{ '/doc/browse-participants' | relative_url }}).
- The [_transcripts_ page]({{ '/doc/browse-transcripts' | relative_url }}).
- The [_documentation_ pages]({{ '/' | relative_url }}).
  - This is where you are right now!
- The *question mark* button pulls up the online help for the page you currently have open.
  - The online help pages come from the original [LaBB-CAT] documentation, so the information on these pages may not match what you see in APLS.
    When in doubt, consult the information on the [documentation pages]({{ '/' | relative_url }}) first.

### Footer menu

The <span class="keyterm">footer menu</span> is displayed at the bottom of every APLS webpage.

{% include screengrab.html src="navigation/navigation-footer-menu.png" %}

The <span class="keyterm">footer menu</span> provides links with information about:

- Licenses for [APLS]({{ '/doc/terms' | relative_url }}), and for the [LaBB-CAT software](https://apls.pitt.edu/labbcat/agpl.txt) and [JavaScript](https://apls.pitt.edu/labbcat/credits#jslicense-labels1) that APLS is built on.
- Version history for [APLS]({{ '/doc/version-history' | relative_url }}) and the [version of LaBB-CAT](https://apls.pitt.edu/labbcat/version) currently used by APLS.
- Citation information for [APLS]({{ '/doc/citing-contributing' | relative_url }}) and [LaBB-CAT](https://labbcat.canterbury.ac.nz/howto/cite).
- Attribution information for the [LaBB-CAT] software.

## _home_ page

The _home_ page has direct links to some useful APLS pages and an overview of the data in APLS.

{% include screengrab.html src="navigation/navigation-home-page.png" %}

From left to right, the available links are:

- *Where do I start?*
  - This takes you to the [APLS 101/Getting started]({{ '/doc/apls-101-getting-started' | relative_url }}) section of the documentation pages.
- *Browse transcripts*
  - This brings up the _transcripts_ page, which is explained on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.
- *Browse participants*
  - This brings up the _participants_ page, which is explained on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.
- *Search the corpus*
  - This brings up the _search_ page, which is explained on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page.
- *Credits*
  - This brings up the [APLS credits](https://apls.pitt.edu/labbcat/credits) page, which provides information about resources used in creating APLS.

Below these links is information about the data in APLS.
From left to right, this information shows the current counts for:

- Total main speaker [participants]({{ '/doc/data-organization#participants' | relative_url }}).
- Total [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}).
- Total different [types of annotation layers]({{ '/doc/data-organization#layers-and-annotations' | relative_url }}).
- Total <span class="layer">word</span> tokens.
- Unique <span class="layer">word</span> types.
- Total aligned <span class="layer">segment</span>s.
- Total <span class="transcript-attr">duration</span> of all [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}) in hours:minutes:seconds.

{% include linklist.html %}

