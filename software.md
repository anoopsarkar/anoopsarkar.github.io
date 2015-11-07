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
    {% else %}
        {{ sw.name }}: {{ sw.about }}.
    {% endif %}
    {% if sw.repo %}
        [<a href="{{ sw.repo }}">Source</a>]
    {% endif %}
    </li>
{% endfor %}
</ul>

### Repositories

* [SFU natlang on GitHub](https://github.com/sfu-natlang)
* [My GitHub](https://github.com/anoopsarkar)
* [Bitbucket](https://bitbucket.org/sfu-natlang/)

