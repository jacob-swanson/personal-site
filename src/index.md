---
enable_fontawesome: true
layout: default
---

<header>
  <h1>{{ site.title }}</h1>
  <p>Hi, I'm a software engineer living and working in Austin, TX.</p>
</header>

* me
    * <i class="fa-solid fa-envelope"></i> [email]({{ site.data.socials.email_url }}) ({{ site.data.socials.email }})
    * <i class="fa-brands fa-github"></i> [GitHub]({{ site.data.socials.github_url }})
    * <i class="fa-brands fa-linkedin"></i> [LinkedIn]({{ site.data.socials.linkedin_url }})
    * <i class="fa-brands fa-instagram"></i> [Instagram]({{ site.data.socials.instagram_url }})
* [resume](/resume.html)
* [privacy](/privacy.html)
* posts
  {% include post_list.md spaces="  " %}
