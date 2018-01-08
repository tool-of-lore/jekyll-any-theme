---
title: Dark
description: Jekyll any theme – Customizable Bootstrap 4
permalink: /themes/dark/
theme: dark
---

# {{page.title}}

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<!--column-->

# Darth Fener

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

{% include components/card.html title="Card title" header="Card header" text="Card text" footer="Card footer" %}

<!--row-->

## Components

<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>

<button type="button" class="btn btn-link">Link</button>

# Tables

Usage:

```md
| Header | Value |
|:------ |:----- |
| Alpha  | `45`  |
```

Render:

| Header | Value |
|:------ |:----- |
| Alpha  | `45`  |

# Alerts

{% assign alert_colors = site.emptyArray
  | push: "primary"
  | push: "secondary"
  | push: "success"
  | push: "danger"
  | push: "warning"
  | push: "info"
  | push: "light"
  | push: "dark" %}
{%- for alert_color in alert_colors -%}
  {%- assign md = "Alert `.alert-" | append: alert_color | append: "` with [link](#)" -%}
  {%- include components/alert.html markdown=md type=alert_color -%}
{%- endfor -%}

# Blockquote

Usage:

```liquid
{% raw %}{% include components/blockquote.html text="Text in markdown" author="Author name" source="Source" %}{% endraw %}
```

HTML:

```html
<blockquote class="blockquote">
  Text markdownified
  <footer>Author name <cite title="Source">Source</cite></footer>
</blockquote>
```

Render:

{% include components/blockquote.html text="Lo spettro dello squillo di una tromba" author="Philip Josè Farmer" source="Fabbricante di universi" %}
