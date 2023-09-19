---
layout: post
created_date: 2019-05-15
title: Make Docker use different IP ranges on Linux
categories: 
  - tech
tags: 
  - linux
  - docker
---

In this post, you'll find out how to configure the IP ranges that Docker uses for its networks.

TL;DR put this into `/etc/docker/daemon.json`.

```json
{
  "bip": "10.10.0.5/24",
  "default-address-pools": [
    {
      "base": "10.11.0.0/16",
      "size": 24
    }
  ]
}
```

And restart Docker with `sudo systemctl restart docker`.

* **bip** -- specifies the IP address and netmask to use for Docker's default bridge using standard CIDR notation.
  New containers will use IP addresses within this range. Existing ones will not be modified.

  ```
  # ifconfig
  docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
          inet 10.10.0.5  netmask 255.255.255.0  broadcast 10.10.0.255
          ether 02:42:92:be:8d:1c  txqueuelen 0  (Ethernet)
          RX packets 0  bytes 0 (0.0 B)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 0  bytes 0 (0.0 B)
          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
  ```
* **default-address-pools** -- specify pools used for creating new networks.
  This is needed to configure new networks created by Docker Compose.
  **base** specifies the CIDR range to use, and **size** specifies the size of the subnet to reserve for that new network.
