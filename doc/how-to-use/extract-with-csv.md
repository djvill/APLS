---
title: Extracting additional data with a results .csv
permalink: /doc/extract-with-csv
parent: Exporting data
grand_parent: How to use APLS
nav_order: 10
last_modified_date: 2025-04-29T14:27:29:z
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
- Use a browser-based [Praat interface to conduct acoustic analyses]({{ '/doc/extract-acoustics' | relative_url }})

The _extract_ page also allows you to extract transcript attributes, participant attributes, and layer annotations [using the MatchIDs or URLs](#extract-annotations-for-search-matches) of your search results.


### Layout

The initial _extract_ page is one of the more straightforward pages in ALPS.

![]({{ '/assets/screengrab/extract-with-csv/extract-layout.png' | relative_url }})

From the initial _extract_ page, you can selected if you would like to:
- [Extract audio for time intervals](#extract-audio-for-time-intervals)
- [Extract transcripts for time intervals](#extract-transcripts-for-time-intervals)
- [Extract annotations for search matches](#extract-annotations-for-search-matches)
- [Extract annotations for time intervals](#extract-annotations-for-time-intervals)
- [Process with Praat]({{ '/doc/extract-acoustics' | relative_url }})


## Extract audio for time intervals

Clicking the link to _Extract audio for time intervals_ will bring you to a page where you can upload the search results `.csv` you would like to use for extracting data.

![]({{ '/assets/screengrab/extract-with-csv/extract-audio-for-time-intervals-1.png' | relative_url }})

After selecting your `.csv` with the _Choose File_ button, the button's text will change to the name of the file you selected.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

<!-- clicking upload without selecting a file will cause a javascript error -->
<!-- if you upload a file that ISNT a csv, APLS will coerce it into being a csv but the resulting options will make no sense -->

After you have selected your desired file, clicking the _Upload_ button will bring you to the settings page for _Extract audio for time intervals_.

<!-- don't call it a page, just say that the settings appear -->

![]({{ '/assets/screengrab/extract-with-csv/extract-audio-for-time-intervals-2.png' | relative_url }})

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

After specifying your desired settings, clicking the _Export_ button will download the extracted audio files in a `.zip` folder.

<!-- after successfully extracting audio, clicking "extract audio" again will cause a javascript error
maybe it'd make sense to have it go to the previous "upload" page after? or a "Done." message similar to  Extract transcripts for time intervals-->

## Extract transcripts for time intervals

<!-- most of the errors mentioned in the previous section also apply to this feature -->

Clicking the link to _Extract transcripts for time intervals_ will bring you to a page where you can upload the search results `.csv` you would like to use for extracting data.

![]({{ '/assets/screengrab/extract-with-csv/extract-transcripts-for-time-intervals-1.png' | relative_url }})

After selecting your `.csv` with the _Choose File_ button, the button's text will change to the name of the file you selected.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

After you have selected your desired file, clicking the _Upload_ button will bring you to the settings page for _Extract transcripts for time intervals_.

![]({{ '/assets/screengrab/extract-with-csv/extract-transcripts-for-time-intervals-2.png' | relative_url }})

On this page, the setting for the "Transcript Name column" should be set to the column in your `.csv` containing the file names of transcripts.
If your `.csv` has a column named _Transcript_, APLS will automatically select that column for this setting.

The settings for the "Start Time column" and "End Time column" should be set to the columns in your `.csv` that specify the time intervals of the transcripts you'd like to extract.
If your `.csv` has columns named _Line_ and _LineEnd_, APLS will automatically select those column for these settings.

{:.note}
> Other acceptable options for the Start Time column and End Time column settings include _Target word start_ and _Target word end_, as well as _Target segment start_ and _Target segment end_.

The "Prefix column" setting allows you to optionally select a column from your `.csv` that will be appended to the beginning of the extracted transcript files. 
If your `.csv` has a column named _Number_, APLS will automatically select that column for this setting.
If you do not want prefixed file names, click the drop-drop menu and select _[no prefix]_.

Next to the "Prefix column" setting is the accompanying "Zero-pad to _n_ digits" setting, which lets you specify the zero-padding for your prefixes.

The "Layers to include:" section allows you to select the [layers]({{ '/doc/layer-field-guide' | relative_url }}) you would like in the exported transcript files.
You can hover over each [layer]({{ '/doc/layer-field-guide' | relative_url }}) to view a tooltip briefly describing that layer.
Layers that you have recently used will be selected by default. 
At least one layer must be selected to be included in the exported transcripts.

<!-- the tooltips for the layers on this page are different than the tooltips on the search page for some reason -->
<!-- you also can't shift-select multiple layers at once? -->

The drop-down menu at the bottom of the page allows you to select the file format for the exported transcripts.

After specifying your desired settings, clicking the _Export_ button will cause a progress bar to appear as APLS processes your export request.
Once the export is finished, you will be prompted to save a `.zip` file containing all of the exported transcripts in your selected file format.

## Extract annotations for search matches

Clicking the link to _Extract annotations for search matches_ will bring you to a page where you can upload the search results `.csv` you would like to use for extracting data.

<!-- okay THIS page DOES give you warning pop-up if you try to upload a non-csv file 
however, it does still break if you click "upload" without selecting a file -->

![]({{ '/assets/screengrab/extract-with-csv/extract-annotations-for-search-matches-1.png' | relative_url }})

After selecting your `.csv` with the _Choose File_ button, the button's text will change to the name of the file you selected.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

After you have selected your desired file, clicking the _Upload_ button will bring you to the settings page for _Extract annotations for search matches_.

![]({{ '/assets/screengrab/extract-with-csv/extract-annotations-for-search-matches-2.png' | relative_url }})

On this page, the setting for the "Target" should be set to the column in your `.csv` containing either the MatchIDs or URLs of your search results.
If your `.csv` has a column named _MatchID_, APLS will automatically select that column for this setting.

The drop-down menu after "Extract data for the" allows to select if you want annotations about the matches in your search results (_given token_), the tokens directly before your matches (_previous token_), or the tokens directly after your matches (_next token_).

The "Layers" section allows you to select the [layers]({{ '/doc/layer-field-guide' | relative_url }}) you would like to include in the exported `.csv` file.
You can hover over each [layer]({{ '/doc/layer-field-guide' | relative_url }}) to view a tooltip briefly describing that layer.
At least one layer must be selected to be included in the exported `.csv`.
<!-- this last part technically isn't true, but if you don't select any layers, then the resulting download is just a completely empty .csv -->

<!-- the tooltips for the layers on this page are good, but the attribute tooltips are different from the attribute page tooltips -->
<!-- shift-selecting multiple layers DOES work on this page -->

The "Annotations per layer" setting allows you to select the number of annotation columns to be included in the `.csv` for each selected layer.
For example, setting this to 1 will cause the `.csv` to add one column containing the first available annotation for each selected layer.
If there are empty columns in the `.csv`, that means that the selected layer did not contain enough annotations to fill all the columns.

{:.note}
> The "Annotations per layer" setting is similar to selecting the number of annotations to include in the [_CSV Export_ on the Search Results page]({{ '/doc/export-data#csv-export' | relative_url }}).
> However, the "Annotations per layer" setting will apply to **all** of the layers you have selected.

The "Offsets" setting lets you select whether or not the exported `.csv` will contain start and end times for the annotation labels.
The default option is _No offsets_ and will cause the `.csv` to include annotation labels but not start and end times for the labels.
The _Aligned offsets_ option will include start and end times **only** for annotations that have been force-aligned.
The _All offsets_ option will include start and end times for all annotations, even ones that have not been force-aligned.

The "CSV field delimiter" setting allows to select if exported `.csv` file should be comma-separated, semicolon-separated, or tab-separated.
This setting will automatically set itself to the same delimiter used in your uploaded file.

After specifying your desired settings, clicking the _Insert Data_ button will prompt you to download the exported `.csv` file.
This `.csv` will contain all the columns of your original uploaded `.csv`, with additional columns added containing annotations from your selected layers.

## Extract annotations for time intervals

Clicking the link to _Extract annotations for time intervals_ will bring you to a page where you can upload the search results `.csv` you would like to use for extracting data.

<!-- this page also gives a warning pop-up if you try to upload a non-csv file 
however, it does still break if you click "upload" without selecting a file -->

![]({{ '/assets/screengrab/extract-with-csv/extract-annotations-for-time-intervals-1.png' | relative_url }})

After selecting your `.csv` with the _Choose File_ button, the button's text will change to the name of the file you selected.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

<!-- I'm taking a break here, but I noticed that the layer picker on this page has the same weird issues as "Extract transcripts for time intervals" -->




