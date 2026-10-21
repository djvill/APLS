---
title: Your first search - <span class="layer">orthography</span>
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/your-first-search
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 10
last_modified_date: 2026-10-21T17:10:45-04:00
---

# {{ page.title }}
{:.no_toc}

If you are a newcomer to APLS, this page will help you get acquainted with the [<span class="apls-page">Search</span>](https://apls.pitt.edu/labbcat/search) page by walking you through a simple corpus search.
After following along with the example search on this page, you can visit [the other pages in this section]({{ '/doc/search' | relative_url }}) to learn about the more advanced <span class="apls-page">Search</span> page features.

{% include page_toc.html collapsible=true %}

## Your first search

When you first load the <span class="apls-page">Search</span> page, there is a <span class="keyterm">pattern input</span> for the <span class="layer">orthography</span> layer.
This is highlighted in **red**{:.hl-1} below.
(We'll break down the full layout of the <span class="apls-page">Search</span> page on [the next page in this section]({{ '/doc/search-layout' | relative_url }}).)

{% include screengrab.html src="search/overview_one-outline.png" %}

Let's search for all instances of the word _test_ in APLS.

{: .try-it .no-collapse}
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `test` into the orthography input box.
> 1. Press the `Enter`/`Return` key, or click the _Search_ button.

Here's what that should look like:

{% include screengrab.html src="search/overview-progress.png" %}

As you can see, a <span class="keyterm">progress bar</span> and `Querying...` have popped up below the pattern input.

{:.note}
> Some searches will return results quickly, but more complex searches may take a longer time to complete.
> As long as the search progress bar is being displayed, it means that APLS is working on doing your search!

In a few seconds, the search should complete;
the progress bar will fill up, with `Found 13 results` and a `Display results` link below the bar.
Here's what that should look like:

{% include screengrab.html src="search/complete.png" %}

### Allow pop-ups

At this point, you'll either see a new browser tab appear, or you'll get a message from your browser that a pop-up was blocked.
If so, select the option to _Always allow pop-ups and redirects for apls.pitt.edu_, or something similar (the wording will be slightly different depending on your browser).
Here's what that looks like on Google Chrome:

{% include screengrab.html src="search/popup-blocked.png" %}

On some browsers, choosing this option will automatically load the new tab.
On others, you will have to manually click _Display results_ below the progress bar.

### Search results

The new browser tab that appears is the <span class="apls-page">Search results</span> page.
We won't get into all its functionalities here---that's covered on the [Exporting data]({{ '/doc/export-data' | relative_url }}) documentation page---but it's useful to go over the basics so you can understand the effect of different search patterns.
Here's what that should look like:

{% include screengrab.html src="matches/orthography-test.png" layout=true %}

{: .note}
> You'll probably see a different number just after `threadId` in the URL than what is shown in the screenshot.
> You'll probably also see a different number just before `milliseconds`.

Let's break down the things we need to know about:

- The <span class="keyterm">match list</span> (highlighted in **red**{:.hl-1}) displays the search results.
  - As you can see, the match list includes 13 matches. This is consistent with the `Found 13 results` message that appeared below the progress bar on the <span class="apls-page">Search</span> page.

Each line in the match list consists of:

- The <span class="keyterm">before-match context</span> (the first few highlighted in **blue**{:.hl-2}).
  - This displays the word immediately before the word(s) that match the search pattern.
- The <span class="keyterm">match link</span> (the first few highlighted in **green**{:.hl-3}).
  - This displays the word(s) that match the search pattern.
- The <span class="keyterm">after-match context</span> (the first few highlighted in **purple**{:.hl-4}).
  - This displays the word immediately after the word(s) that match the search pattern.

For this simple search, all of the match links display `test`.
This makes sense---our search pattern asked APLS to find all words whose <span class="keyterm">annotation</span> on the <span class="layer">orthography</span> layer is `test`.
This isn't the case for all searches, however, as we'll explore in later pages in this section!

In general, anytime you search APLS, you should check the match list.
This can help you understand whether the phenomenon you **wanted** to search for is the same as the search you **actually** created.

{: .try-it }
> To see how many times _Steelers_ appears in APLS:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `Steelers` into the `orthography` input box.
> 1. Click the _Search_ button.


## Search <span class="layer">orthography</span>, display <span class="layer">word</span>

When you first load up a transcript on the <span class="apls-page">Transcript</span> page, the [main layer that you see]({{ '/doc/view-transcript#everything-you-see-is-data' | relative_url }}) is <span class="layer">word</span>.
So why does the <span class="apls-page">Search</span> page select <span class="layer">orthography</span> by default, not <span class="layer">word</span>?

You might remember that when you're [reading the transcript]({{ '/doc/view-transcript#reading-the-transcript' | relative_url }}), there are some bits of punctuation in participants' turns: `.` for short pauses, `-` for long pauses, `?` for questions or question intonation, and `___` for redactions.
These punctuation marks belong to <span class="keyterm">annotation</span>s on the <span class="layer">word</span> layer.
For example, the last <span class="layer">word</span> annotation in this line (from transcript `CB01interview3.eaf`) is `whatever ?`, including the space and question mark.

{% include screengrab.html src="transcript/body-line-3.png" %}

While these punctuation marks are useful for understanding what's going on in the transcript at a glance, they're not very useful for searching the corpus.
For example, if you want to find all instances of the word _yinzer_, you probably don't want to restrict your search to instances where there is (or isn't) a pause after the word or question intonation.
(The second-person pronoun _yinz_ is popularly imagined to be unique to Pittsburgh, so _yinzer_ is an informal way to refer to Pittsburghers.)
Another way to think of it is that _yinzer_ is the same word regardless of whether or not it's followed by a pause, so any search for _yinzer_ should ignore this irrelevant fact.

{: .under-the-hood}
> You might've noticed that there was one punctuation mark we left out above: `~` for an incomplete or hesitated word.
> This is because `~` characters are in **both** <span class="layer">word</span> **and** <span class="layer">orthography</span> annotations.
> For the purpose of processing speech data, it's often convenient to treat an unfinished word as distinct from its finished counterpart (e.g., _bec~_ is not the same word as _because_).
> As a result, APLS preserves `~` when it creates <span class="layer">orthography</span> annotations from <span class="layer">word</span> annotations.

So the <span class="layer">orthography</span> layer is the default for search because it:
- strips out the punctuation marks `.`, `-`, and `~` from the <span class="layer">word</span> layer,
- is always lowercase, and
- has no annotation for redacted <span class="layer">word</span>s (those whose annotation is `___`).

To demonstrate what we mean, when you enter _yinzer_ into the <span class="layer">orthography</span> input box on the <span class="apls-page">Search</span> page, here's the <span class="apls-page">Search results</span> page that pops up:

{% include screengrab.html src="matches/orthography-yinzer.png" %}

As you can see, the match links in the match list don't all look exactly the same: `yinzer ?`, `yinzer`, `yinzer .`, etc.
That's because regardless of which layer(s) you include in your search matrix, the match list will display matches (including before/after-match context) as they appear in the <span class="layer">word</span> layer.

Similarly, when you search for _market_ on the <span class="layer">orthography</span> layer, the matches include both lowercase `market` and uppercase `Market`.
(The uppercase `Market`s refer to the now-closed [Market House] in Cranberry Township, Downtown Pittsburgh's Market Square, and other proper nouns.)
Here's what that looks like:

[Market House]: https://web.archive.org/web/20261019192920/https://www.post-gazette.com/local/north/2005/07/31/Family-market-closes/stories/200507310287

{% include screengrab.html src="matches/orthography-market.png" %}

{: .try-it }
> To confirm that the <span class="layer">orthography</span> layer is case-insensitive:
> 1. Go to the [<span class="apls-page">Search</span> page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `Steelers` into the `orthography` input box.
> 1. Click the _Search_ button.
> 1. Now do the same for `sTeElErS`. Do you get the same matches?

{: .note-title }
> Case-sensitive searches on the <span class="layer">word</span> layer
>
> In rare cases, you might want a case-sensitive search.
> For example, you might want to search for the month _May_ as separate from the verb _may_.
> In that case:
> - use the <span class="layer">word</span> layer, and
> - add the code `( .+)?` to the end of the word in the input box.
>
> For the _May_ example, this means that you would enter `May( .+)?` into the input box, like so:
>
> {% include screengrab.html src="search/word-May-regex.png" %}
>
> The resulting matches will include the whole word `May` and punctuation-marked variants `May .` & `May -`, but it won't show lowercase `may` or irrelevant words like `Mayor`:
>
> {% include screengrab.html src="matches/word-May-regex.png" %}
>
> The special code `( .+)?` basically tells APLS to look for "either (1) a space and some more stuff, or (2) nothing at all".
> As a result, `May( .+)?` means "the letters `M` then `a` then `y`, then either (1) a space and some more stuff, or (2) nothing at all".
> We'll learn more about [regular expressions]({{ '/doc/regex' | relative_url }}) like these in a few pages, but you can use this special code for <span class="layer">word</span> searches even if you don't understand it!
>
> Without the special code `( .+)?`, APLS will only look for <span class="layer">word</span>s that exactly match `May` with nothing after it.
> In the case of _May_, a search without `( .+)?` would miss several matches:
>
> {% include screengrab.html src="matches/word-May.png" %}


## One word, the whole word, and nothing but the word

In the _yinzer_ example above, you might have noticed that there were no matches for _yinz_ or _yinzers_.
This is because APLS matches the **entire** annotation---not more, not less---and <span class="layer">orthography</span> annotations are one word.
To find _yinz_, enter `yinz` into the <span class="layer">orthography</span> input box;
to find _yinzers_, enter `yinzers`.
If you want to find _yinz_ and _yinzer_ and _yinzers_ all in the same search, you need to use [regular expressions]({{ '/doc/regex' | relative_url }}).

Similarly, a common mistake that new APLS users make is to enter multiple words in a single input box.
For example, you might think that you can enter `a few` in the <span class="layer">orthography</span> input box.
If so, you will probably be surprised when this search returns 0 results (especially because _a few_ is in the first line of `CB01interview3.eaf`)!
However, there is no **single** word in any transcript whose <span class="layer">orthography</span> annotation is `a few`.

{% include screengrab.html src="search/multiple-words-one-box.png" %}

If you want to find multi-word phrases, you need to widen the search matrix, as explained in the [Searching multiple words]({{ '/doc/search-complex-patterns#searching-multiple-words' | relative_url }}) section of the [Searching complex patterns]({{ '/doc/search-complex-patterns' | relative_url }}) documentation page.

{% include linklist.html %}

[Next page: **<span class="apls-page">Search</span> page layout**]({{ '/doc/search-page-layout' | relative_url }}){: .btn .next-page }
