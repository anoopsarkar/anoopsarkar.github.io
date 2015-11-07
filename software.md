---
layout: page
title: Software
menu: true
---

<ul>
{% for sw in site.data.software %}
    <li>
    {% if sw.url %}
        <a href="{{ sw.url }}">{{ sw.name }}</a>: {{ sw.about }}.
    {% elsif sw.repo %}
        <a href="{{ sw.repo }}">{{ sw.name }}</a>: {{ sw.about }}.
    {% else %}
        {{ sw.name }}: {{ sw.about }}.
    {% endif %}
    {% if sw.repo %}
        <a href="{{ sw.repo }}" class="button">Source</a>
    {% endif %}
    {% if sw.paper %}
        <a href="{{ sw.paper }}" class="button">More</a>
    {% endif %}
    </li>
{% endfor %}
</ul>

### Repositories

* [SFU natlang on GitHub](https://github.com/sfu-natlang)
* [My GitHub](https://github.com/anoopsarkar)
* [Bitbucket](https://bitbucket.org/sfu-natlang/)

