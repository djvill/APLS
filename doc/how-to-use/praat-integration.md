---
title: Setting up Praat integration
permalink: /doc/praat-integration
parent: Viewing a transcript
grand_parent: How to use APLS
nav_order: 10
last_modified_date: 2025-02-07T16:39:30:z
---

# {{ page.title }}
{:.no_toc}

A useful feature of APLS is its in-browser integration with the speech analysis software [Praat]. 
By setting up Praat integration for APLS, you can open audio clips and their accompanying TextGrids in Praat directly from APLS webpages.
Praat integration is supported when viewing [transcript pages]({{ '/doc/view-transcript' | relative_url }}).

{: .note .no-collapse}
> Praat Integration is supported for Google Chrome, Mozilla Firefox, & [Chromium-based browsers](https://en.wikipedia.org/wiki/Chromium_(web_browser)#Browsers_based_on_Chromium). Praat Integration **does not work with Safari**, due to Safari no longer supporting Java. 

On this page, we cover the configuration steps for Praat integration depending on the web browser you are using. 
If you are looking for information about interpreting the exported TextGrids, go to the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation page.

{% include page_toc.html collapsible=true %}

## Required software for all users

Regardless of the web browser you are using to access APLS, there are two pre-requisites you must have installed on your local computer to use Praat integration:

1. [Praat] (your Praat installation must be at least version 6.2.05 or newer)
1. [Java](http://www.java.com/) (Java is used to send the files from your web browser to Praat)

### Configuration steps for Google Chrome (and Chromium-based browsers)

Praat integration for Google Chrome and Chromium-based browsers requires two components to be installed:

- The Praat Integration extension, available on the [Chrome Web Store](https://chromewebstore.google.com/detail/Praat%20Integration/hmmnebkieionilgpepijmfabdickmnig).
- The Praat Native Messaging Host, which is included in the Praat Integration Chrome extension but requires separate installation.

The steps to install these are:

1. Navigate to the Praat Integration extension page on the [Chrome Web Store directly](https://chromewebstore.google.com/detail/Praat%20Integration/hmmnebkieionilgpepijmfabdickmnig) or by clicking the Praat icon in the upper-right corner of the APLS media player.
1. On the Praat Integration extension page, click the button that says "Add to Chrome" (or "Add to [BROWSER NAME]").
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-add-to-chrome.png' | relative_url }})
1. A message will appear asking if you want to add the Praat Integration extension. Click the "Add extension" button.
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-add-extension-chrome.png' | relative_url }})
1. Download and save the file [`install-jsendpraat.jar`](chrome-extension://hmmnebkieionilgpepijmfabdickmnig/install-jsendpraat.jar)
1. Click on the `install-jsendpraat.jar` file to open it. (macOS users may receive a message saying the file can't be opened. Steps for resolving this are included in the [Note for macOS users](#note-for-macos-users) section.)
1. Click the "Install" button that appears in the application window.
1. Once `jsendpraat` is successfully installed, you can delete the `install-jsendpraat.jar` file.
1. Refresh your APLS webpage and enjoy the Praat Integration functionality on [transcript pages]({{ '/doc/view-transcript' | relative_url }})!

### Configuration steps for Mozilla Firefox

Praat integration for Firefox requires two components to be installed:

- The Praat Integration Firefox extension.
- The Praat Native Messaging Host, which is included in the Praat Integration Chrome extension but requires separate installation.

The steps to install these are:

1. Click the Praat icon in the upper-right corner of the APLS media player, which will open a pop-up prompt saying you need to install the 'Praat Integration' browser extension. Click "OK".
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-popup-firefox.png' | relative_url }})
1. Firefox will display a pop-up asking if you want to allow apls.pitt.edu to install an add-on. Click "Continue to installation".
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-allow-install-firefox.png' | relative_url }})
1. Another pop-up message will appear asking if you want to add the Praat Integration extension. Click the "Add" button.
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-add-to-firefox.png' | relative_url }})
1. Download and save the file [`install-jsendpraat.jar`](moz-extension://4d74e341-1ea5-4f86-b7ac-7f6613e0ca43/install-jsendpraat.jar)
1. Click on the `install-jsendpraat.jar` file to open it. (macOS users may receive a message saying the file can't be opened. Steps for resolving this are included in the [Note for macOS users](#note-for-macos-users) section.)
1. Click the "Install" button that appears in the application window.
1. Once `jsendpraat` is successfully installed, you can delete the `install-jsendpraat.jar` file.
1. Refresh your APLS webpage and enjoy the Praat Integration functionality on [transcript pages]({{ '/doc/view-transcript' | relative_url }})!

### Note for macOS users 

When attempting to install `install-jsendpraat.jar`, you may receive a system message saying that the file can't be opened. 
If this occurs, follow these steps:

1. Click "Done" to dismiss the message.
1. Go to your computer's "System Settings" and navigate to "Privacy & Security"
1. Click the "Open Anyway" button under the Security heading.
1. Click the "Open Anyway" button in the system message pop-up.
1. Proceed with the rest of the Praat Integration configuration steps.

## Checking if Praat Integration is set up correctly

To verify that the Praat Integration functionality is correctly installed: 

1. Open the [transcript page for `CB01interview1.eaf`](https://apls.pitt.edu/labbcat/transcript?transcript=CB01interview1.eaf) 
1. Click on the first word in the transcript body (*manipulate*). 
1. The [Word Menu]({{ '/doc/view-transcript#turns-utterances-noises-and-overlaps' | relative_url }}) should display options to open files in Praat. 
   ![]({{ '/assets/screengrab/praat-integration/praat-integration-install-verification.png' | relative_url }})
   1. If you do not see Praat options in the Word Menu, this most likely means there is an issue with the web browser extension installation.
1. Clicking *Open in Praat* should open the utterance's audio file in your local version of Praat.
   1. If the Praat Integration options are available in the Word Menu but clicking them does not open the utterance in Praat, this most likely means there is an issue with the `jsendpraat.jar` installation.
   
{% include linklist.html %}