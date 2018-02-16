---
title: Home
description: Jekyll any theme – Customizable Bootstrap 4
permalink: /
---

### Just do it

Initially all amanuensis

- calendar
- tables
- maps
- forms
- commits

{% include tempus/next.html calendar="Monnezza" days="6" past=false %}

```liquid
{% raw %}{% include tempus/next.html calendar="Monnezza" days="6" past=false %}{% endraw %}
```

{% for p in site.html_pages %}
1. [{{ p.title }}]({{ p.url | absolute_url }}){% endfor %}
{% for c in site.collections %}{%- for cp in c.docs -%}
1. [{{ cp.title }}]({{ cp.url | absolute_url }}){% endfor %}
{%- endfor -%}
