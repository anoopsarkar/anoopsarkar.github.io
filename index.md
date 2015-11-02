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

### Teaching

* On sabbatical: Fall 2015 and Spring 2016
* Spring 2015: [Machine Learning for Decipherment](http://anoopsarkar.github.io/decipherment-class/)
* Fall 2014: [Natural Language Processing](http://anoopsarkar.github.io/nlp-class/)
* Fall 2013: [Compilers](http://www.cs.sfu.ca/~anoop/teaching/CMPT-379-Fall-2013/)
<p><span class="moreinfo"><a href="{{ site.baseurl }}/teaching">Teaching ...</a></span></p>

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
<p><span class="moreinfo"><a href="{{ site.baseurl }}/news">News ...</a></span></p>

### Recent Publications

{% include shortpubs.html %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/publications">Publications ...</a></span></p>

### Invited Talks

### Research Grants

### Professional Activities

### Current Students

{% assign phd = 0 %}
{% assign msc = 0 %}
{% for student in site.data.gradstudents %}
    {% if student.YourRole == "Senior Supervisor" and student.CurrentStatus == "Active" and student.Program == "PhD" %}
        {% assign phd = phd | plus: 1 %}
    {% endif %}
    {% if student.YourRole == "Senior Supervisor" and student.CurrentStatus == "Active" and student.Program == "MSc Thesis option" %}
        {% assign msc = msc | plus: 1 %}
    {% endif %}
{% endfor %}

{% if phd > 0 %}
#### Phd
<ul>
{% for student in site.data.gradstudents %}
    {% if student.YourRole == "Senior Supervisor" and student.CurrentStatus == "Active" and student.Program == "PhD" %}
        <li>{{ student.Name }}</li>
    {% endif %}
{% endfor %}
</ul>
{% endif %}

{% if msc > 0 %}
#### MSc

<ul>
{% for student in site.data.gradstudents %}
    {% if student.YourRole == "Senior Supervisor" and student.CurrentStatus == "Active" and student.Program == "MSc Thesis option" %}
        <li>{{ student.Name }}</li>
    {% endif %}
{% endfor %}
</ul>
{% endif %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/grads">Graduated Students</a> and <a href="{{ site.baseurl }}/grads">People I worked with ...</a></span></p>

