---
title: Extracting acoustic measurements
permalink: /doc/extract-acoustics
parent: How to use APLS
nav_order: 70
last_modified_date: 2025-04-27T19:42:02:z
---

# {{ page.title }}
{:.no_toc}

The [_extract_ page](https://apls.pitt.edu/labbcat/extract) lets you download a variety of data from APLS by uploading a [`.csv` file of results]({{ '/doc/export-data' | relative_url }}) from a [search]({{ '/doc/search' | relative_url }}).

{:.under-the-hood}
> You can technically use the _extract_ page with any `.csv` file containing either transcript file names and time intervals or MatchIDs/URLs.
> However, the easiest way to get this data for tokens of interest is to [export a `.csv`]({{ '/doc/export-data' | relative_url }}) after [conducting a search]({{ '/doc/search' | relative_url }}).

{% include page_toc.html collapsible=true %}

## What you can do on the _extract_ page

The _extract_ page allows you to use the time intervals of your search results to...
- Extract [audio files](#extract-audio-for-time-intervals)
- Extract [Praat TextGrids (or other transcript formats)](#extract-transcripts-for-time-intervals)
- Extract [transcript attributes, participant attributes, and layer annotations](#extract-annotations-for-time-intervals)
- Use a browser-based [Praat interface to conduct acoustic analyses](#process-with-praat)

The _extract_ page also allows you to extract transcript attributes, participant attributes, and layer annotations [using the MatchIDs or URLs](#extract-annotations-for-search-matches) of your search results.


### Layout

The initial _extract_ page is one of the more straightforward pages in ALPS.

![]({{ '/assets/screengrab/extract-acoustics/extract-layout.png' | relative_url }})

From the initial _extract_ page, you can selected if you would like to:
- [Extract audio for time intervals](#extract-audio-for-time-intervals)
- [Extract transcripts for time intervals](#extract-transcripts-for-time-intervals)
- [Extract annotations for search matches](#extract-annotations-for-search-matches)
- [Extract annotations for time intervals](#extract-annotations-for-time-intervals)
- [Process with Praat](#process-with-praat)


## Extract audio for time intervals

Clicking the link to _Extract audio for time intervals_ will bring you to a page where you can upload the search results `.csv` you would like to use for extracting data.

![]({{ '/assets/screengrab/extract-acoustics/extract-audio-for-time-intervals-1.png' | relative_url }})

After selecting your `.csv` with the _Choose File_ button, the button's text will change to the name of the file you selected.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

<!-- clicking upload without selecting a file will cause a javascript error -->

After you have selected your desired file, clicking the _Upload_ button will bring you to the settings page for _Extract audio for time intervals_.

<!-- Settings pages? Specifications page? Parameters page? What terminology would be best? -->

![]({{ '/assets/screengrab/extract-acoustics/extract-audio-for-time-intervals-2.png' | relative_url }})

On this page, the setting for the "Transcript Name column" should be set to the column in your `.csv` containing the file names of transcripts.
If your `.csv` has a column named _Transcript_, APLS will automatically select that column for this setting.

The settings for the "Start Time column" and "End Time column" should be set to the columns in your `.csv` that specify the time intervals of the audio you'd like to extract.
If your `.csv` has columns named _Line_ and _LineEnd_, APLS will automatically select those column for these settings.

{:.note}
> Other acceptable options for the Start Time column and End Time column settings include _Target word start_ and _Target word end_, as well as _Target segment start_ and _Target segment end_.

<!-- if any of the specified columns aren't what APLS is expecting, then APLS breaks and you get an HTTP 500 error page -->

The "Prefix column" setting allows you to optionally select a column from your `.csv` that will be appended to the beginning of the extracted audio files. 
If your `.csv` has a column named _Number_, APLS will automatically select that column for this setting.
If you do not want prefixed file names, click the drop-drop menu and select _[no prefix]_.

Next to the "Prefix column" setting is the accompanying "Zero-pad to _n_ digits" setting, which lets you specify the zero-padding for your prefixes.

<!-- there is no upper limit to the zero-padding numeric field, but if you set it to a number larger than 186 (i was curious to find out the limit) then the file never downloads 
it DOES NOT let you enter negative numbers though, which is good -->

<!-- after successfully extracting audio, clicking "extract audio" again will cause a javascript error -->

## Extract transcripts for time intervals



## Extract annotations for search matches



## Extract annotations for time intervals



## Process with Praat



