---
title: User interface 
permalink: /doc/user-interface
parent: About APLS
nav_order: 35
last_modified_date: 2025-05-08T10:03:28-04:00
---

# {{ page.title }}
{:.no_toc}

The browser-based user interface for APLS is based on [LaBB-CAT][] version {{site.versions.last.labbcat_version}}.[^r-python]
However, starting with version [0.3.0]({{ '/doc/version-history#0.3.0' | relative_url }}), APLS's user interface has been modified to diverge from the main trunk of LaBB-CAT development.[^diverge]
The modified UI provides a user experience that is more accessible, more consistent across pages, more streamlined, more tightly interwoven with the APLS documentation, and more customizable by the end-user.
It is informed by Dan Villarreal's nearly 10 years of experience using and maintaining LaBB-CAT corpora, teaching students how to use LaBB-CAT, and writing this documentation website with Jack Rechsteiner.

[^r-python]: Advanced users can also access APLS via the [`nzilbb.labbcat` package][labbcat-R] for R, or the [`nzilbb-labbcat` library][labbcat-py] for Python. These packages have most of the functionality of the browser-based graphical user interface (https://apls.pitt.edu/labbcat), with some added benefits such as reproducibility (e.g., a particular set of [search]({{ '/doc/search' | relative_url }}) criteria can be encoded in R/Python code rather than described for copy/paste).

[^diverge]: Some of these features may make their way into the main trunk of LaBB-CAT development in the future.

{% assign curr_version = site.versions.last %}

{: .under-the-hood }
> The source code for the APLS UI is available on GitHub [here](https://github.com/djvill/labbcat-server/).
> This repository is a fork of the [main trunk](https://github.com/nzilbb/labbcat-server) of LaBB-CAT UI development, maintained by Robert Fromont of [NZILBB].
> As of APLS version [{{curr_version.version}}]({{ '/doc/version-history#' | append: curr_version.version | relative_url }}), APLS's UI code is at commit [`{{curr_version.apls_ui_commit}}`](https://github.com/nzilbb/labbcat-server/commit/{{curr_version.apls_ui_commit}}), which is up-to-date with commit [`5da4b06`](https://github.com/nzilbb/labbcat-server/commit/{{curr_version.upstream_ui_commit}}) of the LaBB-CAT UI repository.
> You can view code differences [here](https://github.com/nzilbb/labbcat-server/compare/{{curr_version.upstream_ui_commit}}...djvill:labbcat-server:{{curr_version.apls_ui_commit}}).
>
> LaBB-CAT's entire codebase is spread across multiple repositories:
>
> - <https://github.com/nzilbb/ag>: Annotation graph API
> - <https://github.com/nzilbb/labbcat-java>: Java client library for communicating with LaBB-CAT servers
> - <https://github.com/nzilbb/labbcat-server>: Angular-based user interface, Java servlet, and in-situ wiki-style documentation system
>   - The APLS codebase differs from main-trunk LaBB-CAT only in the Angular-based UI
> - <https://sourceforge.net/p/labbcat/code>: Packaging of the previous, plus user interface for a few remaining pages that haven't been migrated to the new Angular-based UI
>   - Once migration is complete, this repository will be deprecated, with build tools moved to `labbcat-server`

{% include page_toc.html collapsible=true %}

## Layer picker

The layer picker appears in various forms on several pages.

- Individual [transcript pages]({{ '/doc/view-transcript' | relative_url }}): Selects layers to display
  - See comparison [below](#layer-picker-transcript)
- [Search page]({{ '/doc/search' | relative_url }}): Selects layers to search
  - See comparison [below](#layer-picker-search)
- [Transcripts]({{ '/doc/browse-transcripts' | relative_url }}) and [search results]({{ '/doc/export-data' | relative_url }}) pages: Selects attributes and layers to export
  - See comparison [below](#layer-picker-transcripts)

The layer picker has been updated on all these pages, with some page-specific changes.


### All pages

These changes are exemplified by the layer picker on the search page.

{% include compare-ui.html file="layer-picker/search" title_suffix="Search page" caption="The layer picker when first loading the search page" %}

- **More icons**: Previously, the layer picker only displayed icons for layers' [alignment]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}). Now, icons correspond to [data type]({{ '/doc/layer-typology#data-type' | relative_url }}) and [vertical peers]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) as well.
  - **Hideable**: Because this means more visual clutter, these icons can be toggled on and off by clicking _Hide layer icons_. This setting persists if you visit more pages in the same browser tab.
  - **More intuitive alignment**: For technical reasons relating to the [annotation graph][fromont-2017] data structure, <span class="layer-id">turn</span>, <span class="layer-id">word</span>, and <span class="layer-id">segment</span> have "Sub-interval" alignment even though intuitively they should have "Complete interval" alignment. The layer picker now shows them as having "Complete interval" alignment.
- **Docpage links**: The new controls bar at the bottom of the layer picker not only contains controls for showing/hiding information like layer icons, it also links to relevant documentation pages.
- **Cursor**: Previously, it wasn't obvious that you could hover over a layer/attribute name to bring up a longer description. Now, the mouse pointer changes to a ["help" cursor](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor) to cue users to this fact.


### Individual transcript pages

{% include compare-ui.html file="layer-picker/transcript" title_suffix="Transcript pages" caption="The layer picker when first loading the [CB01interview.eaf](https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview1.eaf) transcript page and selecting the _imported_ project" %}

In addition to the [baseline changes](#layer-picker-search), the layer picker on the transcript page has:

- **Annotation counts**: The layer picker displays the number of annotations on that layer in that transcript.
  - **Hideable**: Like the layer icons, annotation counts can be toggled on and off, and this setting persists across the browser tab.
- **Empty layers**: The layer picker shows empty layers (those with 0 annotations in that transcript) in gray, with a checkbox that is grayed-out (cannot be selected) and icons that are grayed-out.
- **Preselected layers**: The <span class="layer-id">word</span> layer is always shown by default and cannot be un-shown. Previously, the layer picker omitted <span class="layer-id">word</span> on the transcript page. Now, the layer picker makes it clearer which layer users are seeing by showing the <span class="layer-id">word</span> layer with a checkbox that is selected and grayed-out (cannot be deselected).
  - **More explicit if empty**: If a preselected layer is empty in that transcript, the layer picker now pops open a message to the user.


### Transcripts and search results pages

{% include compare-ui.html file="layer-picker/transcripts" title_suffix="Transcripts/search results pages" caption="The layer picker when selecting _Export Formatted_ on the transcripts page, or _CSV Export_ on the search results page" %}

The layer picker appears on the transcripts page when selecting _Export Formatted_, and on the search results page when selecting _CSV Export_ or _Utterance Export_.
In the first two cases, the layer picker allows the user to select participant and transcript [attributes]({{ '/doc/attribute-typology' | relative_url}}) in addition to layers.
(The third has the same changes as the [baseline](#layer-picker-search).)
As a result, on top of the [baseline changes](#layer-picker-search), these layer pickers have additional changes to how attributes are displayed:

- **Attribute prefixes**: In LaBB-CAT, most attribute names start with the prefix `participant_` or `transcript_`, which are visible when exporting these attributes to CSV. Previously, the layer picker hid these prefixes to avoid visual clutter, but this could be confusing when comparing to an exported CSV file. Now, the layer picker on these pages gives users the option to toggle attribute prefixes on and off by clicking _Hide attribute prefixes_ (hidden by default). As with layer icons and annotation counts, this setting persists across the browser tab.
- **Real attribute names**: Previously, the layer picker displayed "Name" for the <span class="participant-attr">participant</span> and <span class="transcript-attr">transcript</span> attributes, since these were under columns labeled "Participant" and "Transcript". In keeping with a move toward representing attribute and layer names consistently across contexts (UI and documentation), the layer picker now displays "participant" and "transcript".
- **Attribute tooltips**: Hovering over layer/attribute names brings up a tooltip with information about the layer/attribute. Previously, layer tooltips had longer descriptions but attribute tooltips only had attributes' [display titles](https://djvill.github.io/APLS/doc/attribute-typology#display-title). Now, attribute tooltips have longer descriptions as well.
- **Layer icons**: Previously, icons were only visible on the transcript and search pages, due to the wider layer picker on the transcripts and search results pages. Now, because icons can be hidden, they are visible (and hidden by default) on these pages as well.

{% include linklist.html %}
