---
title: Searching with regular expressions
permalink: /doc/regex
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 30
last_modified_date: 2025-04-12T17:08:38:z
---

# {{ page.title }}
{:.no_toc}

Layers that support the use of <span class="keyterm">regular expressions</span> are denoted by their pattern input fields having `Regular expression` text fields.
A regular expression (or 'regex') is a way of finding a pattern in a string of text.

This page gives an introduction of regex searches and provides some examples of helpful ways that regex can be used with the APLS _search_ page.

{% include page_toc.html collapsible=true %}

## Introduction to regex

Layers that support the use of <span class="keyterm">regular expressions</span> are denoted by their pattern input fields having `Regular expression` text fields.
A regular expression (or 'regex') is a way of finding a pattern in a string of text.

In regular expressions, letters and numbers are literal characters that match themselves -- the regex `apples` will match the literal text "apples".

What makes regular expressions more powerful than normal searches are metacharacters that have special functions.

{:.note}
> If you're familiar with regular expressions, then you may know that `^` and `$` can be used to anchor matches to the start and end of the pattern. 
> These aren't necessary in APLS because regular expressions always match the entire annotation. 
> This is why if you want words that start with a string, you need to use .* at the end. 
>
> A separate but related topic is anchoring a search match to a larger annotation, such as finding words at the start of a turn. 
> This is covered on the [Anchoring searches]({{ '/doc/anchoring-searches' | relative_url }}) page.

Some useful metacharacters, and their meanings, for searching APLS are:

| Metacharacter | Meaning |
|-------|---------|
| `.`  | Any single character |
| `?` | The character before `?` is optional; i.e. it can occur 0 or 1 times |
| `+`  | The character before `+` can repeat; i.e. it can occur 1 or more times |
| `*`  | The character before `*` can be optional or repeat; i.e. it can occur any number of times, including 0 |
| `()`  | Characters inside the parentheses are treated as a unit |
| `[]`  | Any characters inside the brackets are possible matches |
| `|`  | The search can match the pattern on either side of the vertical bar |
| `\`  | The character after `\` is **not** treated as a metacharacter; i.e., the character is treated literally |

{:.note}
> Because of the [notation systems used by certain layers]({{ '/doc/layer-typology#notation-system' | relative_url }}), the characters in APLS that you may need to use `\` to match literally are: `+` (morpheme boundaries), `.` (short pause), `-` (long pause and syllable boundaries), `?` (question marker), `{` and `$` (DISC vowels), and `$` (used in part-of-speech tags).

The table below gives some examples of how characters and metacharacters can be combined to form regex search patterns for the <span class="layer">orthography</span> layer:

| Pattern | What it will match |
|-------|---------|
| `do.`  | Any three-letter word that begins with `do` |
| `pittsburgh(ese)?`  | The word `pittsburgh` or the word `pittsburghese` |
| `pittsburgh.+`  | Any word that begins with `pittsburgh`, **not** including the word `pittsburgh` |
| `pittsburgh.*`  | Any word that begins with `pittsburgh`, including the word `pittsburgh` |
| `[dw]on't`  | The word `don't` or the word `won't` |
| `steeler|penguin`  | The word `steeler` or the word `penguin` |

{: .try-it }
> To search for every instance of "town", "downtown", and "hometown":
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `(down|home)?town` into the orthography input field.
> 1. Click the _Search_ button.

## Practicing regex in APLS

<!-- 
I have a note from the recent meeting that says "Flesh out regex page" but I can't remember how it was supposed to be fleshed out.
This is the best I was able to come up with
-->

Now that you're familiar with some of the most useful regex characters, it's time for you to try searching APLS with regex patterns on your own!
You can find some practice search questions below, with solutions included as `TRY IT!`s.

- How would you find all words that start with vowels that are at least 2 letters long?

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `[aeiou].+` into the orthography input field.
> 1. Click the _Search_ button.

- How would you find all words that end with either _-ing_ or _-ize_?

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `.+i(ng|ze)` into the orthography input field.
> 1. Click the _Search_ button.

- How would you find all words that have three consecutive orthographic vowels?

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `.*[aeiou][aeiou][aeiou].*` into the orthography input field.
> 1. Click the _Search_ button.

- How would you find all words that start with _q_ or end with _x_, excluding instances of _q_ and _x_ on their own?

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `q.+|.+x` into the orthography input field.
> 1. Click the _Search_ button.
