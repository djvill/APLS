---
title: Navigating APLS
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/navigation
parent: APLS 101/Getting started
nav_order: 50
last_modified_date: 2025-10-15T01:44:06-04:00
---

# {{ page.title }}
{:.no_toc}

After your [initial login]({{ '/doc/sign-up#initial-login' | relative_url }}), logging in at <https://apls.pitt.edu/labbcat> will bring you to the <span class="apls-page">Home</span> page for APLS.

This documentation page covers the basics of navigating APLS and the layout of the <span class="apls-page">Home</span> page.

{% include page_toc.html collapsible=true open=true %}

## <span class="apls-page">Home</span> page layout

When you load the <span class="apls-page">Home</span> page, you'll see the following:

1. [Header menu](#header-menu)
1. [Links and statistics](#links-and-stats)
1. [Footer menu](#footer-menu)

The header and footer menus are on every APLS page, so we'll introduce them now.

{% include screengrab.html src="home/overview.png" %}


## Header menu

The <span class="keyterm">header menu</span> is the main navigation tool for accessing the main pages of APLS.
It is displayed at the top of every APLS webpage.

{% include screengrab.html src="home/header-menu.png" %}

From left to right, the links in the <span class="keyterm">header menu</span> allow you to navigate to:

- Sign out, using the {% include labbcat-icon.html src="account-logout.svg" %} icon.
- The [<span class="apls-page">Change password</span> page]({{ '/doc/sign-up#changing-your-password' | relative_url }}).
  - This link will display the username you are currently logged in with.
- The Home page
- The [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }})
- The [<span class="apls-page">Extract</span> page]({{ '/doc/export-data' | relative_url }})
- The [<span class="apls-page">Participants</span> page]({{ '/doc/browse-participants' | relative_url }})
- The [<span class="apls-page">Transcripts</span> page]({{ '/doc/browse-transcripts' | relative_url }})
- <span class="apls-page">Documentation</span>: Where you are right now!
- The *question mark* button pulls up the online help for the page you currently have open.
  - The online help pages come from the original [LaBB-CAT] documentation, so the information on these pages may not match what you see in APLS.
    When in doubt, consult the information on the [documentation site]({{ '/' | relative_url }}) first.


## Footer menu

The <span class="keyterm">footer menu</span> provides links to documentation for citing APLS, the licenses governing the use of APLS, and the versions of APLS and [LaBB-CAT] currently being used.
It is displayed at the bottom of every APLS webpage.

{% include screengrab.html src="home/footer-menu.png" %}

The <span class="keyterm">footer menu</span> provides links with information about:

- Licenses for [APLS]({{ '/doc/terms' | relative_url }}), and for the [LaBB-CAT software](https://apls.pitt.edu/labbcat/agpl.txt) and [JavaScript](https://apls.pitt.edu/labbcat/credits#jslicense-labels1) that APLS is built on.
- Version history for [APLS]({{ '/doc/version-history' | relative_url }}), the [version of LaBB-CAT](https://apls.pitt.edu/labbcat/version) currently used by APLS, and APLS's [custom user interface]({{ '/doc/user-interface' | relative_url }})
- Citation information for [APLS]({{ '/doc/citing-contributing' | relative_url }}) and [LaBB-CAT](https://labbcat.canterbury.ac.nz/howto/cite).
- Attribution information for the [LaBB-CAT] software.


## Links and statistics

Unique to <span class="apls-page">Home</span> page are links to some useful APLS pages and an overview of the data in APLS.

{% include screengrab.html src="home/links-stats.png" %}

From left to right, the available links are:

{% comment %}
- *APLS 101*
  - This takes you to the [APLS 101/Getting started]({{ '/doc/apls-101-getting-started' | relative_url }}) section of the documentation pages.
{% endcomment %}
- *Browse transcripts*
  - This loads the <span class="apls-page">Transcripts</span> page, which is explained on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.
- *Browse participants*
  - This loads the <span class="apls-page">Participants</span> page, which is explained on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.
- *Search the corpus*
  - This loads the <span class="apls-page">Search</span> page, which is explained on the [Searching the corpus]({{ '/doc/search' | relative_url }}) documentation page.
- *Credits*
  - This loads the [Credits](https://apls.pitt.edu/labbcat/credits) page, which provides information about resources used in creating APLS.

Below these links is information about the data in APLS.
From left to right, this information shows the current counts for:

- Total main speaker [participants]({{ '/doc/data-organization#participants' | relative_url }}).
- Total [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}).
- Total distinct [annotation layers]({{ '/doc/data-organization#layers-and-annotations' | relative_url }}) (not counting <span class="layer">turn</span>, <span class="layer">utterance</span>, and other structural layers).
- Total <span class="layer">word</span> tokens.
- Unique <span class="layer">word</span> types.
- Total aligned <span class="layer">segment</span>s.
- Total <span class="transcript-attr">duration</span> of all [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}) in hours:minutes:seconds.

{% include linklist.html %}

