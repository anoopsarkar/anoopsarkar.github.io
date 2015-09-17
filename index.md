---
layout: default
title: Home
---

* [Professor]({{ site.baseurl }}professor)
* [Natural Language Lab](http://natlang.cs.sfu.ca)
* [School of Computing Science](http://www.cs.sfu.ca/)
* [Simon Fraser University](http://www.sfu.ca)
* &raquo; [Contact details ...]({{ site.baseurl }}contact)
{: .contact}

### Biography

### News and ill-tempered observations

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
  <li class="more"><a href="{{ site.baseurl }}news">More news ...</a></li>
</ul>

### Publications

### Talks

### Activities

### Graduated Students

### Research Grants

