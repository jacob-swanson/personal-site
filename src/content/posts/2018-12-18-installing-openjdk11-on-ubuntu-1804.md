---
pubDate: 2018-12-28
title: Installing the actual OpenJDK 11 on Ubuntu 18.04
description: Learn how to install the actual OpenJDK 11 on Ubuntu 18.04, bypassing the default OpenJDK 10 package. Follow this guide to use a PPA for a proper installation of Java 11 for development.
---

When you install OpenJDK on Ubuntu 18.04 (the current LTS release), you actually get OpenJDK 10 masquerading as OpenJDK 11.
There's plenty of other information out there on why this happened.
Here's one such post on askubuntu.com.

Eventually, installing OpenJDK 11 on Ubuntu 18.04 will actually install Java version 11.
[You can follow this ticket for updates on the issue](https://bugs.launchpad.net/ubuntu/+source/openjdk-lts/+bug/1796027).

Here's what it looks like when you install it.
You can see that Java reports its version as 10.

```
# sudo apt install openjdk-11-jdk
# java -version
openjdk version "10.0.2" 2018-07-17
OpenJDK Runtime Environment (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.4)
OpenJDK 64-Bit Server VM (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.4, mixed mode)
```

This is a problem if you're specifically targeting 11 for development.
Here's how to install the actual OpenJDK 11 using a PPA.

```
# sudo add-apt-repository ppa:openjdk-r/ppa
# sudo apt upgrade
```

This way you don't have to manually install a copy of OpenJDK on your system, and have it nicely managed by apt.
