---
pubDate: 2020-07-21
title: Installing Ubuntu from scratch (without the installer)
---

In this article, I will describe the steps I took to install Ubuntu from scratch.
This will involve:

1. Bootstrapping the base system
2. Configuring networking
3. Installing Gnome

I wanted to do this for a few reasons.
The primary reason was that [Ubiquity](https://wiki.ubuntu.com/Ubiquity) (Ubuntu's graphical installer) doesn't support custom Btrfs subvolumes.
It will automatically use `@` for `/` and `@home` for `/home`.

The other reasons were that I wanted as small of an install as I could manage, and I wanted to learn a thing or two.

## Changelog

I'll keep a list of changes made to this document here.
The top most item in the list will be the most recent change.

* Fix command order when mounting FS. (The mkdir was before the mount.)

## Step 1: Boot up Ubuntu

You'll need a working system to bootstrap the new one.
This is up to you, but the easiest way is to create an Ubuntu USB installer and using that as your base system.
This can probably be any Debian-based system, but I'm using Ubuntu.

[You can download Ubuntu here](https://ubuntu.com/download/desktop).

## Step 2: Create & mount the filesystem

Using your preferred partitioning tools, (re)partition your hard drive as needed.
In my setup, I'll be dual booting with Windows and using a single Btrfs partition for Linux.

Here's what my partition layout looks like.

```
# fdisk -l
...
Device              Start        End    Sectors  Size Type
/dev/nvme0n1p1       2048     206847     204800  100M EFI System
/dev/nvme0n1p2     206848     239615      32768   16M Microsoft reserved
/dev/nvme0n1p3     239616 3225421940 3225182325  1.5T Microsoft basic data
/dev/nvme0n1p4 3749711872 3750746111    1034240  505M Windows recovery environment
/dev/nvme0n1p5 3225423872 3749711871  524288000  250G Linux filesystem
```

Next format your partitions.
If you don't already have an EFI partition, you'll need to make one of those too.

Here's what I did to create a Btrfs root (named `ubuntu`) and home (named `home`) subvolumes.

```
# mkfs.btrfs /dev/nvme0n1p5
# mkdir /mnt/ubuntu
# mount /dev/nvme0n1p5 /mnt/ubuntu
# btrfs subvol create /mnt/ubuntu/ubuntu
# btrfs subvol create /mnt/ubuntu/home
# umount /mnt/ubuntu
```

Then mount them.
I'm using `/mnt/ubuntu`, but you can substitute anything you want.

```
# mount /dev/nvme0n1p5 /mnt/ubuntu -o defaults,noatime,compress=lzo,subvol=ubuntu
# mkdir -p /mnt/ubuntu/{home,boot/efi}
# mount /dev/nvme0n1p5 /mnt/ubuntu/home -o defaults,noatime,compress=lzo,subvol=home
# mount /dev/nvme0n1p1 /boot/efi
```

The `noatime` and `compress=lzo` options are up to you.
`noatime` is recommended often with Btrfs.
It prevents writing an access timestamp to each file when it is read.
On the other hand, `compress=lzo` enables Btrf's compression using the [LZO](https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Oberhumer) algorithm.

## Step 3: Bootstrapping the new system

In this step, you'll use the `debootstrap` utility to set up a minimal functioning filesystem.

```
# apt install debootstrap
```

`deboostrap` is a utility that will download an archive from Ubuntu's mirror and unpack it for you.
Substitute `focal` for the latest Ubuntu release codename.

```
# debootstrap --arch amd64 focal /mnt/ubuntu
```

At this point, you'll need to mount all of the device files into your newly bootstrapped directory so the system can actually be used.

```
# mount -t proc proc /mnt/ubuntu/proc
# mount -t sysfs sysfs /mnt/ubuntu/sys
# mount --bind /dev /mnt/ubuntu/dev
```

Now enter the system using `chroot`.
This command will enter the new system as if you logged in.

```
# chroot /mnt/ubuntu /bin/bash
```

You now have a minimally functioning chroot environment.

## Step 4: Install a text editor

You'll need to edit some text files so you'll need to install a text editor.
My choice is `vim`, but if you don't know what that is, go with `nano`.
From this point forward I'll simply refer to it as `editor`.

```
# apt install vim
```

## Step 5: Configure /etc/fstab

The `/etc/fstab` file tells the OS what drives to mount where when booting up.
Normally the installer generates this for you.

You'll need to know the UUID of each device, which you can retrieve using the `blkid` command.

```
# blkid
/dev/nvme0n1p1: UUID="9A67-1849" TYPE="vfat" PARTLABEL="EFI system partition" PARTUUID="32708646-1e61-4d73-a62c-caf62533728b"
/dev/nvme0n1p3: UUID="3E8668118667C7CB" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="832360bf-4d02-4923-8e4e-ca42804cb734"
/dev/nvme0n1p4: UUID="F4D0515CD0512660" TYPE="ntfs" PARTUUID="4d367d6d-e4e7-4664-bddf-7169ae8c3d04"
/dev/nvme0n1p5: UUID="0bedd677-56f0-4488-aafc-b00d6da7193f" UUID_SUB="ab7ec365-cb24-4a60-b342-95ef9cabf600" TYPE="btrfs" PARTUUID="791bff62-39d7-45d8-93b9-cd8e4128561e"
/dev/sda2: UUID="5438A9C738A9A886" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="476ef537-a062-47e1-933f-b3879b635583"
```

Open up `/etc/fstab` in your editor.

```
# editor /etc/fstab
```

Next, add a line for each of the drives you mounted earlier.
The `dump` column should always be `0`, and the `fsck` column should have a `1` for your root drive and `2` for any others that need to be checked.

```
# <device>                                <dir>     <type> <options>                                   <dump> <fsck>
UUID=0bedd677-56f0-4488-aafc-b00d6da7193f /         btrfs  defaults,noatime,compress=lzo,subvol=ubuntu 0      1
UUID=0bedd677-56f0-4488-aafc-b00d6da7193f /home     btrfs  defaults,noatime,compress=lzo,subvol=home   0      2
UUID=9A67-1849                            /boot/efi vfat   defaults,noatime                            0      0
```

## Step 6: Configure the timezone

If you're dual-booting with Windows, configure Ubuntu to use local time instead of UTC for the system clock.

```
# editor /etc/adjtime
```

Here's what it should look like.

```
0.0 0 0.0
0
LOCAL
```

If this file doesn't exist, the system will default to UTC.
You can also substitute LOCAL with UTC to configure it explicitly.

Use this command to configure your timezone.

```
# dpkg-reconfigure tzdata
```

## Step 7: Install a kernel

To be able to boot the system, you'll need a Linux kernel.
If you're not using 64-bit system, then you'll probably need to do something different here.

```
# apt install linux-image-generic
```

## Step 8: Setup the bootloader

To actually boot the system, you'll need a boot loader.
This will install and setup [Grub](https://www.gnu.org/software/grub/) to be your bootloader using [UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface).

```
# apt install grub-efi
# grub-install --efi-directory=/boot/efi --bootloader-id=ubuntu
```

This will install the necessary files into `/boot/efi` and set up a boot entry in your motherboard's [NVRAM](https://en.wikipedia.org/wiki/Non-volatile_random-access_memory).

## Step 9: Create a user

You'll need a user for normal user activity.
Substitute `me` for the username you want to use.

```
# adduser me
```

Then configure a way to gain root privileges.
You can either add an `admin` group or give the `root` account a password.

```
# addgroup --system admin
# adduser me admin
# AND/OR
# passwd root
```

By default, any user in the admin group can use sudo to become root.
You can verify this by using `visudo`.
It opens `/etc/sudoers` safely and it should contain the following somewhere:

```
# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL
```

If this file is messed up, it can leave you unable to gain root access.
`visudo` helps prevents this by checking the file's syntax.

**At this point, the system is ready to be booted and further steps are not strictly required.**

## Step 10: Configure networking

First, install [Network Manager](https://en.wikipedia.org/wiki/NetworkManager).
This service does exactly what its name suggests.

```
# apt install network-manager
```

Next create a [Netplan](https://netplan.io/) config file.
This is a utility by Canonical to configure networking.
Without this networking will not be automatically configured.

```
# editor /etc/netplan/50-network-manager.yaml
```

Enter the following:

```
network:
  version: 2
  renderer: NetworkManager
```

This will make Network Manager bring any ethernet devices up using DHCP.

If you're doing this on a live system, you'll need to apply the changes using this:

```
# netplan apply
```

## Step 11: Install a desktop environment

`tasksel` is a useful convenience utility for installing groups of applications.
You can use it to select Ubuntu minimal to get a minimal Gnome install.
You can choose any alternatives you want here like Kubuntu, Mate, etc.

```
# apt install tasksel
# tasksel
```

Alternatively you can install a few meta packages.

```
# apt install ubuntu-minimal ubuntu-standard
```

## Step 12: Boot into the system

You can now boot into the system.
You should be greeted by Ubuntu's login screen just like you normally would.

From here, you can configure the system just like you would after exiting the installer.

If you've gotten this far congratulations.
Hopefully you've learned a lot.

If you have any problems either leave a comment or shoot me an email.
I'm not actively monitoring comments on the site at this time, so an email should get my attention sooner.

## References

* [Installing Ubuntu from a Unix/Linux System](https://web.archive.org/web/20220215031455/https://help.ubuntu.com/lts/installation-guide/armhf/apds04.html)
