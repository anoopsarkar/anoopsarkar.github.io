---
layout: default
title: Home
customjs: shortpubs
---

* [Professor]({{ site.baseurl }}{% post_url 2015-09-01-professor %})
* [Natural Language Lab](http://natlang.cs.sfu.ca)
* [School of Computing Science](http://www.cs.sfu.ca/)
* [Simon Fraser University](http://www.sfu.ca)
{: .contact}

<p>
<div class="button-group">
    <a href="https://scholar.google.ca/citations?user=KhJJchQAAAAJ" class="button">Google Scholar</a>
    <a href="https://github.com/anoopsarkar" class="button">Github</a>
    <a href="https://bitbucket.org/sfu-natlang/" class="button">Bitbucket</a>
    <a href="https://twitter.com/anoopsarkar" class="button">Twitter</a>
</div>
</p>


<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/biography">Biography</a></li>
        <li><a href="{{ site.baseurl }}/contact">Contact details</a></li>
    </ul>
</div>

<p>
<div class="alert alert-info">
If you are interested in working with me, before you email me, please read my <a href="{{ site.baseurl }}/firstcontact">First Contact</a> guide.
</div>
</p>

### Research
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/research">More on research</a></li>
    </ul>
</div>

* Statistical machine translation
* Statistical parsing of natural languages
* Multilingual Natural Language Processing
* Machine learning for Natural Language Processing

### News and Posts
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/news">All news and posts</a></li>
        <li><a href="{{ site.baseurl }}/tags">Sorted by tags</a></li>
    </ul>
</div>

<ul class="posts">
  {% for post in site.posts limit:2 %}
    {% unless post.draft == 'true' %}
      <li>
        <a href="{{ site.baseurl }}{{ post.url }}">
          <div>
            <span class="title">{{ post.title }}</span>
            <span class="date">{{ post.date | date_to_string }}</span>
          </div>
        </a>
      </li>
    {% endunless %}
  {% endfor %}
</ul>
<!--
<p><span class="moreinfo"><a href="{{ site.baseurl }}/news">All news and posts ...</a></span></p>
-->

### Teaching
<!--
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/teaching">All teaching</a></li>
    </ul>
</div>
-->

* Summer 2016: [Compilers](http://anoopsarkar.github.io/compilers-class/)
* On sabbatical: Fall 2015 and Spring 2016
* Spring 2015: [Machine Learning for Decipherment](http://anoopsarkar.github.io/decipherment-class/)
* Fall 2014: [Natural Language Processing](http://anoopsarkar.github.io/nlp-class/)

### Recent Publications and Talks
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/publications">All publications</a></li>
    </ul>
</div>

{% include shortpubs.html %}

### Software
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/software">All software</a></li>
    </ul>
</div>

{% include software.html param=2 %}

### Research Grants
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/grants">All grants</a></li>
    </ul>
</div>
* Google Faculty Research Award, 2014-2015.
* NSERC Discovery Accelerator Supplements Program, 2012-2015.
* NSERC Discovery Grants Program, 2003-2007, 2007-2012, 2012-2017.

### Service
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/service">All activities</a></li>
    </ul>
</div>
* Program co-chair, NAACL HLT 2015.
* Doctoral forum chair for SIAM International Conference on Data Mining, SDM 2015.
* Tutorials chair for Meeting of the American Machine Translation Association, AMTA 2014.

### Recently Graduated Students
<div class="more">
    <ul class="navigate">
        <li><a href="{{ site.baseurl }}/people">All students and postdocs</a></li>
        <li><a href="{{ site.baseurl }}/theses">Student theses</a></li>
    </ul>
</div>

{% include graduatedstudents.html param=2 %}

