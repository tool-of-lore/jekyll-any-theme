---
title: Tempus
description: Tempus fugit
permalink: components/tempus/
---

# Tempus

<!--row-->

**Options**

- *`now`: boolean (false)
- *`from`: date YYYY-MM-DD
- *`to`: date YYYY-MM-DD
- *`event`: event.name
- *`calendar`: calendar.name
- `month`: number
- *`complete`: boolean (false), show empty days

<!--column-->

#### Now

```liquid
{% raw %}{% include tempus/now.html %}{% endraw %}
```

{% include tempus/now.html %}

<!--row-->

#### Calendar

<!--row-->

```liquid
{% raw %}{% include tempus/calendar.html calendar="Festivity" %}{% endraw %}
```

{% include tempus/calendar.html calendar="Festivity" %}

<!--column-->

```liquid
{% raw %}{% include tempus/calendar.html calendar="Monnezza" %}{% endraw %}
```

{% include tempus/calendar.html calendar="Monnezza" %}
