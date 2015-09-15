---
title: Anoop Sarkar
---

## About

Professor 
School of Computing Science
Simon Fraser University

## [News](all-news.html)

{% for post in site.posts limit:5 %}

### {{ post.date | date: '%b %-d, %Y' }}: {{ post.title }}

{{ post.content }}

{% endfor %}
