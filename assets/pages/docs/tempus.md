---
title: Tempus
description: Tempus fugit
permalink: components/tempus/
---

# Tempus

<!--row-->

### Options

**Time span**

- *`from`: date YYYY-MM-DD
- *`to`: date YYYY-MM-DD
- *`days`: number
- *`past`: boolean (true), show past days

**Filter**

- *`event`: event.name
- *`calendar`: calendar.name

**View**

- *`empty`: boolean (false), show empty days

<!--column-->

#### Now

```liquid
{% raw %}{% include tempus/now.html past=false days="6" %}{% endraw %}
```

{% include tempus/now.html past=false days="6" %}

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
