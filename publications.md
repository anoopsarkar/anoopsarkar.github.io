---
layout: page
title: Publications
menu: true
---

{% assign endyear = {{ site.time | date: '%Y' }} | plus: 0 %}
{% for year in (1990..2015) reversed %}
### {{ year }}
    {% for item in site.data.publications.entries %}
        {% assign yearint = item[1].year | plus: 0 %}
        {% if yearint == year %}
* {{ item[1].year }} {{ item[1].title }}
        {% endif %}
    {% endfor %}
{% endfor %}


