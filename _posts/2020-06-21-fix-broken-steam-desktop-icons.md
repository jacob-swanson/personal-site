---
layout: post
title:  Fixing broken Steam desktop icons
categories: tech
tags: btrfs linux
---

If your Steam desktop icons are showing up as ".url" files without their associated icons, then follow these steps.


1. Type "Default apps" into the Windows search bar and open the app.
2. Scroll down and click “Choose default apps by file type”.
3. Scroll down to find ".URL".
4. Choose “Internet Browser” for the default.

![](/assets/steam-choose-default-app.png)

One potential cause for this issue can be the removal of Internet Explorer from Windows using "Turn Windows features on or off".
