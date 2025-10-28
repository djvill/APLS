---
title: Search filters and options
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/search-filters-and-options
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 20
last_modified_date: 2025-10-28T16:51:11-04:00
---

# {{ page.title }}
{:.no_toc}

The <span class="apls-page">Search</span> page by default will conduct searches on all data in APLS.
You can limit your search to a selection of [participants]({{ '/doc/data-organization#participants' | relative_url }}) and/or [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}) using the participants and transcripts filters.

You can also specify additional match and display options for your search using the [search options](#search-options).

{% include page_toc.html collapsible=true %}

<!-- TODO mention that if you want to filter by attributes not on the participants/transcripts pages, you should download the attributes csv, manually filter, and upload -->

## Filtering participants

The participants filter is located in the _Participants_ tab.
Here's what the _Participants_ tab looks like when you first load the <span class="apls-page">Search</span> page:

{% include screengrab.html src="search/participants.png" %}

There are two ways to filter participants: click the _Filter Participants_ button or upload a file with a list of participants.

{: .note .no-collapse}
> If you want to only include matches from the main participant in a transcript but don't care about other participant attributes, use the _Only include matches from the main participant in a transcript_ [search option](#search-options) instead.

### _Filter Participants_

Clicking _Filter Participants_ will take you to the [<span class="apls-page">Participants</span> page]({{ '/doc/browse-participants' | relative_url }}), with the <span class="keyterm">export menu</span> limited to just the _Layered Search_ button:

{% include screengrab.html src="participants/from-search.png" %}

{% comment %}TODO replace with links to browse-participants when that page is ready{% endcomment %}

{: .note}
> By default, when you load the <span class="apls-page">Participants</span> page, the <span class="participant-attr">type</span> filter is set to `Main speaker` (in other words, interviewees).
> If you want to [clear this filter]({{ '/doc/browse-transcripts#clearing-filters' | relative_url }}) (or any others), click the {% include labbcat-icon.html src="delete.svg" %} button to the right of the filters.

From the <span class="apls-page">Participants</span> page, specify which participants you would like to include in your search by either [specifying a filter]({{ '/doc/browse-transcripts#filtering-transcripts' | relative_url }}) or clicking checkboxes next to participants' names.
If you specify a filter for the <span class="apls-page">Participants</span> page and don't click any checkboxes, then it will select all participants matched by the filter (see [export menu selection rules]({{ '/doc/browse-transcripts#export-menu-selection-rules' | relative_url }})).
Once you've created a filter or selected participants, click _Layered Search_ to return to the <span class="apls-page">Search</span> page.
For example, here's what it looks like when you select the _Male_ box under `Gender` and the _Main speaker_ box under `Speaker type`, then click _Layered Search_:

{% include screengrab.html src="search/participant-filter.png" %}

As you can see, the _Participants_ tab looks a little different now:

- The tab label has been updated with the number of participants included in the filter (`(16)`).
- The _Filter Participants_ button has been replaced with _Modify Filter_ and _Clear Filter_.
- There's no longer an option to upload a participant list.
- The tab displays the filtered [attributes]({{ '/doc/attribute-typology' | relative_url }}) and values (`Gender = Male, Speaker type = Main speaker`) and the participants matched by the filter (`CB08`, `CB17`, etc.).

{: .note}
> In addition to these changes, the _Transcripts_ tab label has been updated to include `(*)`.
> This is a visual reminder that when **participants** are filtered, logically, not all **transcripts** will be searched (because each participant only appears in certain transcripts).
> Below, you can read about [filtering participants **and** transcripts at the same time](#filtering-participants-and-transcripts-at-the-same-time).

Clicking _Modify Filter_ will bring the <span class="apls-page">Participants</span> page back up so you can modify the filter you previously specified.
Clicking _Clear Filter_ will remove the participant filter and reset the _Participants_ tab.

If you select participants individually (by clicking their checkboxes on the <span class="apls-page">Participants</span> page) instead of specifying a filter, there's no _Modify_ button, only a _Clear Selections_ button.
Here's what it looks like if you select _CB01_ and _FH05_ on the <span class="apls-page">Participants</span> page and click _Layered Search_:

{% include screengrab.html src="search/participants-selected.png" %}

Finally, we've been discussing how to get to the <span class="apls-page">Participants</span> page from the <span class="apls-page">Search</span> page.
But since the _Layered Search_ button appears in the <span class="apls-page">Participants</span> page's <span class="keyterm">export menu</span> when you load the page normally, you can just start straight from there and achieve the same result.
More information about the <span class="apls-page">Participants</span> page can be found on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.


### Uploading a participant list

You can also upload a file containing participant codes to the participants filter by clicking the _Choose File_ button (or dragging-and-dropping a file onto the button).
You might want to do this if you want to filter participants by <span class="keyterm">attributes</span> that aren't listed on the <span class="apls-page">Participants</span> page (like <span class="participant-attr">occupation</span>).
Saving your participant list in a separate file can also aid the reproducibility

The participant list needs to have a specific file format.
You can find these requirements on the _Participants_ tab in the _What should the file look like?_ collapsible info-box:

> One of the following:
>
> - Plain text (.txt)
>   - One participant code per line
>   - Invalid participant codes ignored
> - Comma-separated values (.csv)
>   - Participant codes in the first column
>   - Invalid participant codes ignored
>   - Duplicate participant codes ignored
> - Tab-separated values (.tsv)
>   - Participant codes in the first column
>   - Invalid participant codes ignored
>   - Duplicate participant codes ignored

{: .try-it }
> 1. Go to the [<span class="apls-page">Participants</span> page](https://apls.pitt.edu/labbcat/participants).
> 1. Click the checkboxes for CB01, CB05, and CB06.
> 1. Click the _Export Attributes_ button twice to download the `participants.csv` file.
>    - You can learn more about the options of the <span class="apls-page">Export participant data</span> page on the [Browsing participants]({{ '/doc/browse-participants#exporting-and-searching-participants' | relative_url }}) documentation page.
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Open the _Participants_ tab, click _Choose File_, and select the `participants.csv` file.
>
> Here's what that should look like:
>
> {% include screengrab.html src="search/participants-uploaded.png" %}


## Filtering transcripts

The transcript filter is located in the _Transcripts_ tab.
Here's what the _Transcripts_ tab looks like when you first load the <span class="apls-page">Search</span> page:

{% include screengrab.html src="search/transcripts.png" %}

The transcript filter works just like the [participant filter](#filtering-participants), except that it loads the <span class="apls-page">Transcript</span> page instead of the <span class="apls-page">Participants</span> page.
For example, here's what it looks like when you click the _Filter Transcripts_ button, select _reading_ under `Transcript type` & _Cranberry Township_ under `Neighborhood`, and click _Layered Search_:

{% include screengrab.html src="search/transcript-filter.png" %}

{: .note}
> There's an important difference between the **participant** attribute <span class="participant-attr">neighborhood</span> and the **transcript** attribute <span class="transcript-attr">neighborhood</span>.
> Let's take Cranberry Township as an example.
> If you use the transcript filter `Neighborhood = Cranberry Township`, you'll get search matches from all `CB...eaf` transcripts, regardless of who's speaking.
> If you use the participant filter `Neighborhood = CB`, you'll only get search matches from `CB` participants.
> Since `CB` participants are only in `CB...eaf` transcripts (and the same is true for other neighborhoods), this means the participant filter will return fewer matches than the transcript filter.
> However, if you're [filtering participants **and** transcripts at the same time](#filtering-participants-and-transcripts-at-the-same-time), you can specify the neighborhood attribute for either and it shouldn't affect the search matches you get.


## Filtering participants and transcripts at the same time

You can specify both a participant filter and a transcript filter at the same time.
This is useful if, for example, you only want to search minimal pairs tasks from male participants who are main speakers.

To do this, start with a participant filter (either [using the _Filter Participants_ button](#filter-participants) or [uploading a participant list](#uploading-a-participant-list)).
Then on the _Transcripts_ tab, either click _Filter Transcripts_ or upload a transcript list.
If you click _Filter Transcripts_, the <span class="apls-page">Transcripts</span> page will only show the transcripts that contain the participants in the filter.
Here's what that looks like:

{% include screengrab.html src="transcripts/participant-filter-from-search.png" %}

{% comment %}TODO link to "Viewing transcripts that contain participants" on browse-participants once that's a thing{% endcomment %}

{: .note}
> If you click _Clear Participant Filter_, it will remove the participant filter from the search too.

Then you can specify a transcript filter or select transcript checkboxes, and click _Layered Search_ to return to the <span class="apls-page">Search</span> page.
Going from the previous image, here's what it looks like when you select _reading_ under `Transcript type`, then click _Layered Search_:

{% include screengrab.html src="search/both-filters.png" %}

Due to technical limitations, you have to select the participant filter first if you want to filter both participants and transcripts.
As a a result, selecting a participant filter after a transcript filter will overwrite the transcript filter.
If you try to do that, APLS will warn you and give you the option to back out:

{% include screengrab.html src="search/overwrite-filter.png" %}


## Search options

In the _Options_ tab are checkboxes that let you set certain match and display options for your search:

- _Only include matches from the main participant in a transcript._
  - This restricts the search to only include matches from 'Main speaker' participants, excluding matches from interviewers and bystanders.
- _Only match words that are aligned._
  - This checkbox restricts your search to only match tokens that have alignments on the <span class="layer">segment</span> layer, ignoring any tokens that have not been aligned yet.
  - If you're searching a [segment-dependent layer]({{ '/doc/layer-typology#segment-dependency' | relative_url }}), then this option is redundant, since the search results will only include aligned tokens anyway.
- _Only one match per transcript._
  - This checkbox restricts the search results to one match per transcript, allowing you to identify transcripts that contain a given pattern without listing all instances of that pattern in the transcript.
- _No matches, only a count of results._
  - This checkbox will prevent the <span class="apls-page">Search</span> page from automatically opening a new tab with the <span class="apls-page">Search results</span> page displaying the results (although results can still be viewed by clicking on _Display results_ underneath the progress bar once the search has completed).
