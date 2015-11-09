---
layout: default
title: Home
customjs: shortpubs
---

**This page is under construction. Go and visit [my home page at SFU](http://www.cs.sfu.ca/~anoop/) for correct and up to date information.**

* [Professor]({{ site.baseurl }}/professor)
* [Natural Language Lab](http://natlang.cs.sfu.ca)
* [School of Computing Science](http://www.cs.sfu.ca/)
* [Simon Fraser University](http://www.sfu.ca)
* <span class="moreinfo"><a href="{{ site.baseurl }}/biography">Biography</a> and <a href="{{ site.baseurl }}/contact">Contact details ...</a></span>
{: .contact}

### Research

* Statistical machine translation
* Statistical parsing of natural languages
* Machine learning for Natural Language Processing

### News and Posts

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
</ul>
<p><span class="moreinfo"><a href="{{ site.baseurl }}/news">All news and posts ...</a></span></p>

### Teaching

* On sabbatical: Fall 2015 and Spring 2016
* Spring 2015: [Machine Learning for Decipherment](http://anoopsarkar.github.io/decipherment-class/)
* Fall 2014: [Natural Language Processing](http://anoopsarkar.github.io/nlp-class/)
* Fall 2013: [Compilers](http://www.cs.sfu.ca/~anoop/teaching/CMPT-379-Fall-2013/)
<p><span class="moreinfo"><a href="{{ site.baseurl }}/teaching">All teaching ...</a></span></p>

### Recent Publications and Talks

{% include shortpubs.html %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/publications">All publications ...</a></span></p>

### Software

{% include software.html param=2 %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/software">All software ...</a></span></p>

### Research Grants

### Service

### Recently Graduated Students

{% include graduatedstudents.html param=2 %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/people">All students and postdocs</a> and <a href="{{ site.baseurl }}/theses">All student theses ...</a></span></p>


