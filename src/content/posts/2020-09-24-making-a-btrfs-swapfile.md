---
pubDate: 2020-09-24
title: Making a Btrfs Swapfile
description: Learn how to set up a swapfile on Btrfs with step-by-step instructions.
---

When setting up swap on Btrfs, there are a few extra things to take into consideration.

* Must be using at least Linux Kernel 5.0
* Must use a file
* Must disable copy-on-write (COW)
* Must disable compression

## Create the swapfile

Create the Btrfs subvolume to hold the file.
Feel free to choose whatever path you want.
The reason for creating a subvolume is to avoid problems with snapshotting other volumes.

```
# btrfs sub create /var/swap
```

Create and format the file.
The file must be fully allocated and not contain any holes.
For the size of the file, I follow Red Hat's recommendation of 20% of your system ram.
I have 8GB of ram, which I rounded up to 2GB of swap.

```
# truncate -s 0 /var/swap/swapfile
# chattr +C /var/swap/swapfile
# btrfs property set /var/swap/swapfile compression none
# dd if=/dev/zero of=/var/swap/swapfile bs=1M count=2048
# chmod 600 /var/swap/swapfile
# mkswap /var/swap/swapfile
```

## Mount it

If you have problems here, use `dmesg` to check for errors.

```
# swapon /var/swap/swapfile
```

## Make it permanent

Add the following to `/etc/fstab`.

```
/var/swap/swapfile none swap defaults 0 0
```

## References

* [Swap - ArchWiki](https://wiki.archlinux.org/index.php/swap)
* [Do we really need swap on modern systems?](https://www.redhat.com/en/blog/do-we-really-need-swap-modern-systems)
