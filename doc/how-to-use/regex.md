---
title: Searching with regular expressions
permalink: /doc/regex
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 30
last_modified_date: 2025-04-18T19:54:18:z
---

# {{ page.title }}
{:.no_toc}

Layers that support the use of <span class="keyterm">regular expressions</span> are denoted by their pattern input fields having `Regular expression` text fields.

A regular expression (or 'regex') is a compact way of finding a pattern in a string of text.
In APLS, for example, searching the <span class="layer">orthography</span> layer for `do.*` will return all words that _start with_ the characters `do` (including the word _do_ itself).

Regular expressions are a feature of many programming languages, so you may have used them before.
Even seasoned regex users can use a refresher once in a while.
For new users, regex can be a little intimidating because they are so compact and can use a lot of special symbols.

If you are...

- hoping to learn regex, read the [introduction to regex](#introduction-to-regex)
- hoping to use some simple patterns (but you don't need to learn regex), read about [common regex "idioms"](#common-regex-idioms)
- just looking for a refresher on what the symbols mean, read the [cheat sheet](#regex-cheat-sheet)
- experienced with regex in other contexts, read about how regex is [different in APLS](#regex-in-apls-vs-regex-elsewhere)

{% include page_toc.html collapsible=true %}

## Regex cheat sheet

| Character | Meaning |
|-------|---------|
| Letter & numbers (`A`-`Z`, `a`-`z`, `0`-`9`) | Themselves |
| `.`  | Any single character |
| `?` | The character before `?` is optional; i.e. it can occur 0 or 1 times |
| `+`  | The character before `+` can repeat; i.e. it can occur 1 or more times |
| `*`  | The character before `*` can be optional or repeat; i.e. it can occur any number of times, including 0 |
| `()`  | Characters inside the parentheses are treated as a unit |
| `[abc]`  | Match `a` _or_ `b` _or_ `c` | 
| `[^abc]`  | Match anything other than `a`, `b`, and `c` | 
| `ab|cd`  | Match `ab` _or_ `cd` |
| `\`  | The character after `\` is **not** treated as a metacharacter; i.e., the character is treated literally |

Because of the [notation systems used by certain layers]({{ '/doc/layer-typology#notation-system' | relative_url }}), the characters in APLS that you may need to use `\` to match literally are: `+` (morpheme boundaries), `.` (short pause), `-` (long pause and syllable boundaries), `?` (question marker), `{` and `$` (DISC vowels), and `$` (used in part-of-speech tags).

{:.note .no-collapse}
> If you have a regex with an open parenthesis/bracket that hasn't been escaped with `\`, the regex will be highlighted in red and you will get an error message if you click the _Search_ button.

## Common regex idioms

These are the patterns you're most likely to need when searching APLS:

- Dot-asterisk (`.*`): Match anything or nothing
- Dot-plus (`.+`): Match one or more of any character (doesn't have to be the same character)
- Square brackets (`[]`): Match one of the characters in the brackets
- Inverted square brackets (`[^]`): Match anything other than the characters in the brackets
- Vertical pipe (`|`): Match one of the strings on either side of the pipe

### Dot-asterisk (`.*`)

Dot-asterisk `.*` can be used at the beginning, end, and/or middle of a pattern to denote "anything (or nothing at all)".
APLS searches look for [whole word matches](#regex-in-apls-vs-regex-elsewhere), so using `.*` is useful at the edge (beginning or end) of patterns when you are looking for strings that can appear in multiple words.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `do.*`  | Any word that starts with `do` | <span class="goodex">do</span> <span class="goodex">dot</span> <span class="goodex">dotted</span><br><span class="badex">dig</span> <span class="badex">ado</span> <span class="badex">boot</span>  |
| `.*king` | Any word that ends with `king` | <span class="goodex">king</span> <span class="goodex">seeking</span> <span class="goodex">asking</span><br><span class="badex">kings</span> <span class="badex">kin</span> <span class="badex">doing</span>  |
| `.*tion.*` | Any word that contains `tion` | <span class="goodex">action</span> <span class="goodex">questions</span> <span class="goodex">recreational</span><br><span class="badex">vision</span> <span class="badex">carton</span>  |
| `a.*n` | Any word that starts with `a` and ends with `n` | <span class="goodex">an</span> <span class="goodex">again</span> <span class="goodex">attention</span><br><span class="badex">in</span> <span class="badex">apple</span> <span class="badex">and</span>  |

### Dot-plus (`.+`)

Dot-plus `.+` can be used at the beginning, end, and/or middle of a pattern to denote "at least one of any character".
The important distinction between `.+` and `.*` is that `.+` requires there to be at least one character in that position, as shown with the examples below.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `do.+`  | Any word that starts with `do` except `do` | <span class="goodex">dot</span> <span class="goodex">dotted</span><br><span class="badex">do</span> <span class="badex">ado</span> |
| `.+king` | Any word that ends with `king` except `king` | <span class="goodex">seeking</span> <span class="goodex">asking</span><br> <span class="badex">king</span> <span class="badex">kings</span> <span class="badex">kin</span>  |
| `.+tion.+` | Any word that contains `tion` and has characters on both sides of `tion` | <span class="goodex">questions</span> <span class="goodex">recreational</span><br><span class="badex">action</span> <span class="badex">question</span>  |
| `a.+n` | Any word that starts with `a` and ends with `n` except `an` | <span class="goodex">again</span> <span class="goodex">attention</span><br><span class="badex">an</span> <span class="badex">in</span> <span class="badex">and</span>  |

### Square brackets (`[]`)

Square brackets `[]` can be used to match one of any of the characters within the brackets.
The characters within the brackets are a <span class="keyterm">character set</span>.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `do[tg]` | Any 3-letter word that starts with `do` and ends with `t` _or_ `g` | <span class="goodex">dot</span> <span class="goodex">dog</span><br> <span class="badex">do</span> <span class="badex">doe</span> <span class="badex">dotted</span>  |
| `[dw]on't`  | Any 4-letter word that starts with `d` _or_ `w` and ends with `on't` | <span class="goodex">don't</span> <span class="goodex">won't</span><br><span class="badex">donut</span> <span class="badex">want</span> |
| `.*[oa][td]`  | Any word that ends with `o` _or_ `a` followed by `t` _or_ `d` | <span class="goodex">cot</span> <span class="goodex">glad</span> <span class="goodex">float</span><br><span class="badex">cost</span> <span class="badex">cots</span> <span class="badex">cut</span> |

### Inverted square brackets (`[^]`)

Square brackets can be inverted with `^` to match anything _other_ than the characters in the brackets.
Inverted square brackets will still only match a single character, similar to normal square brackets.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `ca[^t]` | Any 3-letter word that starts with `ca` and does _not_ ends with `t` | <span class="goodex">can</span> <span class="goodex">cap</span><br> <span class="badex">cat</span> <span class="badex">cans</span> <span class="badex">cast</span>  |
| `b[^eu]t`  | Any 3-letter word that starts with `b` and ends with `t` that does _not_ contain `e` _or_ `u` | <span class="goodex">bot</span> <span class="goodex">bat</span> <span class="goodex">bit</span><br><span class="badex">bet</span> <span class="badex">but</span> <span class="badex">boat</span> <span class="badex">bots</span> |

### Vertical pipe (`|`)

Vertical pipes `|` can be used to specify multiple possible patterns at once.
These can be useful when you'd like to find multiple words with the same search.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `steeler|penguin` | The word `steeler` _or_ the word `penguin` | <span class="goodex">steeler</span> <span class="goodex">penguin</span> <br><span class="badex">steel</span> <span class="badex">penguins</span> <span class="badex">pirate</span>  |
| `steel.*|pen.*` | Any word that starts with `steel` _or_ `pen` | <span class="goodex">steelers</span> <span class="goodex">pencil</span> <br><span class="badex">steer</span> <span class="badex">bullpen</span> <span class="badex">pirate</span>  |
| `b(oo|ea)t` | Any word that starts with `b`, followed by `oo` _or_ `ea` and ends with `t` | <span class="goodex">boot</span> <span class="goodex">beat</span> <br><span class="badex">boat</span> <span class="badex">bet</span> <span class="badex">bit</span>  |
| `(wh|th|sh).*` | Any word that starts with `wh` _or_ `th` _or_ `sh` | <span class="goodex">what</span> <span class="goodex">though</span> <span class="goodex">short</span> <br><span class="badex">other</span> <span class="badex">slush</span>  |


## Introduction to regex

In regular expressions, letters and numbers are literal characters that match themselves -- the regex `apples` will match the literal text "apples".

What makes regular expressions more powerful than normal searches are metacharacters that have special functions.
These special functions allow regexes to match <span class="keyterm">patterns</span> that are more flexible than searches for literal words.

Metacharacters are denoted using punctuation symbols, which means that regexes can look confusing and hard to read at first. 
However, regex patterns get easier to decode once you understand the meanings of the different metacharacters.

Metacharacters can be grouped into a few categories based on their functions:
- A wildcard can match any character
  - `.` is a wildcard that will match any single character
- A quantifier controls the number of times a pattern can match
  - The most useful quantifiers are `?` (match 0 or 1 times), `+` (match 1 or more times), and `*` (match 0 or more times)
- A character set lets you specify a set of possible characters for a match
  - Characters sets are created with `[]`
- A group treats multiple characters as a unit, which lets you control the scope and order of operations in a regex
  - Groups are created with `()`
- An alternator lets you match either the pattern before or the pattern after the alternator
  - The vertical pipe `|` is the alternator symbol in regex

The most useful metacharacters for searching APLS are provided in the [Regex cheat sheet](#regex-cheat-sheet).

The table below gives some examples of how characters and metacharacters can be combined to form regex search patterns for the <span class="layer">orthography</span> layer:

| Pattern | Explanation | Examples |
|-------|---------|-------|
| `do.`  | Any three-letter word that begins with `do` | <span class="goodex">dot</span> <span class="goodex">dog</span><br><span class="badex">dig</span> <span class="badex">do</span> <span class="badex">dogs</span> |
| `pittsburgh(ese)?`  | The word `pittsburgh` must be matched but it can optionally end with `ese` | <span class="goodex">pittsburgh</span> <span class="goodex">pittsburghese</span><br><span class="badex">pittsburgher</span> <span class="badex">pitt</span> <span class="badex">pittsburgh's</span> |
| `to+`  | The letter `t` followed by one or more `o` | <span class="goodex">to</span> <span class="goodex">too</span><br><span class="badex">tot</span> <span class="badex">two</span> <span class="badex">do</span> |
| `pittsburgh.*`  | Any word that begins with `pittsburgh` | <span class="goodex">pittsburgh</span> <span class="goodex">pittsburghese</span><span class="goodex">pittsburgh's</span><span class="goodex">pittsburgher</span><br> <span class="badex">pitt</span> <span class="badex">philadelphia</span> |

{: .try-it }
> To search for every instance of "town", "downtown", and "hometown" in APLS:
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `(down|home)?town` into the orthography input field.
> 1. Click the _Search_ button.

For more examples of building regex search patterns, go to [Common regex idioms](#common-regex-idioms).


### Practicing regex in APLS

Now that you're familiar with the basics of regex, it's time for you to try searching APLS with regex patterns on your own!
You can find some practice search questions below, with solutions included as `TRY IT!`s.

- How would you find all words that (1) start with vowels _and_ (2) are at least 2 letters long?

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

- How would you find all words that either start with _q_ or end with _x_, excluding instances of _q_ and _x_ on their own?

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `q.+|.+x` into the orthography input field.
> 1. Click the _Search_ button.

## Regex in APLS vs. regex elsewhere

The most important difference between regex in APLS and regex elsewhere, is that APLS (almost) always[^segment-exception] matches patterns to the **whole** word.

[^segment-exception]: The only times that APLS does not look for matches by whole words is for the <span class="layer">segment</span> and <span class="layer">foll_segment</span> layers.

If you've used regex in other contexts, you are probably used to patterns matching with any part of a string.
For instance, the regex `the` could find matches in the strings `the`, `these`, or `other`.
However, `the` will only ever match `the` in APLS.
To search for patterns that occur within words, you have to denote the word context with wildcard metacharacters.
For example, searching APLS with `.*the.*` _will_ find matches for `the`, `these`, and `other`.

By extension, this also means that the anchors `^` and `$` aren't necessary in APLS because patterns always match entire annotations. 
The table below shows the APLS equivalent of standard regex anchor expressions, along with example matches.

| Standard regex | APLS equivalent | Examples |
|----------------|-----------------|----------|
| `the` | `.*the.*` | <span class="goodex">the</span> <span class="goodex">these</span> <span class="goodex">other</span> |
| `^the` | `the.*` | <span class="goodex">the</span> <span class="goodex">these</span> <span class="goodex">theater</span> |
| `the$` | `.*the` | <span class="goodex">the</span> <span class="goodex">soothe</span> <span class="goodex">bathe</span> |
| `^the$` | `the` | <span class="goodex">the</span> |

A separate but related topic is anchoring a search match to a larger annotation, such as finding words at the start of a turn. 
This is covered on the [Anchoring searches]({{ '/doc/anchoring-searches' | relative_url }}) page.


## Regex tips and tricks

Here we've collected some tips and tricks for using regex with APLS that are broadly helpful for users at any level of regex proficiency!

### Checking your search matches

When you perform a search and the [search results page]({{ '/doc/export-data#search-results-page' | relative_url }}) contains a handful of matches, it can be easy to manually check how many unique items your search matched.
APLS contains over 400,000 word tokens, so often a search will result in a lot more than a handful of matches!

The ![]({{ '/assets/img/book.svg' | relative_url }}){: style="height:1rem;"} _Dictionary_ export option on the [search results page]({{ '/doc/export-data#search-results-page' | relative_url }}) lets you download a `.txt` file of every unique individual item that your search matched.
This can be helpful for quickly checking that the matches you got line up with what you were expecting!

{: .try-it }
> 1. Go to the [_search_ page](https://apls.pitt.edu/labbcat/search).
> 1. Enter `don.*` into the orthography input field.
> 1. Click the _Search_ button.
> 1. On the search results page generated by your search, click the ![]({{ '/assets/img/book.svg' | relative_url }}){: style="height:1rem;"} _Dictionary_ button.
> 1. Save and view the file to see what words in APLS match the `don.*` orthography search pattern.

### Other resources for learning about regex

This page is only meant to be an introduction to regular expressions (and the [ways that regex is different in APLS](#regex-in-APLS-vs-regex-elsewhere)).
There are lots of resources out there for learning and practicing regex if you would like more than this page can provide!

A few places that we would recommend are:
- [regexone.com](https://www.regexone.com/) or [regexlearn.com](https://regexlearn.com/) for learning regex by practicing with simple, interactive exercises.
- [regular-expressions.info tutorial](https://www.regular-expressions.info/tutorial.html) for more details about basic regex concepts.
  - The regular-expressions website also has resources for learning about more advanced regex concepts!
- [regex crosswords](https://regexcrossword.com/) for practicing regex skills with crossword-like puzzles.
- [regex101.com](https://regex101.com/) for testing out different regex patterns.
