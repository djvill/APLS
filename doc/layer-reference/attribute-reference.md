---
title: Attribute reference
permalink: /doc/attribute-reference
parent: Layer reference
nav_order: 50
last_modified_date: 2025-02-18T12:16:13-05:00
---

# {{ page.title }}
{:.no_toc}

<span class="keyterm">Attributes</span> are metadata about individual <span class="keyterm">transcripts</span> or <span class="keyterm">participants</span> in APLS, such as when the interview was recorded or the participant's gender.
You can use attributes as filters when browsing [transcripts]({{ '/doc/browse-transcripts' | relative_url }})/[participants]({{ '/doc/browse-participants' | relative_url }}) or [searching the corpus]({{ '/doc/search' | relative_url }}), you can view a transcript's attributes on its [transcript page]({{ '/doc/view-transcript#attributes' | relative_url }}), and you can export attributes alongside [search matches]({{ '/doc/search' | relative_url }}).
([As a reminder]({{ '/doc/getting-started#special-formatting' | relative_url }}), text formatted with a dotted underline, like <span class="participant-attr">gender</span>, refers to an attribute or layer.)

Attributes aren't nearly as complicated as <span class="keyterm">layers</span>, so all the info you need on attributes is on this page.

{% include page_toc.html collapsible=true open=true %}


## Attributes at a glance

<details>
  <summary class="text-delta">Show table</summary>
  {% include attribute-props.html attributes=site.attributes %}
</details>

## Attribute typology

### Scope

Attributes can have one of three scopes:

- Transcript
- Participant
- <span class="main_participant-attr">main_participant</span>

For example, <span class="transcript-attr">recording_date</span> is a transcript attribute and <span class="participant-attr">occupation</span> is a participant attribute.
<span class="main_participant-attr">main_participant</span> is unique; 
it identifies the primary participant in a transcript, so it's a property of _both_ the participant _and_ the transcript.


### Display title

Each attribute has a longer display title.
Display titles show up on a transcript's or participant's attribute page (or the _transcript attributes_ dropdown on a [transcript page]({{ '/doc/view-transcript#attributes' | relative_url }})) in the left-hand column.
If the attribute is [filterable](#filterability), the display title shows up in the column headers on the _transcripts_ or _participants_ page (see [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}), [Browsing participants]({{ '/doc/browse-participants' | relative_url }})).
For example, the transcript attribute <span class="transcript-attr">duration</span> shows up on the _transcripts_ page as `Duration (sec)`.
If you hover over an attribute's display title in APLS, you can see the attribute's name and short description.


### Export name

For most attributes, when you export attributes to a CSV file, either on their own or in search matches, their column names will have `transcript_` or `participant_` added as a prefix.
For example, <span class="participant-attr">education</span> gets exported as `participant_education`, while <span class="transcript-attr">corpus</span> just gets exported as `corpus`.
This is the attribute's <span class="keyterm">export name</span>.

{: .note }
> Export names are helpful given that some attribute names are shared between scopes: transcript <span class="transcript-attr">type</span> vs. participant <span class="participant-attr">type</span>, transcript <span class="transcript-attr">neighborhood</span> vs. participant <span class="participant-attr">neighborhood</span>.

{: .under-the-hood }
> Five attributes (<span class="transcript-attr">corpus</span>, <span class="transcript-attr">episode</span>, <span class="transcript-attr">transcript</span>, <span class="participant-attr">participant</span>, and <span class="main_participant-attr">main_participant</span>) don't have a prefix for their export name.
> These all have something in common: APLS actually stores them internally as layers, not attributes!
> Despite this, we think it makes better sense to think of them as "attributes" because of how users interact with them.
> Unlike most layers, they can't be directly viewed in a transcript or searched;
> when exporting a formatted transcript or search results, they also show up in the same column as transcript/participant attributes.


### Filterability

Some attributes are <span class="keyterm">filterable</span>: they're in columns on the _transcripts_ or _participants_ page that can be used to filter by that attribute (see [Browsing transcripts]({{ '/doc/browse-transcripts' | relative_url }}), [Browsing participants]({{ '/doc/browse-participants' | relative_url }})).
Other attributes are left off the _transcripts_ or _participants_ page to save room on the page;
those attributes are viewable on a transcript's or participant's attribute page.
(Some attributes aren't viewable on any attribute page: <span class="transcript-attr">corpus</span>, <span class="transcript-attr">episode</span>, <span class="transcript-attr">transcript</span>, and <span class="main_participant-attr">main_participant</span>.)

{: .note }
> <span class="transcript-attr">episode</span> is a transcript attribute, but it is filterable on the _participants_ page.


### Multiple values

Most attributes have a single value per transcript/participant (e.g., each participant has just one <span class="participant-attr">year_of_birth</span>).
Two attributes can take on multiple values: participant <span class="participant-attr">ethnicities</span> and transcript <span class="transcript-attr">transcription_ai_tools</span>.
These are similar to layers that allow <span class="keyterm">vertical peers</span>.

<!-- https://apls.pitt.edu/labbcat/participantsExport: Values are all in the same cell, separated by newlines. /assets/screengrab/attributes-multiselect-export.png -->
<!-- Search matches: export_includeCounts just like with horizontal/vertical peers  -->


### Option codes and descriptions

Some attributes have <span class="keyterm">options</span>: a pre-defined set of possible values.
For example, each participant represents one of four Pittsburgh neighborhoods, so <span class="participant-attr">neighborhood</span> has options;
but each participant's relationship to other APLS participants is more open-ended, so <span class="participant-attr">relationships</span> doesn't have pre-defined options.
In some cases, these options are <span class="keyterm">option codes</span> that are abbreviated and/or need further explanation, so these option codes have <span class="keyterm">option descriptions</span>.
For example, the <span class="participant-attr">neighborhood</span> `CB` is short for Cranberry Township.

On the _participants_ page, the `Neighborhood`, `Education`, and `Speaker type` columns all have option codes;
if you hover over an option code, a tooltip will pop up with the option description.
On a transcript's or participant's attribute page, attributes with option codes and descriptions are displayed as `<code> (<description>)` in the right-hand column.
If you export attributes to CSV (either on their own or in search matches), the file will contain the option codes, not the option descriptions.


## Transcript attributes

{% assign transcript_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'transcript'" %}

{% for attrib in transcript_attr %}

### <span class="transcript-attr">{{ attrib.synced.attribute }}</span>

_{{ attrib.synced.short_description }}_
{: .text-gamma .fw-600 }

{% include attribute-props.html attributes=attrib excl_name=true excl_scope=true excl_descrip=true %}

{{ attrib.content }}

{% endfor %}


## Participant attributes

{% assign participant_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'participant'" %}

{% for attrib in participant_attr %}

### <span class="participant-attr">{{ attrib.synced.attribute }}</span>

_{{ attrib.synced.short_description }}_
{: .text-gamma .fw-600 }

{% include attribute-props.html attributes=attrib excl_name=true excl_scope=true excl_descrip=true %}

{{ attrib.content }}

{% endfor %}


## <span class="main_participant-attr">main_participant</span>

As mentioned [above](#scope), <span class="main_participant-attr">main_participant</span> gets its own category because, unlike all other attributes, it's a property of _both_ the participant _and_ the transcript.

{% assign main_participant_attr = site.attributes | where_exp: "item", "item.synced.attrib_type == 'main_participant'" %}

{% for attrib in main_participant_attr %}

_{{ attrib.synced.short_description }}_
{: .text-gamma .fw-600 }

{% include attribute-props.html attributes=attrib excl_name=true excl_scope=true excl_descrip=true %}

{{ attrib.content }}

{% endfor %}

