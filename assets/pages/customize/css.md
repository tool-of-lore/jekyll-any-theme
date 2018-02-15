---
title: Css
description: Css
permalink: customize/css/
---

# Themes

- `page.theme` or `collection.theme`
- Default to `basic_light_sans`
- Need a `/assets/css/<theme>.css`

For a new theme, duplicate one existing `assets/css/<theme>.sass`, change file name and add it in a page front matter or in scoped defaults in [`_config.yml`]({% include filters/link_to_file.html file="_config.yml" %}).

## Navigation

{% include api/get.html file="page/top.html" %}
{% include api/get.html file="page/navbar.html" %}

## Main

{% include api/get.html file="page/main.html" %}
