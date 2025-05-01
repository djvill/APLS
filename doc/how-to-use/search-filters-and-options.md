---
title: Search filters and options
permalink: /doc/search-filters-and-options
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 20
last_modified_date: 2025-05-01T16:35:09-04:00
---

# {{ page.title }}
{:.no_toc}

The _search_ page by default will conduct searches on all data in APLS.
You can limit your search to a selection of [participants]({{ '/doc/data-organization#participants' | relative_url }}) and/or [transcripts]({{ '/doc/data-organization#transcripts' | relative_url }}) using the participants and transcripts filters.

You can also specify additional match and display options for your search using the [search options](#search-options).

{% include page_toc.html collapsible=true %}

## Participants filter

The participants filter is the first option displayed on the _search_ page.

![]({{ '/assets/screengrab/search/search-participants-filter.png' | relative_url }})

There are two ways to select participants for this filter on the _search_ page:

- Clicking _Participants_ will take you to the [_participants_ page]({{ '/doc/browse-participants' | relative_url }}).
  From this page, click the checkboxes for all participants you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
  If you specify a filter for the _participants_ page and don't click any checkboxes, then it will select all participants in the filter.
  More information about the _participants_ page can be found on the [Browsing participants]({{ '/doc/browse-participants' | relative_url }}) documentation page.
- You can also upload a `.csv` file containing participant codes to the participants filter by clicking the _Choose File_ button.
  - For the `.csv` upload filter to work, participant codes must be in the first column of the `.csv`. 
    The filter will select all __valid__ participant codes in the first column.
    The column does not need to have a header name and the column can contain rows that aren't valid participant codes.
    Additionally, the `.csv` upload option treats multiple rows of the same participant code as if they were a single row.
    If there is an error in the column, it will be ignored (e.g., if the column contains `CB96` instead of `CB06`, the filter will simply ignore `CB96` because it is not a valid participant code).

{: .try-it }
> 1. Go to the [_participants_ page](https://apls.pitt.edu/labbcat/participants).
> 1. Click the checkboxes for CB01, CB05, and CB06.
> 1. Click the _Export Attributes_ button at the top of the page and then click _Export Attributes_ on the __Export participant data__ page to download the `participants.csv` file.
>    1. You can learn more about the options of the __Export participant data__ page on the [Browsing participants]({{ '/doc/browse-participants#exporting-and-searching-participants' | relative_url }}) documentation page.
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Click `Choose File` in the Participants filter tab and select the `participants.csv` file.

## Transcripts filter

The transcripts filter is located beneath the participants filter.

![]({{ '/assets/screengrab/search/search-transcripts-filter.png' | relative_url }})

Clicking _Transcripts_ will take you to the [_transcripts_ page]({{ '/doc/browse-transcripts' | relative_url }}).
From this page, click the checkboxes for all transcripts you would like to include in your search and then click the _Layered Search_ button to return to the _search_ page.
More information about the _transcripts_ page can be found on the [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}) documentation page.

<!-- you can now upload transcript files for the filter as well -->

{:.note}
> If you've selected participants for the participants filter, only the transcripts for those participants will be displayed when using the transcripts filter.
> Additionally, if you select transcripts *and then* select participants, your transcripts filter will be overwritten.

<!-- the apls-dev page gives you a warning if you try to do this -->

## Search options

<!--  apls-dev has been changed so that the "Exclude utterances with more than n% overlap" option has been removed -->

Below the pattern input fields are checkboxes that let you set certain match parameters for your search.
In order, these options are:
- Only include 'Main speaker' participants.
    - This restricts the search to only include matches from 'Main speaker' participants, excluding matches from interviewers and bystanders.
- Only match words that are aligned.
  - This checkbox restricts your search to only match tokens that have been force-aligned, ignoring any tokens that have not been force-aligned yet.
- Only one match per transcript.
  - This checkbox restricts the search results to one match per transcript, allowing you to identify transcripts that contain a given pattern without listing all instances of that pattern in the transcript.
- Exclude utterances with more than n% overlap
  - This checkbox allows you to excluding overlapping speech, when multiple speakers are talking at once.
  - By default, 5% overlap counts as simultaneous speech for exclusion. However this threshold can be adjusted using the given checkbox.
- No matches, only a summary of results
  - This checkbox will prevent the search from automatically opening a page displaying the results (although results can still be viewed by clicking on `Display results` underneath the search bar)
