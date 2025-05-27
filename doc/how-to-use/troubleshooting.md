---
title: Troubleshooting
permalink: /doc/troubleshooting
parent: How to use APLS
nav_order: 90
last_modified_date: 2025-05-27T11:50:52-04:00
---

# {{ page.title }}
{:.no_toc}

If you don't see your issue here, please [contact us](mailto:apls@pitt.edu?subject=Troubleshooting: Some other issue)!

{% include page_toc.html collapsible=true %}

## You can't log onto APLS

### "HTTP Status 404"

| Symptoms | Explanation | Solution |
| -------- | ----------- | -------- |
| You get the error message "HTTP Status 404". | This indicates that you've misspelled `labbcat` in the URL (which is case-sensitive). | Navigate to <https://apls.pitt.edu/labbcat> |

![A Google Chrome browser window that shows https://apls.pitt.edu/Labbcat in the URL bar, with the page showing the text "HTTP Status 404 – Not Found. Type: Status Report. Message: The requested resource [/Labbcat] is not available. Description: The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.
Apache Tomcat/9.0.68"]({{ '/assets/screengrab/troubleshooting/tomcat-404.png' | relative_url }})


### "Server IP address could not be found"

| Symptoms | Explanation | Solution |
| -------- | ----------- | -------- |
| You get an error message like "This site can't be reached. apl.pitt.edu’s server IP address could not be found." | This indicates that you've misspelled `apls.pitt.edu` in the URL. | Navigate to <https://apls.pitt.edu/labbcat> |

![A Google Chrome browser window that shows https://apl.pitt.edu/labbcat in the URL bar, with the page showing the text "This site can't be reached. apl.pitt.edu’s server IP address could not be found. Try checking the connection, checking the proxy and the firewall, running Windows Network Diagnostics. ERR_CONNECTION_RESET"]({{ '/assets/screengrab/troubleshooting/name-not-resolved.png' | relative_url }})


### "Too many redirects"

| Symptoms | Explanation | Solution |
| -------- | ----------- | -------- |
| You get an error message like "This page isn't working. apls.pitt.edu redirected you too many times" or "Could not open the page, too many redirects". The URL bar might also change to `https://apls.pitt.edu/labbcat/www.pitt.edu`, which is not a valid URL. | This indicates that APLS has temporarily been taken offline for maintenance. This is rare and usually lasts less than 5 minutes.<br>(Contrary to the error message, clearing your cookies will generally _not_ fix the issue.) | [Email us](mailto:apls@pitt.edu?subject=Error: Too many redirects&body=Please fix this error. Thanks!) |

![A Google Chrome browser window that shows https://apls.pitt.edu/labbcat/ in the URL bar, with the page showing the text "This page isn’t working. apls.pitt.edu redirected you too many times. Try clearing your cookies. ERR_TOO_MANY_REDIRECTS"]({{ '/assets/screengrab/troubleshooting/noload-redirect.png' | relative_url }})


### "The connection was reset"

| Symptoms | Explanation | Solution |
| -------- | ----------- | -------- |
| You get an error message like "This site can't be reached. The connection was reset." | This indicates a larger issue with IT systems at Pitt, affecting the server that APLS runs on. These are very rare but can last for unknown amounts of time.<br>(Contrary to the error message, checking the proxy/firewall or running network diagnostics will generally _not_ fix this issue.) | [Email us](mailto:apls@pitt.edu?subject=Error: The connection was reset&body=Please fix this error. Thanks!) |

![A Google Chrome browser window that shows https://apls.pitt.edu/labbcat/www.pitt.edu in the URL bar, with the page showing the text "This page isn’t working. The connection was reset. Try checking the connection, checking the proxy and the firewall, running Windows Network Diagnostics. ERR_CONNECTION_RESET"]({{ '/assets/screengrab/troubleshooting/noload.png' | relative_url }})


### Username/password incorrect

APLS passwords are case-sensitive (usernames are not), so double-check capitalization.
If that doesn't work, fill out this [password reset][] form, and we'll get back to you as soon as possible.


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
If APLS is _still_ slower than expected for even the benchmark search, please [email us](mailto:apls@pitt.edu?subject=APLS is slow&body=APLS is running slowly right now. I ran the benchmark search mentioned at https://djvill.github.io/APLS/doc/troubleshooting#apls-is-slow and it took about SECONDS seconds to run. Thanks!).

{% include linklist.html %}
