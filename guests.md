---
layout: default
title: Guests
permalink: /guests/
---

<header class="row">
    <a href="/" class="logo">
        UnderJS
        <span class="emoji">
            <span class="ltr">🦄</span>🎧🦄
        </span>
        Podcast
    </a>
</header>

<div class="container row">
  <h1>Гости</h1>

  <ul class="guests">
    {% for guest in site.guests %}
      <li class="guest">
        <a href="{{guest.id}}.html">
          <img src="{{guest.avatar}}">
          <h3>{{guest.name}}</h3>
        </a>
      </li>
    {% endfor %}
  </ul>
</div>
