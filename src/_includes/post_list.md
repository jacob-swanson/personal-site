{% for post in site.posts %}{{ include.spaces }}* {{ post.date | date: '%Y-%m-%d' }} <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
{% endfor %}
