---
title: Tempus
description: Tempus fugit
permalink: components/tempus/
---

# Tempus

- Events
- Next
- Calendars: [Middle-earth_calendar](https://en.wikipedia.org/wiki/Middle-earth_calendar)

### Options

**Time span**

- `from`: date YYYY-MM-DD
- `to`: date YYYY-MM-DD
- `days`: number
- `past`: boolean (true), show past days

**Filter**

- `event`: event.name
- `calendar`: calendar.name

**View**

- `format`: *string* default `%B %-d %A`, refer to [link](http://alanwsmith.com/jekyll-liquid-date-formatting-examples)
- `empty`: *boolean* default `false`, show empty days

<!--row-->

### Next

```liquid
{% raw %}{% include tempus/next.html past=false days="6" %}{% endraw %}
```

{% include tempus/next.html past=false days="6" %}

<!--column-->

### Events

```liquid
{% raw %}{% include tempus/events.html calendar="Festivity" from="2018-01-01" %}{% endraw %}
```

{% include tempus/events.html calendar="Festivity" from="2018-01-01" %}

<!--row-->

```liquid
{% raw %}{% include tempus/events.html calendar="Monnezza" to="2018-08-01" %}{% endraw %}
```

{% include tempus/events.html calendar="Monnezza" from="2018-01-01" to="2018-01-31" format="%A, %B %-d, %Y" %}
