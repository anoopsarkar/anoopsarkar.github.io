---
layout: page
title: Software
menu: true
---

<dl>
{% for sw in site.data.software %}
    <dt>
    {% if sw.repo %}
        <a href="{{ sw.repo }}">{{ sw.name }}</a>
    {% else %}
        {{ sw.name }}
    {% endif %}
    {% if sw.demo %}
        <span class="smaller">[<a href="{{ sw.demo }}">Demo</a>]</span>
    {% endif %}
    </dt>
    <dd>
    <span class="smaller">{{ sw.about }}</span>.
    {% if sw.paper %}
        <span class="smaller">[<a href="{{ sw.paper }}">More</a>]</span>
    {% endif %}
    </dd>
{% endfor %}
</dl>

### Repositories

* [SFU natlang on GitHub](https://github.com/sfu-natlang)
* [My GitHub](https://github.com/anoopsarkar)
* [Bitbucket](https://bitbucket.org/sfu-natlang/)

