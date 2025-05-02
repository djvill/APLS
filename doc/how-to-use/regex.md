---
title: Searching with regular expressions
contributors: [Dan Villarreal, Jack Rechsteiner]
permalink: /doc/regex
parent: Searching the corpus
grand_parent: How to use APLS
nav_order: 30
last_modified_date: 2025-05-01T22:48:18-04:00
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
| Letters & numbers (`A`-`Z`, `a`-`z`, `0`-`9`) | Themselves |
| Most special characters used in [layer notation systems]({{ '/doc/layer-typology#notation-system' | relative_url }})  | Themselves |
| `.`  | Any single character |
| `?` | The character before `?` is optional; i.e. it can occur 0 or 1 times |
| `+`  | The character before `+` can repeat; i.e. it can occur 1 or more times |
| `*`  | The character before `*` can be optional or repeat; i.e. it can occur any number of times, including 0 |
| `()`  | Characters inside the parentheses are treated as a unit |
| `[abc]`  | Match `a` _or_ `b` _or_ `c` | 
| `[^abc]`  | Match anything other than `a`, `b`, and `c` | 
| `ab|cd`  | Match `ab` _or_ `cd` |
| `\`  | The character after `\` is **not** treated as a metacharacter; i.e., the character is treated literally |

Because of the [notation systems used by certain layers]({{ '/doc/layer-typology#notation-system' | relative_url }}), the characters in APLS that you may need to use `\` to match literally are: 

| Layer(s) | Character | Meaning |
|----------|-----------|---------|
| <span class="layer">morphemes</span> | `+` | Morpheme boundary |
| <span class="layer">word</span> | `.` | Short pause |
| <span class="layer">word</span> | `-` | Long pause |
| <span class="layer">word</span> | `?` | Question mark |
| <span class="layer">foll_segment</span> | `.` | Following pause |
| <span class="layer">pronounce</span> | `-` | Syllable boundary |
| <span class="layer">segment</span>, <span class="layer">foll_segment</span>, <span class="layer">syllables</span>, <span class="layer">phonemes</span>, <span class="layer">dictionary_phonemes</span>, <span class="layer">pronounce</span> | `{` | DISC symbol for the IPA /æ/ vowel |
| <span class="layer">segment</span>, <span class="layer">foll_segment</span>, <span class="layer">syllables</span>, <span class="layer">phonemes</span>, <span class="layer">dictionary_phonemes</span>, <span class="layer">pronounce</span> | `$` | DISC symbol for the IPA /ɔ/ vowel |
| <span class="layer">part_of_speech</span> | `$` | Used in the part-of-speech tags `$` (currency symbols), `PRP$` (possessive pronoun), `WP$` (possessive wh- pronoun) |

{% comment %}TODO build these dynamically from _layers{% endcomment %}

{:.note .no-collapse}
> Entering an invalid regex will make the text turn red.
> If you hover over the red text, a tooltip will pop up with a brief explanation of why the regex is invalid.
> In addition, if you click the _Search_ button with an invalid regex, the search will return an error message.

## Common regex idioms

These are the patterns you're most likely to need when searching APLS:

- Dot-asterisk (`.*`): Match anything or nothing
- Dot-plus (`.+`): Match one or more of any character (doesn't have to be the same character)
- Square brackets (`[]`): Match one of the characters in the brackets
- Square brackets with a caret (`[^]`): Match anything _other than_ the characters in the brackets
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
| `[dw]on't`  | Any 5-character word that starts with `d` _or_ `w` and ends with `on't` | <span class="goodex">don't</span> <span class="goodex">won't</span><br><span class="badex">donut</span> <span class="badex">want</span> |
| `.*[oau][td]`  | Any word whose last two characters are `o` _or_ `a` _or_ `u` followed by `t` _or_ `d` | <span class="goodex">cut</span> <span class="goodex">glad</span> <span class="goodex">float</span><br><span class="badex">cost</span> <span class="badex">cots</span> <span class="badex">cut</span> |

Importantly, square brackets always match a _single_ character:

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `r[oau]t` | Any 3-letter word that starts with `r`, then `o` _or_ `a` _or_ `u`, and ends with `t` | <span class="goodex">rot</span> <span class="goodex">rat</span><br> <span class="goodex">rut</span><br><span class="badex">rout</span> <span class="badex">root</span>  |

### Square brackets with a caret (`[^]`)

Square brackets can be inverted with `^` to match anything _other than_ the characters in the brackets.
Inverted square brackets will still only match a single character, similar to normal square brackets.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `do[^t]` | Any 3-letter word that starts with `do` and does _not_ end with `t` | <span class="goodex">doe</span> <span class="goodex">don</span><br> <span class="badex">do</span> <span class="badex">dot</span> <span class="badex">dotted</span>  |
| `b[^eu]t`  | Any 3-letter word that starts with `b`, then any character _other than_ `e` or `u`, and ends with `t` | <span class="goodex">bot</span> <span class="goodex">bat</span> <span class="goodex">bit</span><br><span class="badex">bet</span> <span class="badex">but</span> <span class="badex">boat</span> <span class="badex">bots</span> |

### Vertical pipe (`|`)

Vertical pipes `|` can be used to specify multiple possible patterns at once.
These can be useful when you'd like to find multiple words with the same search.

| Pattern | Explanation | Examples |
|---------|-------------|----------|
| `steeler|penguin` | The word `steeler` _or_ the word `penguin` | <span class="goodex">steeler</span> <span class="goodex">penguin</span> <br><span class="badex">steel</span> <span class="badex">penguins</span> <span class="badex">pirate</span>  |
| `steel.*|pen.*` | Any word that starts with `steel` _or_ `pen` | <span class="goodex">steelers</span> <span class="goodex">pencil</span> <br><span class="badex">steer</span> <span class="badex">bullpen</span> <span class="badex">pirate</span>  |
| `b(oo|ea|u)t` | Any word that starts with `b`, then `oo` _or_ `ea` _or_ `u`, and ends with `t` | <span class="goodex">boot</span> <span class="goodex">beat</span> <span class="goodex">but</span> <br><span class="badex">boat</span> <span class="badex">bet</span> <span class="badex">bit</span>  |
| `(wh|th|sh).*` | Any word that starts with `wh` _or_ `th` _or_ `sh` | <span class="goodex">what</span> <span class="goodex">though</span> <span class="goodex">short</span> <br><span class="badex">other</span> <span class="badex">slush</span>  |


## Introduction to regex

{% comment %}In the future, I might want to make this more scaffolded with more subsections and try-its.{% endcomment %}

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

APLS's search regex syntax is very similar to standard "flavors" of regex in high-level programming languages (e.g., Python, R, JavaScript), with some important differences.


### Search: Regex match whole annotations, not parts

Unlike regex elsewhere, APLS's search matches patterns to **whole** annotations, whether those are words, part-of-speech tags, segments, etc.

If you've used regex in other contexts, you are probably used to patterns matching any part of a string.
For example, in Python, the regex `the` matches the strings `the`, `these`, and `other`.
However, `the` will only ever match `the` in APLS.
To search for patterns that occur within annotations, use [`.*`](#dot-asterisk-) at the beginning and/or end of the regex.
For example, searching APLS with `.*the.*` _will_ find matches for `the`, `these`, and `other`.
(This also means that the anchors `^` and `$` aren't necessary because patterns always match entire annotations.)
The table below shows the APLS equivalent of standard regex anchor expressions, along with example matches.

| Standard regex | How it matches in APLS | Translated for APLS | How it matches in APLS |
|----------------|-----------------|----------|
| `the` | <span class="goodex">the</span> <span class="badex">these</span> <span class="badex">other</span> | `.*the.*` | <span class="goodex">the</span> <span class="goodex">these</span> <span class="goodex">other</span> |
| `^the` | <span class="goodex">the</span> <span class="badex">these</span> <span class="badex">theater</span> | `the.*` | <span class="goodex">the</span> <span class="goodex">these</span> <span class="goodex">theater</span> |
| `the$` | <span class="goodex">the</span> <span class="badex">soothe</span> <span class="badex">bathe</span> |  `.*the` | <span class="goodex">the</span> <span class="goodex">soothe</span> <span class="goodex">bathe</span> |
| `^the$` | <span class="goodex">the</span> | `the` | <span class="goodex">the</span> |

{: .note }
> In the context of regular expressions beyond APLS, "anchors" are the metacharacters `^` and `$`.
> In APLS searches, "anchoring" refers to anchoring a search match to a larger annotation, such as finding words at the start of a turn.
> This is covered on the [Anchoring searches]({{ '/doc/anchoring-searches' | relative_url }}) page.


### _participants_ and _transcripts_ pages: Regex match parts

When [browsing participants]({{ '/doc/browsing-participants' | relative_url }}) or [transcripts]({{ '/doc/browsing-transcripts' | relative_url }}), you can specify filters to narrow down the list of matches.
Some of these filters accept regex, like the <span class="layer">participant</span> or <span class="layer">transcript</span> name.
Unlike search regex, these regex _do_ match parts of the label (no need for `.*` at the beginning and/or end of the regex).
For example, on the _participants_ page, entering `1` in the _Participant_ box will match participants with `1` anywhere in their speaker code.
This also means that `^` and `$`, which anchor patterns to the start and end (respectively) of the match, _do_ work in these filters
For example, on the _participants_ page, entering `1$` in the _Participant_ box will match participants whose speaker codes _end with_ `1`.

{% comment %}Regex are used in one other place in the corpus, the Process with Praat page, where they match participant attribute labels for overriding default settings (e.g., change the formant ceiling if participant_gender matches `M(ale)?`). That one is a whole-annotation match, like search, and uses java.util.regex.{% endcomment %}


### Regex use POSIX Extended Regular Expressions

APLS [implements regex](https://github.com/nzilbb/labbcat-server/blob/main/server/src/main/java/nzilbb/labbcat/server/db/OneQuerySearch.java) in MySQL (i.e., with the MySQL `REGEXP` operator), which uses [POSIX Extended Regular Expressions](https://www.regular-expressions.info/posix.html).
This means that, compared to [PCRE](https://www.regular-expressions.info/pcre.html) regular expressions that are currently standard in high-level programming languages, features like [backreferences](https://www.regular-expressions.info/backref.html) and [lookarounds](https://www.regular-expressions.info/lookaround.html) are not supported.

{% comment %}Technically, _participants_ and _transcripts_ use java.util.regex, so they do support backreferences (e.g., on _transcripts_, `CB(.).+\1` will match CB10interview1.eaf, CB10reading1.eaf, CB17interview1.eaf, and CB17reading1.eaf). But that's unlikely to matter for end-users.{% endcomment %}

{: .under-the-hood }
> On the _search_ page, entering an invalid regex pattern will make the text turn red.
> Hovering over the red text will make a tooltip appear that gives a brief explanation of why the regex is invalid.
> This error-checking is powered not by MySQL's regex engine but by JavaScript's `new Regexp()` with the `"u"` (Unicode) flag.
> The error messages are mostly self-explanatory, but you can look them up [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Errors) if needed.


## Regex tips and tricks

Here we've collected some tips and tricks for using regex with APLS that are broadly helpful for users at any level of regex proficiency!

### Checking your search matches

When you perform a search and the [search results page]({{ '/doc/export-data#search-results-page' | relative_url }}) contains a handful of matches, it can be easy to manually check how many unique items your search matched.
APLS contains over 400,000 word tokens, so often a search will result in a lot more than a handful of matches!
Even if you export your search results as a `.csv`, it can be difficult to identify all the unique item matches if one or two items are much more frequent than the rest.

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
