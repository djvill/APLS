---
title: Version history
permalink: /doc/version-history
parent: About APLS
nav_order: 30
last_modified_date: 2025-05-06T14:03:58-04:00
---

{% comment %}
Don't edit info on individual versions here.
Instead, add/edit versions in `../_versions/`
{% endcomment %}

# {{ page.title }}
{:.no_toc}

{% assign curr_ver = site.versions | last %}
APLS's current **preview version** is **{{ curr_ver.version }}** (dated {{ curr_ver.date | date: "%e %b %Y" }}).
This version of APLS uses LaBB-CAT version {{ curr_ver.labbcat_version }}.

<table id="version-summary">
	<thead>
		<tr>
			<th>APLS version</th>
			<th>Version date</th>
			<th>LaBB-CAT version</th>
		</tr>
	</thead>
	<tbody>
		{% for version in site.versions reversed %}
			<tr>
				<td><a href='#{{ version.version | replace: ".", "_" }}'>{{ version.version }}</a></td>
				<td>{{ version.date | date: "%e %b %Y" }}</td>
				<td>{{ version.labbcat_version }}</td>
			</tr>
		{% endfor %}
	</tbody>
</table>

## Detailed version history
{:.no_toc}

{% for version in site.versions reversed %}
{% assign uri = version.version | replace: ".", "_" %}

<h3 id="{{ uri }}" class="no_toc">Version {{ version.version }}</h3>

- **Date:** {{ version.date | date: "%e %b %Y" }}
- **LaBB-CAT version:** {{ version.labbcat_version }}

{{ version.content }}

{% if version.stats %}
#### Corpus status {#status-{{version.version}}}
{:.no_toc}

{% unless forloop.last %}
{% assign prev_vers_idx = forloop.rindex | minus: 2 %}
{% assign prev_vers = site.versions[prev_vers_idx] %}
{% if version.stats == prev_vers.stats %}
Unchanged from version [{{prev_vers.version}}](#status-{{prev_vers.version}})
{% else %}
{%- if version.stats.transcript_series %}
- **Transcript series** ({{version.stats.transcript_series.size}}, all in the `pgh0307` collection): {{ version.stats.transcript_series | join: ", "}}
{%- endif %}
{%- if version.stats.transcripts %}
- **Transcripts**: {{version.stats.transcripts}}
{%- endif %}
{%- if version.stats.duration %}
- **Transcript duration** (H:M:S): {{version.stats.duration}}
{%- endif %}
{%- if version.stats.word_tokens and version.stats.word_types %}
- **Word tokens/types**: <span class="delimited">{{version.stats.word_tokens}}</span>/<span class="delimited">{{version.stats.word_types}}</span>
{%- endif %}
{%- if version.stats.segments %}
- **Aligned segments**: <span class="delimited">{{version.stats.segments}}</span>
{%- endif %}
{%- if version.stats.segments %}
- **Annotation layers** ({{version.stats.layers.size}}): {% for layer in version.stats.layers %}<span class="layer">{{layer}}</span>{% if forloop.index < forloop.length %}, {% endif %}{% endfor %}
{%- endif %}

{% endif %}
{% endunless %}

{% endif %}
{% endfor %}
