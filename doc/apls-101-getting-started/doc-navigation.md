---
title: Navigating documentation
permalink: /doc/doc-navigation
parent: APLS 101/Getting started
nav_order: 40
last_modified_date: 2025-03-11T12:21:10-04:00
---

# {{ page.title }}
{:.no_toc}

Here are some tips for navigating this documentation site.

{% include page_toc.html collapsible=true open=true %}


## Special formatting

This site uses special formatting to denote specific types of information:

- **Key terms**
  - Example: <span class="keyterm">annotation</span>
  <!-- - Linked to corresponding entries in the [glossary]({{ '/doc/glossary' | relative_url }}) -->
- **Layers** and **attributes**
  - Example: <span class="layer">orthography</span>
  - If you hover over a layer/attribute name, a tooltip will pop up with a short description of the layer/attribute
  - Clicking on the name will load its entry in the [layer/attribute field guides]({{ '/doc/detailed-field-guides' | relative_url }})
- **Internal links** (i.e., a link to a documentation page or APLS page)
  - Example: [How to use APLS]({{ '/doc/how-to-use' | relative_url }})
- **External links** (i.e., a link that's not to a documentation page or an APLS page)
  - Example: [LaBB-CAT]
- **Input/output text** (i.e., something you actually type into APLS or information that APLS displays)
  - Example: `CB01`
- **Things you click on in APLS** (e.g., a menu option or a link)
  - Example: The _transcripts_ page
  

## Navigation across and within pages

You can browse through pages in the left-hand navigation pane.
<!-- If you're viewing this site on a mobile device, you can click = to bring up the navigation -->
Most pages have a collapsible table of contents toward the top of the page.
All headings in the text of a page have a unique permalink; 
you can copy this permalink by hovering over the heading and clicking the link icon (<svg viewBox="0 0 16 16" aria-hidden="true" style="height: 1em;"><use xlink:href="#svg-link"></use></svg>)
In the top bar, you can search the documentation (you can type the `/` key to move your cursor to the search bar without clicking), suggest edits to pages on GitHub, and toggle between light mode and dark mode.


## Callout boxes

Throughout these pages are "callout" boxes to help you understand how to use APLS and how it works:

- Yellow "Note" boxes give important information that might otherwise interrupt the flow of the text.
  
  {: .note }
  > APLS is powered by the open-source corpus software [LaBB-CAT].
  > Throughout this documentation, we'll use the term _LaBB-CAT_ when we're talking about the LaBB-CAT software or LaBB-CAT corpora more generally, and _APLS_ for this corpus specifically.

- Green "Try it!" boxes give you step-by-step instructions on doing some task in APLS. These are especially useful for hands-on learners, but you can skip them if you just need a refresher.
  
  {: .try-it }
  > Even if you don't have an APLS login yet, you can still load the page in your browser.
  >
  > 1. Go to <https://apls.pitt.edu/labbcat>.
  > 
  > You should see a login box pop up:
  > ![]({{ '/assets/screengrab/login.png' | relative_url }})

- Blue "Under the hood" boxes give some details about technical details, design decisions, and/or the history of APLS's development. They're meant for especially curious readers, but they're not crucial to understanding how to use APLS or how it works.
  
  {: .under-the-hood }
  > APLS's original URL was <https://labb-cat.linguistics.pitt.edu/labbcat>.
  > But the <https://apls.pitt.edu/labbcat> URL was chosen as an alias because it's shorter, easier to remember, and less prone to typos.


{% include linklist.html %}


