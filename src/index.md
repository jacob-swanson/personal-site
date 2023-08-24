---
layout: default
---

<header>
  <h1>{{ site.title }}</h1>
  <p>Hi, I'm a software engineer living and working in Austin, TX.</p>
</header>

* me
    * [email]({{ site.data.socials.email_url }})
    * [GitHub]({{ site.data.socials.github_url }})
    * [LinkedIn]({{ site.data.socials.linkedin_url }})
* [resume](/resume.html)
* [privacy](/privacy.html)
* thoughts
  {% include post_list.md spaces="  " %}
