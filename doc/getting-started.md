---
title: Getting started
permalink: /doc/getting-started
nav_order: 10
last_modified_date: 2025-01-27T13:44:13-05:00
---

# {{ page.title }}
{:.no_toc}

APLS contains sound files with accompanying annotated transcripts that allow the corpus files to be used as structured linguistic data.
Once you have an [APLS login](#sign-up), you can access APLS through your browser at <https://apls.pitt.edu/labbcat>.[^r-python]
<!-- APLS works just like any other webpage: you can use the back/forward buttons to navigate, create bookmarks, load multiple pages in tabs, etc. -->

[^r-python]: Advanced users can also access APLS via the [`nzilbb.labbcat` package][labbcat-R] for R, or the [`nzilbb-labbcat` library][labbcat-py] for Python. These packages have most of the functionality of the browser-based graphical user interface (https://apls.pitt.edu/labbcat), with some added benefits such as reproducibility (e.g., a particular set of [search]({{ '/doc/search' | relative_url }}) criteria can be encoded in R/Python code rather than described for copy/paste). Even if you plan to mostly use these interfaces, however, it's a good idea to learn the browser-based GUI first, as it will help you build an intuitive sense for how APLS data is organized.

{% include page_toc.html collapsible=true open=true %}


## Navigating documentation site

We'll get into [using APLS itself]({{ '/doc/how-to-use' | relative_url }}) once you have a [user account](#sign-up).
In the meantime, here are some tips for navigating this documentation site.


### Special formatting

This site uses special formatting to denote specific types of information:

- **Key terms**
  - Example: <span class="keyterm">annotation</span>
  <!-- - Linked to corresponding entries in the [glossary]({{ '/doc/glossary' | relative_url }}) -->
- **Layers**
  - Example: <span class="layer">orthography</span>
  <!-- - Linked to an extensive [layer reference]({{ '/doc/layer-reference' | relative_url }}) -->
- **Internal links** (i.e., a link to a specific location or page in the APLS documentation)
  - Example: [Special formatting](#special-formatting)
- **External links** (i.e., a link that's not to a documentation page or an APLS page)
  - Example: [LaBB-CAT]
- **Input/output text** (i.e., something you actually type into APLS or information that APLS displays)
  - Example: `CB01`
- **Things you click on in APLS** (e.g., a menu option or a link)
  - Example: The _transcripts_ page
  

### Navigation across and within pages

You can browse through pages in the left-hand navigation pane.
<!-- If you're viewing this site on a mobile device, you can click = to bring up the navigation -->
Most pages have a collapsible table of contents toward the top of the page.
All headings in the text of a page have a unique permalink; 
you can copy this permalink by hovering over the heading and clicking the link icon (<svg viewBox="0 0 16 16" aria-hidden="true" style="height: 1em;"><use xlink:href="#svg-link"></use></svg>)
In the top bar, you can search the documentation (you can type the `/` key to move your cursor to the search bar without clicking), suggest edits to pages on GitHub, and toggle between light mode and dark mode.


### Callout boxes

Throughout these pages are collapsible "callout" boxes to help you understand how to use APLS and how it works.
Green "Try it!" boxes give you step-by-step instructions on doing some task in APLS.
Blue "Under the hood" boxes give some details about technical details, design decisions, and/or the history of APLS's development.
For example:

{: .try-it }
> Even if you don't have an APLS login yet, you can still load the page in your browser.
>
> Go to <https://apls.pitt.edu/labbcat>.
> You should see a login box pop up:
> ![]({{ '/assets/screengrab/login.png' | relative_url }}){: .screengrab }

{: .under-the-hood }
> APLS's original URL was <https://labb-cat.linguistics.pitt.edu/labbcat>.
> But the <https://apls.pitt.edu/labbcat> URL was chosen as an alias because it's shorter, easier to remember, and less prone to typos.


<!-- ## Terms of use -->

## Sign up

Ready to get started with APLS? 
[Sign up for a user account][sign up]{: target="_blank"}.
We'll send you a username and temporary password within 1 US business day.


### Initial login

Once you have a username and temporary password, you can log in to <https://apls.pitt.edu/labbcat>:

![]({{ '/assets/screengrab/login.png' | relative_url }}){: .screengrab }


There are two additional things you'll only need to do the **first** time you log in:

1. You'll see a license (below). Scroll to the bottom and click _I Agree_.
   ![]({{ '/assets/screengrab/license.png' | relative_url }}){: .screengrab }
   
1. Then you'll see a prompt to reset your temporary password. Enter your new password and click _Change Pass Phrase_.
    ![]({{ '/assets/screengrab/password-reset.png' | relative_url }}){: .screengrab }


### Forget your password?

If you forget your password, fill out the [password-reset form][password reset]{: target="_blank"}.
We'll reset your password within 1 US business day.


{% include linklist.html %}


