---
layout: default
title: Home
---

* [Professor]({{ site.baseurl }}professor)
* [School of Computing Science](http://www.cs.sfu.ca/)
* [Simon Fraser University](http://www.sfu.ca)
* [&raquo; Contact details ...]({{ site.baseurl }}contact)
{: .contact}

### Biography

### Recent News

<ul class="posts">
  {% for post in site.posts limit:2 %}
    {% if post.draft == null %}
      <li>
        <a href="{{ post.url }}">
          <div>
            <span class="title">{{ post.title }}</span>
            <span class="date">{{ post.date | date_to_string }}</span>
          </div>
        </a>
      </li>
    {% endif %}
  {% endfor %}
  <li style="list-style: none;">&raquo; <a href="{{ site.baseurl }}news">All the news ...</a></li>
</ul>

### Recent Publications

### Recent Talks

### Recent Activities

### Recently Graduated Students

### Research Grants

