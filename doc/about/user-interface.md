---
title: User interface 
permalink: /doc/user-interface
parent: About APLS
nav_order: 35
last_modified_date: 2025-05-27T16:16:13-04:00
---

# {{ page.title }}
{:.no_toc}

The browser-based user interface for APLS is based on [LaBB-CAT][] version {{site.versions.last.labbcat_version}}.[^r-python]
However, starting with version [0.3.0]({{ '/doc/version-history#0.3.0' | relative_url }}), APLS's user interface has been modified to diverge from the main trunk of LaBB-CAT development.[^diverge]
The modified UI provides a user experience that is more accessible, more consistent across pages, more streamlined, more tightly interwoven with the APLS documentation, and more customizable by the end-user.
It is informed by Dan Villarreal's nearly 10 years of experience using and maintaining LaBB-CAT corpora, teaching students how to use LaBB-CAT, and writing this documentation website with Jack Rechsteiner.

[^r-python]: Advanced users can also access APLS via the [`nzilbb.labbcat` package][labbcat-R] for R, or the [`nzilbb-labbcat` library][labbcat-py] for Python. These packages have most of the functionality of the browser-based graphical user interface (https://apls.pitt.edu/labbcat), with some added benefits such as reproducibility (e.g., a particular set of [search]({{ '/doc/search' | relative_url }}) criteria can be encoded in R/Python code rather than described for copy/paste).

[^diverge]: Some of these features have already been [accepted](https://github.com/nzilbb/labbcat-server/issues?q=is%3Aclosed%20is%3Apr%20author%3Adjvill%20is%3Amerged) for the main trunk of LaBB-CAT development and will appear in a future LaBB-CAT release.

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

This page is a non-exhaustive list of these user interface modifications.

{% include page_toc.html collapsible=true %}

## Layer picker

The layer picker appears in various forms on several pages.

- Individual [<span class="apls-page">Transcript</span> pages]({{ '/doc/view-transcript' | relative_url }}): Selects layers to display
  - See comparison [below](#layer-picker-transcript)
- [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}): Selects layers to search
  - See comparison [below](#layer-picker-search)
- [<span class="apls-page">Transcripts</span>]({{ '/doc/browse-transcripts' | relative_url }}) and [<span class="apls-page">Search results</span>]({{ '/doc/export-data' | relative_url }}) pages: Selects attributes and layers to export
  - See comparison [below](#layer-picker-transcripts)

The layer picker has been updated on all these pages, with some page-specific changes.


### All pages

These changes are exemplified by the layer picker on the <span class="apls-page">Search</span> page.

{% include compare-ui.html file="layer-picker/search" title_suffix="Search page" caption='The layer picker when first loading the <span class="apls-page">Search</span> page' %}

- **More icons**: Previously, the layer picker only displayed icons for layers' [alignment]({{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}). Now, icons correspond to [data type]({{ '/doc/layer-typology#data-type' | relative_url }}) and [vertical peers]({{ '/doc/layer-typology#vertical-peers' | relative_url }}) as well.
  - **Hideable**: Because this means more visual clutter, these icons can be toggled on and off by clicking _Hide layer icons_. This setting persists if you visit more pages in the same browser tab.
  - **More intuitive alignment**: For technical reasons relating to the [annotation graph][fromont 2017] data structure, <span class="layer">turn</span>, <span class="layer">word</span>, and <span class="layer">segment</span> have "Sub-interval" alignment even though intuitively they should have "Complete interval" alignment. The layer picker now shows them as having "Complete interval" alignment.
- **Docpage links**: The new controls bar at the bottom of the layer picker not only contains controls for showing/hiding information like layer icons, it also links to relevant documentation pages.
- **Cursor**: Previously, it wasn't obvious that you could hover over a layer/attribute name to bring up a longer description. Now, the mouse pointer changes to a ["help" cursor](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor) to cue users to this fact.
- **Bugfix**: On the <span class="apls-page">Search</span> and <span class="apls-page">Transcript</span> page, most layer checkboxes are hidden when the page loads, with batches of checkboxes made visible by selecting [projects]({{ '/doc/layer-typology#project' | relative_url }}). Previously, if you selected a project, selected a layer in the project, then deselected the project, that layer's checkbox would disappear. Now, checkboxes for selected layers don't disappear even if their project is deselected.


### Individual <span class="apls-page">Transcript</span> pages

{% include compare-ui.html file="layer-picker/transcript" title_suffix="Transcript pages" caption='The layer picker when first loading the [CB01interview.eaf](https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview1.eaf) <span class="apls-page">Transcript</span> page, clicking the _Layers_ tab, and selecting the _imported_ project' %}

In addition to the [baseline changes](#layer-picker-search), the layer picker on the <span class="apls-page">Transcript</span> page has:

- **Annotation counts**: The layer picker displays the number of annotations on that layer in that transcript.
  - **Hideable**: Like the layer icons, annotation counts can be toggled on and off, and this setting persists within a browser tab.
- **Empty layers**: The layer picker shows empty layers (those with 0 annotations in that transcript) in gray, with a checkbox that is grayed-out (cannot be selected) and icons that are grayed-out.
- **Preselected layers**: The <span class="layer">word</span> layer is always shown by default and cannot be un-shown. Previously, the layer picker omitted <span class="layer">word</span> on the <span class="apls-page">Transcript</span> page. Now, the layer picker makes it clearer which layer users are seeing by showing the <span class="layer">word</span> layer with a checkbox that is selected and grayed-out (cannot be deselected).
  - **More explicit if empty**: If a preselected layer is empty in that transcript, the layer picker now pops open a message to the user.


### <span class="apls-page">Transcripts</span> and <span class="apls-page">Search results</span> pages

{% include compare-ui.html file="layer-picker/transcripts" title_suffix="Transcripts/Search results pages" caption='The layer picker when selecting _Export Formatted_ on the <span class="apls-page">Transcripts</span> page, or _CSV Export_ on the <span class="apls-page">Search results</span> page' %}

The layer picker appears on the <span class="apls-page">Transcripts</span> page when selecting _Export Formatted_, and on the <span class="apls-page">Search results</span> page when selecting _CSV Export_ or _Utterance Export_.
In the first two cases, the layer picker allows the user to select participant and transcript [attributes]({{ '/doc/attribute-typology' | relative_url}}) in addition to layers.
(The third has the same changes as the [baseline](#layer-picker-search).)
As a result, on top of the [baseline changes](#layer-picker-search), these layer pickers have additional changes to how attributes are displayed:

- **Attribute prefixes**: In LaBB-CAT, most attribute names start with the prefix `participant_` or `transcript_`, which are visible when exporting these attributes to CSV. Previously, the layer picker hid these prefixes to avoid visual clutter, but this could be confusing when comparing to an exported CSV file. Now, the layer picker on these pages gives users the option to toggle attribute prefixes on and off by clicking _Hide attribute prefixes_ (hidden by default). As with layer icons and annotation counts, this setting persists within a browser tab.
- **Real attribute names**: Previously, the layer picker displayed "Name" for the <span class="participant-attr">participant</span> and <span class="transcript-attr">transcript</span> attributes, since these were under columns labeled "Participant" and "Transcript". In keeping with a move toward representing attribute and layer names consistently across contexts (UI and documentation), the layer picker now displays "participant" and "transcript".
- **Attribute tooltips**: Hovering over layer/attribute names brings up a tooltip with information about the layer/attribute. Previously, layer tooltips had longer descriptions but attribute tooltips only had attributes' [display titles](https://djvill.github.io/APLS/doc/attribute-typology#display-title). Now, attribute tooltips have longer descriptions as well.
- **Layer icons**: Previously, icons were only visible on the <span class="apls-page">Transcript</span> and <span class="apls-page">Search</span> pages, due to the wider layer picker on the <span class="apls-page">Transcript</span> and <span class="apls-page">Search results</span> pages. Now, because icons can be hidden, they are visible (and hidden by default) on these pages as well.


## Individual <span class="apls-page">Transcript</span> pages

The comparison images in this section come from the [HD05interview2.eaf](https://apls.pitt.edu/labbcat/transcript?transcript=HD05interview2.eaf) <span class="apls-page">Transcript</span> page.

### Header tabs

{% include compare-ui.html file="transcript-header/tabs" caption='Header tabs on the <span class="apls-page">Transcript</span> page. _Attributes_ is the rightmost tab in the old UI (the media player is hidden in subsequent comparisons)' %}

- _Attributes_ tab
  {% include compare-ui.html file="transcript-header/attributes" caption='The <span class="apls-page">Transcript</span> page _Attributes_ tab' %}
  - **More attributes**: Previously, <span class="transcript-attr">corpus</span> and <span class="transcript-attr">episode</span> were visible on [<span class="apls-page">Transcript attributes</span> pages]({{ '/doc/browse-transcripts#transcript-attributes-pages' | relative_url }}), but not on the <span class="apls-page">Transcript</span> page itself. This page now displays these attributes.
  - **Real attribute names**: Previously, the _Attributes_ tab only displayed attributes' [display titles](https://djvill.github.io/APLS/doc/attribute-typology#display-title), with names in a tooltip. Now, this tab displays attribute names.
    - **Hideable**: These names can be toggled on and off by clicking _Hide attribute names_. This setting persists if you visit more pages in the same browser tab.
    - **Attribute prefixes**: As in the [layer picker](#layer-picker-transcripts), the `transcript_` prefix is hidden by default but can be shown by unchecking _Hide attribute prefixes_. When attribute names are hidden, this checkbox is grayed-out. Like _Hide attribute names_, this setting persists within a browser tab.
- _Participants_ tab
  {% include compare-ui.html file="transcript-header/participants" caption='The <span class="apls-page">Transcript</span> page _Participants_ tab' %}
  - **More explicit**: Previously, participant names were links to that participant's [attributes page]({{ '/doc/browse-participants#participant-attributes-pages' | relative_url }}). Now, the link is a more explicit button. In addition, the fact that bold styling indicates the transcript's main participant is now made explicit.
  - **New functionality**: The new _List Transcripts_ button is a shortcut to [_List Transcripts_]({{ '/doc/browse-participants#list-transcripts' | relative_url }}) on the <span class="apls-page">Participants</span> page.
- _Layers_ tab
  - **Improved layer picker**: See [above](#layer-picker-transcript).
- _Search_ tab
  {% include compare-ui.html file="transcript-header/search" caption='The <span class="apls-page">Transcript</span> page _Search_ tab' new_only="true" %}
  - **New functionality**: The new _Search_ tab provides shortcuts to the <span class="apls-page">Search</span> page with [transcript or participant filters]({{ '/doc/search-filters-and-options' | relative_url }}) applied.
- _Export_ tab
  {% include compare-ui.html file="transcript-header/participants" caption='The <span class="apls-page">Transcript</span> page _Export_ tab' %}
  - **More consistent**: Label and icon now mirror [_Export Formatted_]({{ '/doc/browse-transcripts#export-formatted' | relative_url }}) on the <span class="apls-page">Transcripts</span> page.
  - **More explicit** about which layers will be exported (updated when the user selects different layers in the layer picker).


### Transcript body

- **More consistent turn alignment**, including overlap vs. non-overlap turns
  {% include compare-ui.html file="transcript-body/turns" caption='Four turns in the transcript starting at around 16 seconds' %}
- **Segment labels don't crowd together**
  {% include compare-ui.html file="transcript-body/phono-labels" caption='The start of a turn around 31 seconds, with the segment layer switched on' %}
- **Word menu**: Options relabeled to be more descriptive and rearranged to put commonly-used options higher. The clicked-on word is styled to make it more obvious which word has been selected.
  {% include compare-ui.html file="transcript-body/word-menu" caption='The menu that appears when clicking on a word early in the transcript' %}
  - **Don't clobber result highlights**: The word menu allows users to create a permalink by selecting _Utterance_ or _Word_. Previously, this would remove any highlighting of [search results]({{ '/doc/export-data#search-results-page' | relative_url }}). Now, permalinking doesn't remove this highlighting.


## <span class="apls-page">Search</span> page

- **Reorganized layout**: By putting filters and options in tabs, the <span class="apls-page">Search</span> page directs users toward its central functionality: specifying patterns to search the corpus for via the search matrix.
  {% include compare-ui.html file="search/layout" caption='The <span class="apls-page">Search</span> page when first loaded' %}


### Search matrix

- **Don't clobber matrix**: Previously, if you specified a search matrix (selected some layers, entered text in pattern input fields, etc.) then selected a participant or transcript filter, the search matrix would be reset when you returned to the <span class="apls-page">Search</span> page. This could lead to frustration if the participant or transcript filter was an afterthought to the linguistic patterns themselves. Now, the search matrix persists after selecting filters.
- **Improved layer picker**: See [above](#layer-picker-search).
- Regular expressions: One of the things that makes LaBB-CAT search so powerful is its use of [regular expressions]({{ '/doc/regex' | relative_url }}) (aka _regex_), a very concise language for specifying complex text patterns. Regex have a steep learning curve for newcomers and are easy to mis-type. 
  - **More informative errors**: While LaBB-CAT provides live-checking for invalid regex (changing to red text), simply _knowing_ that a regex is invalid may not be enough to help a newcomer troubleshoot it. The search matrix now creates a popup "speech bubble" explaining the error (which waits 2 seconds to appear in case the user is simply in the middle of typing).
    {% include compare-ui.html file="search/invalid-regex" caption='A pattern input field after typing an invalid regular expression' %}
  - **Stricter checking**: Previously, some patterns that could cause search errors were not flagged by live-checking. Live-checking now flags these patterns.
    {% include compare-ui.html file="search/lax-regex" caption='The result of typing the invalid regular expression `{` and pressing _Search_' %}
- Label picker: LaBB-CAT provides a [drop-down menu]({{ '/doc/search-other-layers#layer-data-types-and-notation-systems' | relative_url }}) for layers whose [notation system]({{ '/doc/layer-typology#notation-system' | relative_url }}) might be unfamiliar to users. For example, when searching the <span class="layer">segment</span> layer, a user can click on _aʊ_ to insert `6` (the [DISC code]({{ '/doc/layer-notation-systems#disc-alphabet' | relative_url }}) for /aʊ/) into the pattern input field. The label picker can also insert patterns that match any member of a category. For example, clicking _Diphthongs_ inserts `[12645]` (the DISC codes for /eɪ aɪ aʊ ɔɪ oʊ/), using the regex syntax for matching any one of the characters within [square brackets]({{ '/doc/regex#square-brackets-' }}).
  - **Inserted at cursor**: Previously, the label picker always inserted labels at the end of the pattern, which could necessitate some cutting and pasting. Now, labels are inserted wherever the cursor is (and briefly highlighted to draw the user's attention).
  - **More informative**: Corpus admins can configure the label picker to omit labels that should be obvious to the user for simplicity's sake; for example, the [DISC code]({{ '/doc/layer-notation-systems#disc-alphabet' | relative_url }}) for /p/ is `p`. Previously, these labels were simply absent, which could be confusing if (for example) a user was looking for the label for /p/. Now, the label picker includes a note and tooltip listing these labels.
    {% include compare-ui.html file="search/other-cons" caption='The label picker for the segment layer' %}
  - **More consistent regex**: In regex, some characters have special functions <!-- consider intro-ing _metacharacters_ -->; for these characters to be interpreted literally (rather than for their special regex function), they need to be "escaped" (prefixed with `\`). For example, the symbol `.` on the <span class="layer">foll_segment</span> layer means a [following pause]({{ '/doc/layer-notation-systems#disc-extensions' | relative_url }}), but in regex `.` means "any single character"; so to search for a following pause, you need to enter `\.` in the <span class="layer">foll_segment</span> input field. Complicating matters is that many characters lose their special regex functions inside [square brackets]({{ '/doc/regex#square-brackets-' }}), so escaping them is optional there. The label picker escapes characters that have a special regex function, but previously it would only do so outside of square brackets (i.e., only where strictly necessary). Regex newcomers often find escapes and exceptions to syntax rules bewildering, so it could create confusion to see `\` in some contexts but not others. Now, the label picker escapes special regex characters in all contexts (even when they're not strictly necessary), for a gentler regex learning curve.
    {% include compare-ui.html file="search/bracket-escapes" caption='The pattern input field for the phonemes layer after selecting _æ_, then _ɔ_, then _Monophthongs not before /ɹ/_' %}


### Participant and transcript filter

- **More intuitive interface**
  - Previously, the participant and transcript filters were activated by links that looked like (non-clickable) headings. Now, filters are buttons within collapsible tabs.
    {% include compare-ui.html file="search/filter" caption='The transcript filter panel/tab when first loading the <span class="apls-page">Search</span> page' %}
  - Previously, clicking the filter link would modify the filter, but there was no obvious way to clear the filter. Now, new buttons more clearly delineate these actions.
    {% include compare-ui.html file="search/p-filter" caption='The participant filter panel/tab after selecting the filter &quot;Neighborhood in (CB,FH), Speaker type = Main speaker&quot;' %}
- **More information**: Labels for the filter tabs display the number of participants/transcripts that will be included in the search. If only one filter has been selected, the other filter tab label shows "(\*)" to indicate that it is implicitly filtered (i.e., not all participants appear in all transcripts), and the text "Selected {participants/transcripts}: all {participants/transcripts}" changes to "Selected {participants/transcripts}: all {participants in selected transcripts/transcripts with selected participants}".
  {% include compare-ui.html file="search/p-filter-t" caption='The transcript filter panel/tab after selecting the participant filter &quot;Neighborhood in (CB,FH), Speaker type = Main speaker&quot;' %}
- **Better guidance**: Instead of selecting a filter manually when performing a search, users can upload a file with participants to search. Previously, there was no guidance on file formatting. Now, this information is in a collapsible.
  {% include compare-ui.html file="search/load-from-file" caption='The participant filter panel/tab when first loading the <span class="apls-page">Search</span> page, with the &quot;What should the file look like?&quot; collapsible opened' %}
- **More consistent**: Previously, only participants could be loaded from file. Now, transcripts can be too.
- **Warning before clobbering**: It's possible to filter transcripts after filtering participants, but not vice versa. Previously, clicking the participant filter link would simply clear the transcript filter. Now, the user is provided a warning in case this is not what they intended.
  {% include compare-ui.html file="search/clobber-warning" caption='The warning that appears on the <span class="apls-page">Search</span> page when selecting a transcript filter then clicking _Filter Participants_' new_only="true" %}


### Search options

{% include compare-ui.html file="search/options" caption='The options panel/tab on the <span class="apls-page">Search</span> page' %}

- **More informative**
  - The _Exclude utterances with more than 5% overlap_ option doesn't appear to be working as of LaBB-CAT version 20250430.1502, so it has been removed
  - New sub-headings make it more obvious which options actually affect how search matches are identified vs. simply how they're displayed
  - Clearer wording
- **Bugfix**: Previously, if _No matches, only a summary of results_ was unchecked (the default), a new results tab would auto-open only for the first search you performed, but not subsequent searches. Now, this option works as intended, always auto-opening a results tab if unchecked (and never doing so if checked).


## <span class="apls-page">Search results</span> page

- Context selector: The <span class="apls-page">Search results</span> page displays each match on its own line, highlighted in yellow, with surrounding context. The amount of surrounding context can be controlled by the user.
  {% include compare-ui.html file="matches/context" caption='The first few matches on the <span class="apls-page">Search results</span> page (showing a search for `pitt` on the orthography layer), after clicking on the context selector' %}
  - **Don't clobber selected matches**: The <span class="apls-page">Search results</span> page includes a checkbox next to each match (all selected by default), allowing the user to export data for just a selection of matches. Previously, if you selected some checkboxes then changed the context, the checkboxes would revert to the default of selecting all. Now, the selection of specific checkboxes persists after changing context.
  - **More explicit**: The context can sometimes be shorter than expected depending on the match's position in the <span class="layer">utterance</span> (e.g., the 5th match [here](#matches-context) is at the end of the utterance, so there's no following context). The labels now more clearly indicate that the context is "up to" a certain number of words.
- **Improved layout**: All four export options now have collapsible menus for configuring the export. The _Prefix Names_ option applies to both _Utterance Export_ and _Audio Export_ since if users are exporting both, they likely want filenames to match. Now, the _Prefix names_ checkbox appears in both collapsible menus, and if you select it in one menu, it automatically gets selected in the other menu too.
  {% include compare-ui.html file="matches/exports" caption='The export options on the <span class="apls-page">Search results</span> page (showing a search for `pitt` on the orthography layer)' %}
- CSV export:
  {% include compare-ui.html file="matches/csv-export" caption='The _CSV Export_ menu on the <span class="apls-page">Search results</span> page (showing a search for `pitt` on the orthography layer)' %}
  - **Enforcing data best practices**: There are a handful of columns that should always be included in an exported CSV because they provide a "paper trail" that can help contextualize the exported data well into the future. But new users who don't know what (e.g.) _Match ID_ is for might think it's optional and regret losing the "paper trail" later. (This comes directly from Dan's experience!) Now, these columns are required (selected by default and can't be deselected).
  - **More consistent**: Where possible, checkboxes have been relabeled to match column names in the exported CSV.
  - **Improved layer picker**: See [above](#layer-picker-transcripts).


## <span class="apls-page">Transcripts</span> and <span class="apls-page">Participants</span> pages

The [<span class="apls-page">Transcripts</span>]({{ '/doc/browse-transcripts' | relative_url}}) and [<span class="apls-page">Participants</span>]({{ '/doc/browse-participants' | relative_url }}) pages not only display and filter [attributes]({{ '/doc/attribute-typology' | relative_url }}), they also act as jumping-off points to individual <span class="apls-page">Transcript</span> pages, the <span class="apls-page">Search</span> page, and one another (e.g., listing all of the transcripts for a selection of participants).

{% include compare-ui.html file="ps-and-ts/ps" title_suffix="Participants page" caption='The <span class="apls-page">Participants</span> page (first few entries) when first loaded, including the default participant filter' %}

{% include compare-ui.html file="ps-and-ts/ts" title_suffix="Transcripts page" caption='The <span class="apls-page">Transcripts</span> page (first few entries) when first loaded' %}

- **Reorganized/renamed action buttons** more clearly convey functionality. For example, both _Export Transcripts_ and _Export Format_ download transcripts, so _Export Transcripts_ becomes _Export Original_ and _Export Format_ becomes _Export Formatted_, and the buttons get moved next to each other.
- **Less confusing**: The {% include labbcat-icon.html src="delete.svg" %} button for clearing filters doesn't appear when there's no filter to clear (like on the <span class="apls-page">Transcripts</span> page when first loaded)
- _List Transcripts_ and _List Participants_ buttons: These buttons show how participants and transcripts fit together by loading the other page. For example, on the <span class="apls-page">Participants</span> page, selecting a filter then clicking _List Transcripts_ loads the <span class="apls-page">Transcript</span> page, with _transcript_ filters preset to include only the transcripts that contain at least one of the participants matched by the _participant_ filter. (In the old UI, this button was called just _Transcripts_.)
  {% include compare-ui.html file="ps-and-ts/list-ts" caption='The <span class="apls-page">Transcripts</span> page (first few entries) that loads after selecting the filters &quot;Neighborhood = CB, Gender = Male, Speaker type = Main speaker&quot; on the <span class="apls-page">Participants</span> page then clicking _Transcripts_ (old UI) or _List Transcripts_ (new UI)' %}
  - **New functionality**: Previously, there was no way to do the opposite of _List Transcripts_: find all of the participants in a selection of transcripts. Now, the <span class="apls-page">Transcripts</span> page has a _List Participants_ button too.
  - **New functionality**: Previously, if you were on the <span class="apls-page">Transcripts</span> page and wanted to stop filtering by participant, you'd have to click _transcripts_ in the top menu; reloading the page would just reload the participant filter, which could be frustrating. Now, the _Clear Participant Filter_ button removes the participant filter, leaving any transcript filters intact. (Ditto for _Clear Transcript Filter_ on the <span class="apls-page">Participants</span> page.)
  - **More informative**: Previously, the description of the source-page filter was hidden in a tooltip on the destination page. Now, this description is displayed alongside the number of matching participants/transcripts and (if any) destination-page filter(s).
  - **More helpful**: LaBB-CAT allows corpus maintainers to specify default participant/transcript filters, which are applied automatically when the participants/<span class="apls-page">Transcripts</span> page is loaded (which the user can then manually clear). In APLS, the default participant filter is '<span class="participant-attr">type</span> = Main speaker' so that the default <span class="apls-page">Participants</span> page view only includes interviewees. However, if you want to list participants for a given transcript, you probably want _all_ participants, so these buttons override any default filters on the destination page.
- **Cleaner UX for export configuration**: On the <span class="apls-page">Transcripts</span> page, the configuration panels for _Export Attributes_ and _Export Format(ted)_ now appear to the right of or below those buttons, followed by a button to close the panel
- **More consistent**: Previously, clicking on a transcript name would load its individual <span class="apls-page">Transcript</span> page, but participant names loaded their <span class="apls-page">Participant **attributes**</span> page. Now, the <span class="apls-page">Participants</span> page matches the <span class="apls-page">Transcripts</span> page by putting the link to the corresponding <span class="apls-page">Participant attributes</span> page in a button at the end of the row (with {% include labbcat-icon.html src="wrench.svg" %} for users who have permissions to edit attributes, {% include labbcat-icon.html src="csv.svg" %} otherwise).
  {% include compare-ui.html file="ps-and-ts/export-panel" caption='The <span class="apls-page">Transcripts</span> page after clicking _Export Format_ (old UI) or _Export Formatted_ (new UI)' %}
- **Improved layer picker**: See [above](#layer-picker-transcripts).
- **Bugfix**: Previously, if you created a filter, then cleared the filter, then filled in the _From_ box for a numeric range (e.g., entering `5` for _Birth year_ _From_), LaBB-CAT would interpret the value as a regex to match (e.g., only returning participants whose birth year _contains_ the character `5`). Now, the _From_ box behaves correctly.
  {% include compare-ui.html file="ps-and-ts/range-bug" caption='The <span class="apls-page">Participants</span> page after clearing a filter then entering `5` into the _Birth year_ _From_ box' %}


## Process with Praat page

- **Better guidance on file uploads**: Like [search filter file uploads](#search-load-from-file).
  {% include compare-ui.html file="praat/upload" caption='The Process with Praat page when first loaded' %}
- **Modern Praat script syntax**: The syntax for Praat's scripting language changed [way back in 2014](https://github.com/praat/praat/releases/tag/v5.4). While the old syntax is still supported, newcomers to Praat scripting are better served learning the modern syntax. As a result, the customizable Praat commands in LaBB-CAT now default to the modern syntax.
  {% include compare-ui.html file="praat/formants" caption='The _Formants_ menu on the Process with Praat page after uploading a file' %}
- **Better guidance on custom Praat scripts**: LaBB-CAT uses a somewhat estoric syntax for custom Praat scripts that can be run to generate measurements from tokens. The _Custom Praat script_ menu now better describes this syntax. This includes clarifying how the variables available to custom scripts relate to the parameters set at the top of the page.
  {% include compare-ui.html file="praat/script" caption='The top of the _Custom Praat script_ menu on the Process with Praat page after uploading a file' %}

## Miscellaneous

- **Message and error pop-ups**: LaBB-CAT occasionally sends alerts to the user, either because something has gone wrong or just as a "heads-up". Previously, these alerts would always appear above the page title, so you wouldn't see them if you'd scrolled further down the page. Now, these alerts always appear at the top of the window regardless of scroll, and they can be cleared early.
  {% include compare-ui.html file="message" title_suffix="heads-up messages" caption='The heads-up message that results when specifying the filter `xxx` on the <span class="apls-page">Transcripts</span> page' %}
  {% include compare-ui.html file="error" title_suffix="errors" caption='The error alert that results when uploading an invalid file to the participant filter on the <span class="apls-page">Search</span> page. In the old UI, the user has scrolled too far down the page to see the alert.' %}

{% include linklist.html %}
