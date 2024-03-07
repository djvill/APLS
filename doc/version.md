---
title: Version history
layout: default
permalink: /doc/version-history
parent: About APLS
nav_order: 2
last_modified_date: 2024-03-07T10:51:49-05:00
---

{% comment %}
Don't edit info on individual versions here.
Instead, add/edit versions in `../_versions/`
{% endcomment %}

# {{ page.title }}
{:.no_toc}

{% assign curr_ver = site.versions | last %}
APLS's current pre-release is **version {{ curr_ver.version }}** (dated {{ curr_ver.date | date: "%e %b %Y" }}).
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
		{% for version in site.versions %}
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
{% endfor %}
