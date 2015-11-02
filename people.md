---
layout: page
title: People
menu: true
customjs: thesisbib
---

These are the people I have supervised (as senior supervisor) including graduate and undergraduate students and postdoctoral fellows.

## Current Graduate Students

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
        <li>{{ student.Name }} <span class="smaller">(started: {{ student.StartSemester }})</span></li>
    {% endif %}
{% endfor %}
</ul>
{% endif %}

{% if msc > 0 %}
#### MSc

<ul>
{% for student in site.data.gradstudents %}
    {% if student.YourRole == "Senior Supervisor" and student.CurrentStatus == "Active" and student.Program == "MSc Thesis option" %}
        <li>{{ student.Name }} <span class="smaller">(started: {{ student.StartSemester }})</span></li>
    {% endif %}
{% endfor %}
</ul>
{% endif %}

## Postdoctoral Fellows

<ul>
{% for postdoc in site.data.postdocs %}
    <li>{{ postdoc.name }} <span class="smaller">({{ postdoc.start }} to {{ postdoc.end }})</span>
        <!-- <ul class="smaller"><li>After: {{ postdoc.after }}</li></ul> -->
    </li>
{% endfor %}
</ul>

## Undergraduates

<ul>
{% for ugrad in site.data.undergrads %}
    <li>{{ ugrad.name }}
        <span class="smaller">(
        {% for sem in ugrad.semesters %}
            {{ sem.semester }}
        {% endfor %}
        )
        </span>
        <!--
        <ul class="smaller">
        {% for sem in ugrad.semesters %}
            <li>{{ sem.semester }} (Funding: {{ sem.funding }})</li>
        {% endfor %}
        </li>
        {% if ugrad.after %}
            <li>After: {{ ugrad.after }}</li>
        {% endif %}
        </ul>
        -->
    </li>
{% endfor %}
</ul>

## Graduated Students

{% include allpubs.html %}

