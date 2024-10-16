---
title: Troubleshooting
layout: default
permalink: /doc/troubleshooting
parent: How to use APLS
last_modified_date: 2024-10-16T11:47:57-04:00
---

# {{ page.title }}
{:.no_toc}

If you don't see your issue here, please [contact us](mailto:d.vill@pitt.edu?subject=APLS troubleshooting: Some other issue)!

{% include page_toc.html collapsible=true %}

## You can't log onto APLS

### "Too many redirects"

| Symptoms | Explanation | Solution |
| -------- | ----------- | -------- |
| You get an error message like "apls.pitt.edu redirected you too many times" or "Could not open the page, too many redirects" | This indicates an issue with the server that APLS runs on.<br>(Contrary to the error message, clearing your cookies will generally _not_ fix the issue.) | [Email Dan](mailto:d.vill@pitt.edu?subject=APLS error: Too many redirects&body=Please fix this error. Thanks!) |

![A Google Chrome browser window that shows https://apls.pitt.edu/labbcat/www.pitt.edu in the URL bar, with the page showing the text "This page isn’t working. apls.pitt.edu redirected you too many times. Try clearing your cookies. ERR_TOO_MANY_REDIRECTS"]({{ '/assets/img/NoLoad-Redirect.png' | relative_url }}){: .screengrab }


### Username/password incorrect

APLS passwords are case-sensitive (usernames are not), so double-check capitalization.
If that doesn't work, fill out this [password reset form](https://forms.gle/AcE1pC4QVj7eL8RS9), and we'll get back to you as soon as possible.


## You get unexpected search results

<!-- Add search-tips page under how to use -->


## APLS is slow

APLS is usually pretty fast!
To benchmark APLS's speed, we ran the same search query multiple times at different times of day: [searching participant CB01](https://apls.pitt.edu/labbcat/search?participant_expression=%5B%27CB01%27%5D.includes(id)) for `i` on the **segment** layer (i.e., all time-aligned tokens of the /i/ vowel), with none of the check-box options selected, showing 1 word before/after each match.
<!-- Mention APLS version number -->
<!-- Plot of results of 100 search runs -->

APLS might be running slowly for you if:

1. you've requested a computationally expensive operation, such as:
    - a particularly complicated search query (more than 5 layers and/or across several words)
    - exporting a lot of audio data
    - selecting a lot of layers to display on a transcript, especially if it's a longer sound file
1. there are lots of users accessing APLS at the same time you are (more than 25)
1. we happen to be adding a feature or doing maintenance while you're using APLS
1. there's some other unexpected slowdown

You can always run the benchmark search mentioned above to see if APLS is running slower than usual (cases #2--4).
If so, we'd recommend waiting a little bit and trying again.
If APLS is _still_ slower than expected for even the benchmark search, please [email Dan](mailto:d.vill@pitt.edu?subject=APLS is slow&body=APLS is running slowly right now. I ran the benchmark search mentioned at https://djvill.github.io/APLS/doc/troubleshooting#apls-is-slow and it took about SECONDS seconds to run. Thanks!).
