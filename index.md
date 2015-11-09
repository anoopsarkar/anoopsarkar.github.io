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

### Software

<dl>
{% for sw in site.data.software limit:2 %}
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

<p><span class="moreinfo"><a href="{{ site.baseurl }}/software">All software ...</a></span></p>

### Teaching

* On sabbatical: Fall 2015 and Spring 2016
* Spring 2015: [Machine Learning for Decipherment](http://anoopsarkar.github.io/decipherment-class/)
* Fall 2014: [Natural Language Processing](http://anoopsarkar.github.io/nlp-class/)
* Fall 2013: [Compilers](http://www.cs.sfu.ca/~anoop/teaching/CMPT-379-Fall-2013/)
<p><span class="moreinfo"><a href="{{ site.baseurl }}/teaching">All teaching ...</a></span></p>

### Recent Publications and Talks

{% include shortpubs.html %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/publications">All publications ...</a></span></p>

### Research Grants

### Service

### Recently Graduated Students

{% include graduatedstudents.html param=2 %}

<p><span class="moreinfo"><a href="{{ site.baseurl }}/people">All students and postdocs</a> and <a href="{{ site.baseurl }}/theses">All student theses ...</a></span></p>

### Schedule

<iframe src="https://calendar.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=AGENDA&amp;height=200&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=canadian%40holiday.calendar.google.com&amp;color=%235229A3&amp;src=l0fdahjlgf25v808cnsfp87b38%40group.calendar.google.com&amp;color=%2329527A&amp;src=gsrb686df4mefnaegqgs8kug8k%40group.calendar.google.com&amp;color=%23182C57&amp;src=qgs97od9ef8t1582k2rqomv5ho%40group.calendar.google.com&amp;color=%232952A3&amp;src=5r8pdvqu1avl1473japs3dcevg%40group.calendar.google.com&amp;color=%231B887A&amp;ctz=America%2FVancouver" style="border-width:0" width="600" height="200" frameborder="0" scrolling="no"></iframe>

<p><span class="moreinfo"><a href="{{ site.baseurl }}/schedule">Full Schedule ...</a></span></p>

