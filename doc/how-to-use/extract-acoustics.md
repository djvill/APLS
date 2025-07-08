---
title: Extracting acoustic measurements
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/extract-acoustics
parent: How to use APLS
nav_order: 70
last_modified_date: 2025-07-08T15:46:14-04:00
---

# {{ page.title }}
{:.no_toc}


The <span class="apls-page">Process with Praat</span> page lets you process audio with Praat directly in your browser using a [`.csv` file of results]({{ '/doc/export-data' | relative_url }}) from a [search]({{ '/doc/search' | relative_url }}).
The [_Process with Praat_](https://apls.pitt.edu/labbcat/praat) page is accessible from the [<span class="apls-page">Extract</span> page]({{ '/doc/extract-with-csv' | relative_url }}).

{% include page_toc.html collapsible=true %}

## What you can do on the <span class="apls-page">Process with Praat</span> page

The <span class="apls-page">Process with Praat</span> page has the capability to...
- [extract formant measurements](#extracting-formant-measurements)
- [extract pitch measurements](#extracting-pitch-measurements)
- [extract intensity measurements](#extracting-intensity-measurements)
- [extract center of gravity measurements](#extracting-cog-measurements)
- [run custom Praat scripts](#running-custom-praat-scripts)

### Layout

<!--- APLS is currently down so I couldn't get a screengrab --->

## Process with Praat

The first step in using the <span class="apls-page">Process with Praat</span> page is to upload a search results `.csv` with the transcript names, participant codes, and start and end times of the audio segments you'd like to analyze.

<!--- APLS is currently down so I couldn't get a screengrab --->

After selecting your `.csv` with the _Choose File_ button, the name of the file will appear next to the _Choose File_ button.
This allows you to verify that the correct file has been selected.
If the file is not the one you wanted to select, you can click the button again to select a different file.

After choosing a `.csv` file, the _Process with Praat_ settings menu will appear.

The setting for the "Transcript Name column" should be set to the column in your `.csv` containing the file names of transcripts.
If your `.csv` has a column named _Transcript_, APLS will automatically select that column for this setting.

The setting for the "Participant column" should be set to the column in your `.csv` containing participant codes of speakers.
If your `.csv` has a column named _Speaker_, APLS will automatically select that column for this setting.

The settings for the "Start Time column" and "End Time column" should be set to the columns in your `.csv` that specify the time intervals of the audio you'd like to extract.
If your `.csv` has columns named _Target word start_ and _Target word end_, APLS will automatically select those column for these settings.

{:.note}
> Other acceptable options for the Start Time column and End Time column settings include _Line_ and _LineEnd_, as well as _Target segment start_ and _Target segment end_.

The setting for "Context" determines the amount of additional audio that will be added before and after your targeted time intervals.
For example, if one of your time intervals starts at 2.0s and ends at 3.0s and "Context" is set to `0.025` (25ms), then the audio processed by Praat will span from 1.975s to 3.025s.
The amount of context that will be added to your targeted times is also displayed visually with the sample waveform to the right of the "Context" setting.

After specifying your analysis parameters, clicking the _Process_ button will generate a copy of your uploaded `.csv` with Praat measurement values appended as new columns in your `.csv`.

### Extracting formant measurements

The "Formants" section lets you select if you want to extract the first formant (F1), second formant (F2), and/or third formant (F3) of your audio targets.
These selections can be made by toggling the checkboxes on or off.

Clicking the ▼ button next to "Formants" allows you to specify additional advanced settings.

The "Sample Points" setting allows you to specify the points at which to take formant measurements.  
The default is a single point at `0.5`. 
This will measure formants at one point in time that is halfway through your specified time intervals.  
You can specify multiple sample points by including a single space between each sample point.

{:.note}
> The spacing of sample points does not include the additional context window.
> For example, a sample point of `0.0` would start at the beginning of your specified target times and *not* at the beginning of the context window.

{: .try-it }
> To extract eleven formant measurements evenly spaced throughout your target time intervals:
> - This "Try it!" assumes that you already have a search results `.csv` with the necessary columns for using the <span class="apls-page">Process with Praat</span> page.
> 1. Go to the [_Process with Praat_](https://apls.pitt.edu/labbcat/praat) page.
> 1. Click _Choose File_ and select your search results `.csv`.
> 1. Click the ▼ button next to "Formants".
> 1. Clear the "Sample Points" numeric field and enter `0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0`.
> 1. Click the _Process_ button.

There are two options for extracting formant measurements:

#### Extracting formants with Praat Formant command

The "Praat Formant command" option uses the Praat command `To Formant (burg)... 0.0025 5 formantCeiling 0.025 50` to create a formant object for measurements.
You can edit this command directly in the text box if you would like different settings for your formant object.

The "Formant Ceiling" setting lets you specify the general maximum frequency of the formant search range in Hertz.
By default, this is set to `5500` Hz.

In addition to the general formant ceiling, you can also specify exceptions for participants who match certain characteristics.
For example, a default exception is included to set the Formant Ceiling to `5000` for participants whose <span class="participant-attr">gender</span> matches `M`.

This exception can be disabled by unchecking the checkbox next to "Except participants whose", in which case the general "Formant Ceiling" value will be used for all participants.
You can also change the settings of this exception to: 
- match different [participant attributes]({{ '/doc/participant-attributes' | relative_url }}) with the drop-down menu
- match different values of participant attributes with the textbox next to "...matches"
- have a different formant ceiling value with the numeric field underneath "...matches"

You can specify additional formant ceiling exceptions by clicking the `+` button.

#### Extracting formants with FastTrack

The "FastTrack" option uses the [FastTrack Praat plugin](https://github.com/santiagobarreda/FastTrack) to generate a formant object.

FastTrack automatically runs multiple formant analyses on each segment, selects the best analysis, and makes the winning formant object available for measurement.
FastTrack can also return regression coefficients by toggling the checkbox next to "Coefficients".

The formant ceiling settings and exceptions are the same as [Extracting formants with Praat Formant command](#Extracting-formants-with-Praat-Formant-command), except FastTrack allows you to specify a lowest frequency as well as a highest frequency.

FastTrack also has additional advanced settings that can be accessed by clicking the ▼ button next to "Advanced".
APLS uses FastTrack's default settings and heuristics, but these can be changed using the "Advanced" settings section.
More information about these settings can be found on the [GitHub Wiki for FastTrack](https://github.com/santiagobarreda/FastTrack/wiki/Options).

### Extracting pitch measurements

The "Pitch" section lets you select if you want to extract the minimum, mean, and/or maximum pitch of your audio targets.
These selections can be made by toggling the checkboxes on or off.

Clicking the ▼ button next to "Pitch" allows you to specify additional advanced settings.

The default "Praat Pitch command" used by APLS is `To Pitch (ac)...  0 pitchFloor 15 no 0.03 voicingThreshold 0.01 0.35 0.14 pitchCeiling` to create a pitch object for measurements.
You can edit this command directly in the text box if you would like different settings for your pitch object.

The "Pitch Floor" and "Pitch Ceiling" settings let you specify the minimum and maximum Hertz frequencies that will be considered in the pitch analysis
By default, "Pitch Floor" is set to `60` Hz and "Pitch Ceiling" is set to `500` Hz.

The "Voicing Threshold" setting lets you specify the value of the strength of the unvoiced candidate, relative to the maximum possible autocorrelation.
By default, "Voicing Threshold" is set to `0.5`.
<!-- i read through the praat documentation to try and figure out a simple way to describe this setting and couldn't manage to do it -->

In addition to the general pitch analysis settings, you can also specify exceptions for participants who match certain characteristics.
For example, a default exception is included to set the Pitch Floor to `30`, the Pitch Ceiling to `250`, and the Voicing Threshold to `0.4` for participants whose <span class="participant-attr">gender</span> matches `M`.

This exception can be disabled by unchecking the checkbox next to "Except participants whose", in which case the general pitch analysis values will be used for all participants.
You can also change the settings of this exception to: 
- match different [participant attributes]({{ '/doc/participant-attributes' | relative_url }}) with the drop-down menu
- match different values of participant attributes with the textbox next to "...matches"
- have different analysis values with the numeric fields underneath "...matches"

You can specify additional exceptions by clicking the `+` button.

### Extracting intensity measurements

The "Intensity" section lets you select whether or not to extract the maximum intensity of your audio targets.
This selection can be made by toggling the _Maximum_ checkbox on or off.

Clicking the ▼ button next to "Intensity" allows you to specify additional advanced settings.

The default "Praat Intensity command" used by APLS is `To Intensity... intensityPitchFloor 0 yes` to create an intensity object for measurements.
You can edit this command directly in the text box if you would like different settings for your intensity object.

The "Pitch Floor" setting lets you specify the general minimum frequency of the intensity analysis in Hertz.
By default, this is set to `60` Hz.

In addition to the general pitch floor, you can also specify exceptions for participants who match certain characteristics.
For example, a default exception is included to set the "Pitch Floor" to `30` for participants whose <span class="participant-attr">gender</span> matches `M`.

This exception can be disabled by unchecking the checkbox next to "Except participants whose", in which case the general "Pitch Floor" value will be used for all participants.
You can also change the settings of this exception to: 
- match different [participant attributes]({{ '/doc/participant-attributes' | relative_url }}) with the drop-down menu
- match different values of participant attributes with the textbox next to "...matches"
- have a different pitch floor value with the numeric field underneath "...matches"

You can specify additional formant ceiling exceptions by clicking the `+` button.

### Extracting CoG measurements

The "Center of Gravity" section lets you select if you want to extract the center of gravity by a power of 2 (p=2), power of 1 (p=1), and/or power of ⅔ (p=⅔) for your audio targets.
These selections can be made by toggling the checkboxes on or off.

This analysis is performed using the Praat command `Spectrum: Get centre of gravity`.

<!-- there's very little info about this that I can find on APLS so I'm guessing/assuming about most of the details here -->

### Running custom Praat scripts

The final setting of the <span class="apls-page">Process with Praat</span> page is "Custom Praat Script".
This setting allows you to write your own Praat script to be performed on each of your target time intervals.
You can expand this section by clicking the ▼ button next to "Custom Praat Script".

{:.note}
> The custom Praat script can contain any code that is compatible with the version of Praat being used by APLS.

{:.note no-collapse}
> In order to have data from your custom script be saved into the resulting `.csv` file, you need to save the data in a variable that is printed on its own line.
> APLS names the results columns in the `.csv` after the variables you use.

The displayed text information in the "Custom Praat Script" explains that: 
- APLS will automatically configure your script to open audio files and extract samples according to the settings you've selecting on the <span class="apls-page">Process with Praat</span> page.
- Objects created by your script must be `Remove`d before the end of your script so that Praat doesn't run out of memory.
- All calls to the function `print` are assumed to correspond to fields for export and each field must be printed on its own line.

The text also includes a list of variables defined by APLS that can be used in your custom script.
<!-- I decided not to include all of the variables here, mostly for space considerations -->

At the bottom of the variables list is a "participant attribute variables" menu that can be expanded by clicking the ▼ button.
Toggling the checkbox for any of the displayed participant attribute variables will make those variables available for use in your script.

You can either manually type your Praat script into the "Praat script" textbox field or you can upload your custom script as a `.praat` script file by clicking _Choose File_ next to " _Load script from file_ ". 
If you upload a `.praat` script file, you can view and edit the script code in the "Praat script" textbox field.
If you manually write your Praat script into the "Praat script" textbox field, you can save the script for later use by clicking the _Save Script To File_ button.

{: .try-it }
> To write and save an APLS Praat script that creates a spectrum object, filters it, and then extracts its center of gravity:
> 1. Go to the [_Process with Praat_](https://apls.pitt.edu/labbcat/praat) page.
> 1. Click the ▼ button next to "Custom Praat Script".
> 1. Type the following into the "Your Praat script code goes here" textbox:
>   ``` 
>   # get center of gravity and spread from spectrum
>   spectrum = To Spectrum... yes
>   # filter it
>   Filter (pass Hann band)... 1000 22000 100
>   # get centre of gravity
>   cog = Get centre of gravity... 2
>   # extract the result back out into a CSV column called 'cog'
>   print 'cog:0' 'newline$'
>   # tidy up objects
>   select spectrum
>   Remove
>   ```
> 1. Click the _Save Script To File_ button.

