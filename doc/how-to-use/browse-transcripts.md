---
title: Browsing transcripts
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/browse-transcripts
parent: How to use APLS
nav_order: 30
last_modified_date: 2025-10-22T17:06:56-04:00
---

# {{ page.title }} {#page-title}
{:.no_toc}

The primary way to browse transcripts in APLS is via the <span class="apls-page">Transcripts</span> page: <https://apls.pitt.edu/labbcat/transcripts>. 

The <span class="apls-page">Transcripts</span> page not only lists all the transcripts in APLS and their <span class="keyterm">attributes</span> (metadata), but it also offers useful tools for filtering and exporting transcripts.
On this documentation page, we cover the functionality and layout of the <span class="apls-page">Transcripts</span> page.

{% include page_toc.html collapsible=true %}

## What you can do on the <span class="apls-page">Transcripts</span> page

The <span class="apls-page">Transcripts</span> page allows you to...
- [Browse transcripts](#browsing-transcripts) available in APLS
- [View transcript attributes](#viewing-transcript-attributes)
- [Export transcript attributes](#exporting-transcript-attributes) to CSV files
- [Filter transcripts](#filtering-transcripts) according to their attributes
- [Export transcripts](#exporting-transcripts-and-audio-files) in a variety of formats
- [Export transcript audio files](#exporting-transcripts-and-audio-files)
- [View participants](#viewing-participants-in-a-transcript) for selected transcripts
- [Search transcripts](#searching-transcripts) with the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }})

### Page layout

The following image shows the top of the <span class="apls-page">Transcripts</span> page when you first load it:

{% include screengrab.html src="transcripts/overview.png" %}

- The <span class="keyterm">transcript list</span> (highlighted in **red**{:.hl-1} above) continues all the way down the page. This is where you can...
  - [Browse transcripts](#browsing-transcripts) available in APLS
  - [View transcript attributes](#viewing-transcript-attributes)
- The <span class="keyterm">filters</span> (highlighted in **blue**{:.hl-2} above). This is where you can...
  - [Filter transcripts](#filtering-transcripts) according to their attributes
- The <span class="keyterm">export menu</span> (highlighted in **green**{:.hl-3} above). The buttons each have their own function:
  - _Export Media_: [Export transcript audio files](#exporting-transcripts-and-audio-files)
  - _Export Original_ and _Export Formatted_: [Export transcripts](#exporting-transcripts-and-audio-files) in a variety of formats
  - _Export Attributes_: [Export transcript attributes](#exporting-transcript-attributes) to CSV files
  - _List Participants_: [View participants](#viewing-participants-in-a-transcript) for selected transcripts
  - _Layered Search_: [Search transcripts](#searching-transcripts) with the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }})


#### Export menu selection rules
{: .no_toc}

Each of the actions in the export menu (highlighted in **green**{:.hl-3} above) applies to whichever transcripts you've selected:

1. **No [filters](#filtering-transcripts) selected, no checkboxes selected**: The action will apply to all {{ num_transcripts }} transcripts in APLS.
1. **At least one filter selected, no checkboxes selected**: The action will apply to all transcripts matched by the filter.
1. **At least one checkbox selected**: The action will apply to all checked transcripts.
   - You can select a range of checkboxes by clicking the first one you want to include, holding the `Shift` key, and clicking the last one you want to include.

For example, if you want to [export audio files](#exporting-transcripts-and-audio-files) for all reading-passage transcripts from Cranberry Township, you can click _reading_ under `Transcript type` and _Cranberry Township_ under `Neighborhood`, then _Export Media_.


#### Expandable elements
{: .no_toc}

Several elements on the page have ▼ symbols (multi-select [filters](#filtering-transcripts) and the [_Export Attributes_ menu](#exporting-transcript-attributes)).
For these elements, you can hover over them to view more options to select:

{% include screengrab.html src="transcripts/expandable.png" %}{:style="max-width: 500px;"}

## Browsing transcripts

When you first load the <span class="apls-page">Transcripts</span> page, the <span class="keyterm">transcript list</span> displays all the transcripts in APLS (broken up into several pages):

{% include screengrab.html src="transcripts/list.png" %}

Clicking on a transcript name will load the corresponding [<span class="apls-page">Transcript</span> page]({{ '/doc/view-transcript' | relative_url }}).

{: .try-it }
> Go to the [<span class="apls-page">Transcripts</span> page](https://apls.pitt.edu/labbcat/transcripts) and click *CB05pairs.eaf* to view that transcript's <span class="apls-page">Transcript</span> page.


## Viewing transcript attributes

In the <span class="keyterm">transcript list</span>, to the right of the transcript names are three columns.
These each correspond to a <span class="keyterm">transcript attribute</span>:

- `Transcript type` (<span class="transcript-attr">type</span>): Sociolinguistic interview section
- `Neighborhood` (<span class="transcript-attr">neighborhood</span>): Which Pittsburgh neighborhood the main participant was recruited from
- `Duration (sec)` (<span class="transcript-attr">duration</span>): Duration in seconds

For example, in the following image, `CB01reading1.eaf` has a <span class="transcript-attr">duration</span> of `41.866` seconds:

{% include screengrab.html src="transcripts/attributes.png" %}

You can read more about how attributes work on the [attribute typology]({{ '/doc/attribute-typology' | relative_url }}) documentation page and the transcript attributes [field guide]({{ '/doc/transcript-attributes' | relative_url }}).

### <span class="apls-page">Transcript attributes</span> pages

{% assign not_on_page = site.attributes | where_exp: "item", "item.synced.attrib_type == 'transcript'" | where_exp: "item", "item.synced.filterable == false" %}

To save space, the <span class="apls-page">Transcripts</span> page omits several attributes: {% for attr in not_on_page %}<span class="transcript-attr">{{attr.synced.attribute}}</span>{% if forloop.rindex > 2 %}, {% elsif forloop.rindex == 2 %}, and {% endif %}{% endfor %}.
To view all attributes for a transcript, click {% include labbcat-icon.html src="csv.svg" %} on the right-hand side to open its <span class="apls-page">Transcript attributes</span> page.
For example, here's the <span class="apls-page">Transcript attributes</span> page for `CB01reading1.eaf`:

{% include screengrab.html src="transcript/attributes/overview.png" %}

{: .try-it }
> 1. Go to the <span class="apls-page">Transcripts</span> page: <https://apls.pitt.edu/labbcat/transcripts>.
> 1. Click the {% include labbcat-icon.html src="csv.svg" %} icon for `CB01reading1.eaf` to view that transcript's <span class="apls-page">Transcript attributes</span> page.

{: .note }
> This page is useful for **viewing** attributes for individual transcripts.
> If you want to treat transcript attributes as **data**, use the [_Export Attributes_ button](#exporting-transcript-attributes) instead.

This page looks exactly like the [_Attributes_ tab]({{ '/doc/view-transcript#viewing-transcript-attributes' | relative_url }}) on the <span class="apls-page">Transcript</span> page.
The left-hand column shows attributes' display titles (like `Recording date`) and names (like `recording_date`).
The right-hand column shows attributes' values (e.g., `June 15, 2004`).
You can hover over an attribute name to bring up a tooltip with its description:

{% include screengrab.html src="transcript/attributes/tooltip.png" %}

Blanks in the right-hand column mean that this transcript doesn't have any value for that attribute.
As you can see, for example, `Transcription AI tool(s)` has a blank for `CB01reading1.eaf` (meaning its <span class="transcript-attr">transcription_ai_tools</span> attribute is empty).
This is because no AI tools were used to transcribe `CB01reading1.eaf`.

The two checkboxes at the bottom of this tab control how the left-hand column is displayed.
If you want to see attributes' full [export names]({{ '/doc/attribute-typology#export-name' | relative_url }}), select _Show attribute prefixes_:

{% include screengrab.html src="transcript/attributes/prefixes.png" %}

If you're finding the attribute names visually distracting, deselect _Show attribute names_:

{% include screengrab.html src="transcript/attributes/hide-names.png" %}

APLS remembers these settings if you navigate to other <span class="apls-page">Transcript</span> or <span class="apls-page">Transcript attributes</span> pages in the same browser tab.

Just like the <span class="apls-page">Transcript</span> page, the <span class="apls-page">Transcript attributes</span> page has <span class="keyterm">navigation arrows</span> that allow you to move to the previous or next transcript in the interview.
These arrows are hidden if you are looking at the first or last transcript in the interview.


## Exporting transcript attributes

The *Export Attributes* button allows you to download <span class="keyterm">transcript attributes</span> as a `.csv` file.
Clicking the *Export Attributes* button will bring up a multi-select menu.
You can hover over the menu to expand it:

{% include screengrab.html src="transcripts/export-attributes-expanded.png" %}

After selecting the attributes you would like to export (see [export menu selection rules](#export-menu-selection-rules)), click the *Export Attributes* button again to download the `.csv` file.
For example, here's what it looks like when you select <span class="transcript-attr">transcript</span>, <span class="transcript-attr">episode</span>, and <span class="transcript-attr">recording_date</span>:

{% include screengrab.html src="transcripts/export-attributes-csv.png" %}

As you can see, the `.csv` file has one row per transcript (plus the header row) and one column per attribute.
The header row has attributes' [export names]({{ '/doc/attribute-typology#export-name' | relative_url }}), so <span class="transcript-attr">recording_date</span> is `transcript_recording_date`.

{: .note }
> Your computer probably opens `.csv` files by default in a spreadsheet program like Microsoft Excel or Apple Numbers.
> These programs sometimes format data for display, which makes it look different than how the data is actually stored in APLS.
> For example, the image above (from Excel) displays `CB01interview1.eaf`'s <span class="transcript-attr">recording_date</span> as `15-Jun-04`, but it's actually `June 15, 2004`.
> To view attribute data as they're actually stored, open the exported `.csv` file in a text editor like Notepad or TextEdit.
> This will display the file as raw text data:
>
> {% include screengrab.html src="transcripts/export-attributes-csv-raw.png" %}

If you haven't selected any [filters](#filtering-transcripts), the `.csv` file will include all {{ num_transcripts }} transcripts in APLS.
If you have selected filters, the `.csv` file will include all filtered transcripts.
You can also select individual transcripts to include in the `.csv` file by clicking the checkboxes next to those transcripts;
you can select a range of checkboxes by clicking the first one you want to include, holding the `Shift` key, and clicking the last one you want to include.

Descriptions of the different transcript attributes can be found in the [field guide]({{ '/doc/transcript-attributes' | relative_url }}).


## Filtering transcripts

{% for version in site.versions reversed %}
  {% if version.stats.transcripts %}
    {% assign num_transcripts = version.stats.transcripts %}
    {% break %}
  {% endif %}
{% endfor %}

The <span class="keyterm">filters</span> at the top of the <span class="apls-page">Transcripts</span> page let you find transcripts that match selected <span class="keyterm">transcript attributes</span>.
You can then use this filtered list of transcripts to [export attributes](#exporting-transcript-attributes), [export transcripts or audio files](#exporting-transcripts-and-audio-files), [view participants](#viewing-participants-in-a-transcript), or [search transcripts](#searching-transcripts).

When you first load the <span class="apls-page">Transcripts</span> page, no filters are applied, so all {{ num_transcripts }} transcripts in APLS are displayed:

{% include screengrab.html src="transcripts/filters-none.png" %}

As you can see, the page displays `Match count: {{ num_transcripts }}` above the filters.
This count will decrease as you specify more filters.

{% assign dur = site.attributes | where_exp: "item", "item.synced.attribute == 'duration'" | first %}

Each filter corresponds to a transcript attribute, listed by its [display title]({{ '/doc/attribute-typology#display-title' }}) (such as `Duration (sec)`).
You can hover over the filter to see the attribute's [export name]({{ '/doc/attribute-typology#export-name' }}) (`transcript_duration`) and description (`{{ dur.synced.short_description }}`):

{% include screengrab.html src="transcripts/filters-tooltip.png" %}

To filter by an attribute, select at least one checkbox (for `Transcript type` and `Neighborhood`) or enter text into a textbox (for `Transcript name` and `Duration (sec)`).
For example, if you want to see all transcripts with <span class="transcript-attr">type</span> "interview", you can select the _interview_ checkbox under `Transcript type`:

{% include screengrab.html src="transcripts/filters-interview.png" %}

As you can see, the top line shows that `Match count` is down to 178 transcripts and describes the filter: `Transcript type = interview`.
The transcript list no longer displays transcripts like `CB01pairs.eaf` that have a <span class="transcript-attr">type</span> other than "interview".
In addition, the {% include labbcat-icon.html src="delete.svg" %} button appears to the right of the filters;
this button [clears filters](#clearing-filters) from all attributes.

To select a different <span class="transcript-attr">type</span> instead, hover over the `Transcript type` box to expand the list of <span class="transcript-attr">type</span> options.
The same goes for the other multi-select filter, `Neighborhood`:

{% include screengrab.html src="transcripts/filters-expand.png" %}

For multi-select filters, you can choose multiple options.
For example, you can select _interview_ and _reading_ to include these two <span class="transcript-attr">type</span>s and exclude others:

{% include screengrab.html src="transcripts/filters-multi-select.png" %}

As you can see, the `Match count` has now increased to 228, the filter is now described as `Transcript type in (interview,reading)`, and the transcript list displays "reading" interviews again.

You can also filter by multiple attributes at the same time.
For example, to narrow down the list of "interview" and "reading" transcripts to only include those that are at most 15 minutes long, you can type `900` (that is, 15&times;60) into the _To_ box under `Duration (sec)`:

{% include screengrab.html src="transcripts/filters-multiple.png" %}

{: .under-the-hood}
> When you specify a filter, the URL changes to match it.
> For example, the filter in the previous image has the URL <https://apls.pitt.edu/labbcat/transcripts?transcript_type=interview,reading&transcript_duration=,900>:
>
> {% include screengrab.html src="transcripts/filters-url.png" %}
>
> You can use this URL as a permalink to access the same filtered transcript list again in the future.

Finally, if you navigate to a different APLS page and then back to the <span class="apls-page">Transcripts</span> page in the same browser tab, APLS will reload the last filter you set.
If you want to reset the <span class="apls-page">Transcripts</span> page to its default unfiltered view, you can use the {% include labbcat-icon.html src="delete.svg" %} button to [clear all filters](#clearing-filters).


### Filters in brief

{: .note .no-collapse }
> This section is a cliffs-notes version of the previous section.
> If you need a walkthrough of how filters work, read the previous section instead.

The four filters correspond to the columns in the transcript list below the export menu:
- The `Transcript name` box filters transcripts by name and supports [regular expressions]({{ '/doc/regex' | relative_url }}).
- The `Transcript type` multi-select menu filters transcripts by their <span class="transcript-attr">type</span> of content.

  {: .try-it }
  > Because transcript type is determined by the content of the transcript, it makes it easy for researchers to filter for certain types of speech.
  > To view all transcripts with higher attention to speech, go to the [<span class="apls-page">Transcripts</span> page](https://apls.pitt.edu/labbcat/transcripts) and select *reading* and *pairs* from the Transcript type drop-down list.
- The `Neighborhood` multi-select menu filters transcripts according to the Pittsburgh <span class="transcript-attr">neighborhood</span> where the participant was [recruited from]({{ '/doc/pittsburgh-interviews' | relative_url }}).
- The `Duration (sec)` boxes filter transcripts by their <span class="transcript-attr">duration</span> in seconds. 
  - To view transcripts that are...
    -  _at least_ `X` seconds long: enter `X` in the *From* box (leave *To* blank)
    - _at most_ `Y` seconds long: enter `Y` in the *To* box (leave *From* blank)
    - _between_ `X` and `Y` seconds long (inclusive): enter `X` in the *From* box and `Y` in the *To* box

  {: .try-it }
  > Go to the [<span class="apls-page">Transcripts</span> page](https://apls.pitt.edu/labbcat/transcripts) and enter `50` into the *From* box and leave the *To* box blank.
  > This will show all transcripts that are at least 50 seconds in <span class="transcript-attr">duration</span>.
  >
  > In the same way, you can leave the *From* box blank and enter `300` in the *To* box to show all transcripts that are 300 seconds or less in <span class="transcript-attr">duration</span>.

### Clearing filters

To stop filtering by a **single** attribute, deselect all its checkboxes or clear its text box(es).
This will make the filter inactive, just like it was when the page was first loaded.

To stop filtering by **all** attributes, click {% include labbcat-icon.html src="delete.svg" %} to the right of the filters.


### Filters that don't match any transcripts

It is possible to specify a filter that doesn't match any transcripts in APLS.
For example, there aren't any APLS transcripts that are 2+ hours in duration, so typing `7200` into the _From_ box under `Duration (sec)` will match 0 transcripts.
The <span class="apls-page">Transcripts</span> page will also display the message `There are no matching IDs.`:

{% include screengrab.html src="transcripts/filters-no-matching.png" %}


### Filtering by attributes not on the <span class="apls-page">Transcripts</span> page

As mentioned [above](#transcript-attributes-pages), the <span class="apls-page">Transcripts</span> page omits several attributes to save space: {% for attr in not_on_page %}<span class="transcript-attr">{{attr.synced.attribute}}</span>{% if forloop.rindex > 2 %}, {% elsif forloop.rindex == 2 %}, and {% endif %}{% endfor %}.
To include these attributes in your filter, do the following:

1. Export attributes for all transcripts to a `.csv` file using _Export Attributes_ (see [above](#exporting-transcript-attributes)).
1. Filter the `.csv` file using your favorite tool for managing spreadsheets (e.g., Excel, R).
1. Then, if you want to...
   - ... **view transcript attributes**: Browse the filtered spreadsheet.
   - ... **export transcripts or audio** or **view participants**:
     1. Generate a regular expression that describes all filtered transcripts:
        - In Excel: Use the following formula in any cell **not** in column A: `=TEXTJOIN("|",TRUE,A:A)`.
        - In R: If your data frame is named `df`, use the following: `paste(df$transcript, collapse="|")`.
     1. Paste it into the _Regular Expression_ box under `Transcript name`.
     1. Then you can use _Export Media_, _Export Original_, _Export Formatted_, or _List Participants_ like you normally would.
   - ... **search transcripts**: Upload the filtered `.csv` to the [_Transcripts_ tab]({{ '/doc/search-filters-and-options' | relative_url }}) on the <span class="apls-page">Search</span> page.

{% comment %}
<!-- This doesn't currently work in APLS (as of 0.3.1) because the logic for List Transcripts works differently from the Participants page (e.g., female-participants includes CB08, who's male). I'm commenting this section out till I can get it working. -->

### Filtering by participant attributes

So far, we've only discussed filtering by **transcript** attributes.
But to answer a question like "which transcripts have a female main speaker?", we need to filter by **participant** attributes.

To filter by participant attributes, we need to start on the <span class="apls-page">Participants</span> page.
There, you can select filters and click _List Transcripts_.
For example, here's what the <span class="apls-page">Participants</span> page looks like when we select _Female_ under `Gender` and _Main speaker_ under `Speaker type`:

{% include screengrab.html src="participants/female.png" %}

And then here's what it looks like when you click _List Transcripts_:

{% include screengrab.html src="transcripts/participant-filter.png" %}
<!-- Again, this isn't what we would expect here. It includes all of CB08's transcripts because Barbara Johnstone is female. -->

If you want to filter by participant **and** transcript attributes, follow the steps above, then select transcript filter(s).
For example, you can get a list of all "interview"-<span class="transcript-attr">type</span> transcripts with female main speakers:

{% include screengrab.html src="transcripts/participant-filter-interview.png" %}

If you want to undo the participant filter, click _Clear Participant Filter_.
This will leave in place any transcript filter(s).
Here’s what it looks like if you click _Clear Participant Filter_ based on the previous image:

{% include screengrab.html src="transcripts/filters-interview.png" %}

{: .note}
> There is a similar _List Participants_ button on the <span class="apls-page">Transcripts</span> page, which is useful for [viewing participants in a transcript](#viewing-participants-in-a-transcript).

{% endcomment %}

## Exporting transcripts and audio files

Three buttons in the <span class="keyterm">export menu</span> allow you to export transcript data in a variety of formats: _Export Media_, _Export Original_, and _Export Formatted_.

As a reminder, these buttons use the [export menu selection rules](#export-menu-selection-rules).


### *Export Media* and *Export Original*

The most straightforward export options are *Export Media* and *Export Original*.

- *Export Media* will download the audio for the selected transcripts as `.wav` files (packaged in a `.zip` file if more than one transcript is selected).
- *Export Original* will download the [original ELAN transcripts]({{ '/doc/transcription' | relative_url }}) for the selected transcripts as `.eaf` files (packaged in a `.zip` file if more than one transcript is selected).


### *Export Formatted*

The *Export Formatted* option allows you to download <span class="keyterm">attribute</span> and <span class="keyterm">layer</span> data from transcripts in a variety of file types.
Clicking on _Export Formatted_ once brings up options;
clicking on _Export Formatted_ again exports the file.
Here's what the options look like:

{% include screengrab.html src="transcripts/export-formatted.png" %}

Let's break down what we're looking at:

- The <span class="keyterm">layer picker</span> (highlighted in **red**{:.hl-1}) controls which attributes and layers are included in the exported transcript.
- The <span class="keyterm">format picker</span> (highlighted in **blue**{:.hl-2}) controls the file format for the exported transcript.
(There are also layer pickers on the <span class="apls-page">Transcript</span>, <span class="apls-page">Search</span>, and <span class="apls-page">Search results</span> pages, all slightly different in appearance.)

{: .note}
> The attribute [typology]({{ '/doc/attribute-typology' | relative_url }}) and field guides provide descriptions of [transcript attributes]({{ '/doc/transcript-attributes' | relative_url }}) and [participant attributes]({{ '/doc/participant-attributes' | relative_url }}).
> The [layer field guide]({{ '/doc/layer-field-guide' | relative_url }}) documentation page provides descriptions of all <span class="keyterm">layers</span> in APLS.

This layer picker works similarly to the [one on the <span class="apls-page">Transcript</span> page]({{ '/doc/view-transcript#selecting-layers-to-display' | relative_url }}), with a few differences:

- Attributes can be selected in addition to layers
- Unlike the <span class="apls-page">Transcript</span> page, <span class="layer">turn</span> and <span class="layer">utterance</span> can be selected, and <span class="layer">word</span> can be **de**selected
- There are no projects, so all attributes and layers are displayed
- The attributes and layers don't change color when selected
- There are no annotation counts or IPA/DISC toggles
- There's a _Show attribute prefixes_ checkbox (similar to [<span class="apls-page">Transcript attributes</span> pages](#transcript-attributes-pages))
- The _Show layer icons_ checkbox is deselected by default to save space


The following formatted file types are available with *Export Formatted*:
- CLAN CHAT transcript (`.cha`)
- Comma Separated Values (`.csv`)
- ELAN EAF Transcript (`.eaf`)
- EMU-SDMS Bundle (`.json`)
- LaTeX Document (`.tex`)
- Praat TextGrid (`.TextGrid`)
- PDF Document (`.pdf`)
- Plain Text Document (`.txt`)
- SALT transcript (`.slt`)
- Transcriber transcript (`.trs`)
- WebVTT subtitles (`.vtt`)

For more information about what exported transcripts look like and how layers are represented in different file formats, see the ["Viewing a transcript" documentation page]({{ '/doc/view-transcript#exporting-the-transcript' | relative_url }}).

After selecting your desired <span class="keyterm">layers</span> and file format type, click the *Export Formatted* button again to export the transcripts.
If more than one transcript is selected, the exported files will be packaged in a single `.zip` file.


#### Layer picker icons
{: .no_toc }

If _Show layer icons_ is selected, each layer will have either two or three icons to the right of its checkbox in the layer picker.
These icons indicate some of the layer's important properties.
Here's a quick key;
see the [layer typology]({{ '/doc/layer-typology' | relative_url }}) documentation page for more information:

<!-- TODO turn this into an includes so it can be reused on other pages -->
<table class="icon-table">
  <thead>
    <tr>
      <th colspan="2"><a href="{{ '/doc/layer-typology#data-type' | relative_url }}">Data type</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#alignment-and-horizontal-peers' | relative_url }}">Alignment</a></th>
      <th colspan="2"><a href="{{ '/doc/layer-typology#vertical-peers' | relative_url }}">Vertical peers</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-phonological.svg" %}</td>
      <td>Phonological</td>
      <td>{% include labbcat-icon.html src="alignment-0.svg" %}</td>
      <td>Complete interval</td>
      <td>{% include labbcat-icon.html src="vertical-peers.svg" %}</td>
      <td>Allows vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-numeric.svg" %}</td>
      <td>Numeric</td>
      <td>{% include labbcat-icon.html src="alignment-2.svg" %}</td>
      <td>Sub-interval</td>
      <td>(none)</td>
      <td>Doesn't allow vertical peers</td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-text.svg" %}</td>
      <td>Text</td>
      <td rowspan="2" colspan="4"></td>
    </tr>
    <tr>
      <td>{% include labbcat-icon.html src="data-type-timing-only.svg" %}</td>
      <td>Timing-only</td>
    </tr>
  </tbody>
</table>

This means that, for example, the <span class="layer">segment</span> layer has phonological data type, complete-interval alignment, and no vertical peers: ![]({{ '/assets/screengrab/transcripts/layer-picker-segment-icons.png' | relative_url }}){:style="height:1.5em; border:.1em solid black;"}.

{: .under-the-hood}
> The _about_ link points to the page section you're reading right now!


## Viewing participants in a transcript

To view all participants in a single transcript, select its checkbox, then click _List Participants_.
This will open the [<span class="apls-page">Participants</span> page]({{ '/doc/browse-participants' | relative_url }}) with a transcript filter pre-loaded.
For example, to view all participants in `CB08interview2.eaf`, select its checkbox then click _List Participants_.
Here's the result:

{% include screengrab.html src="participants/cb08-2.png" %}

You can also view participants for multiple transcripts (see [export menu selection rules](#export-menu-selection-rules)).
For example, to view all participants in transcripts that lasted at least half an hour, type `1800` into the _From_ box under `Duration (sec)`, then click _List Participants_.
Here's the result:

{% include screengrab.html src="participants/1800sec.png" %}

As you can see from these images, _List Participants_ includes all three participant <span class="participant-attr">type</span>s: `Main speaker`s, `Interviewer`s, and `Bystander`s.
The default for the <span class="apls-page">Participants</span> page is to only show `Main speaker`s, but _List Participants_ overrides this default filter.
<!-- Move the following to browse-participants#filtering-by-transcript-attributes? If so, mention above that this is basically filtering by transcript attributes, and link to there. -->
However, once you click _List Participants_, you can select participant filters to further narrow down the participant list.
This is useful if you want to filter participants by both transcript and participant attributes.
For example, you can get a list of all female main-speaker participants in transcripts that lasted at least half an hour:

{% include screengrab.html src="participants/1800sec-filtered.png" %}

If you want to undo the transcript filter, click _Clear Transcript Filter_.
This will leave in place any participant filter(s).
Here's what it looks like if you click _Clear Transcript Filter_ based on the previous image:

{% include screengrab.html src="participants/female.png" %}

{% comment %}
<!-- See the commented-out section "Filtering transcripts by participant attributes" above. -->

{: .note .no-collapse}
> If you want to filter **transcripts** by **participant** attributes, there is a similar _List Transcripts_ button on the <span class="apls-page">Participants</span> page.

{% endcomment %}


## Searching transcripts

The *Layered Search* button opens the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}) with the selected transcripts filled into the *Transcripts* tab.
(Keep in mind the [export menu selection rules](#export-menu-selection-rules).)
For example, here's what it looks like when you click _reading_ under `Transcript type` and _Cranberry Township_ under `Neighborhood`, then _Layered Search_:

{% include screengrab.html src="search/transcript-filter.png" %}

{: .try-it }
> Let's find all tokens of the word _steel_ in the CB01 transcripts
> 1. Go to the [<span class="apls-page">Transcripts</span> page](https://apls.pitt.edu/labbcat/transcripts).
> 1. Type `CB01` into the box under `Transcript name`. This will select all CB01 transcripts.
> 1. Click *Layered Search* to open the [<span class="apls-page">Search</span> page]({{ '/doc/search' | relative_url }}).
> 1. Enter `steel` into the [Regular expression]({{ '/doc/regex' | relative_url }}) box in the orthography section and click *Search*.
> 1. Click *Display results* to view all utterances of the word `steel` in the CB01 transcripts.

{: .note}
> You can achieve the same result by starting on the <span class="apls-page">Search</span> page and selecting _Filter Transcripts_ on the [_Transcripts_ tab]({{ '/doc/search-filters-and-options' | relative_url }}).

{% include linklist.html %}
