---
layout: default
title: Home
---

<img align="right" padding="10px" src="{{ site.baseurl }}assets/favicon-precompose.png" class="img-responsive img-rounded" style="max-width:144px">

# Anoop Sarkar

> [Professor]({{ site.baseurl }}professor) <br/>
> [School of Computing Science](http://www.cs.sfu.ca/) <br/>
> [Simon Fraser University](http://www.sfu.ca)

## News

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
  <li><a href="{{ site.baseurl }}news">All the news ...</a></li>
</ul>

