---
layout: post_with_toc
created_date: 2020-06-21
title: How I do a fresh install of Windows
categories:
  - tech
tags:
  - windows reset
---

This is mostly for me to reference myself, but maybe you'll find this useful and can pick and choose some steps that you like.

This whole process shouldn't take more than a couple of hours, once you've done it a couple of times.

## Why?

Sometimes you might have a lot of crap on your PC that you want to get rid of.
Maybe you went to some shady website and had some malware installed?
Perhaps your system is misbehaving and can no longer sleep?
This is the particular issue I'm attempting to solve.

There's plenty of reasons to want to do a fresh Windows install.

## Create a backup

Use [Macrium Reflect Free](https://www.macrium.com/reflectfree) to create a full image of your Windows disk that you will be wiping.
This'll let you recover the whole thing in case something goes wrong, or you can recover individual files by browsing the backup.

Store the backup on a second drive for safekeeping.

## Create new installation media

Create a bootable USB flash drive or DVD for your version of Windows.
Microsoft has a tool to guide you through the process.
[Here's Microsoft's help article on the topic](https://support.microsoft.com/en-us/help/15088/windows-10-create-installation-media).

## Disconnect any secondary storage drives

Windows can potentially touch drives other than the one you intend to install on.
This may not be the case today, but I still take the precaution.

Do this especially if you're dual-booting with another operating system.

## Install Windows

Boot from the installation media that you created earlier.
Ensure to choose UEFI boot mode for a modern boot method.

Follow through with all the prompts until you're booted into Windows.

## Install Windows Updates

Open up "Check for updates" and check for updates.
Windows will download and install updates, then prompt you to reboot.
Repeat this process until there are no more updates.

Windows will need to install certain updates before it can install others, so it can't install all of the available updates in one go.

During this process, I'll usually re-connect any storage that I disconnected earlier and re-install the side panel.

## Remove the extras

Using "Add or remove programs", remove any programs that you think you won't use.
You can always install them back later if you change your mind.

It's best to leave non-apps like "Microsoft Visual C++…" alone.
Uninstalling these may make other programs not work, and it won't be easy to re-install them.

Next open up "Turn Windows features on or off", and at least remove Internet Explorer 11.
Generally, anything in here can be removed except for the .NET Framework(s).

There are other guides on the internet that can go much more in-depth on this step.

## Install drivers

Install your [NVIDIA](https://www.nvidia.com/Download/index.aspx) or [AMD](https://www.amd.com/en/support) drivers.
If the option is available, do a clean install to remove the drivers that Windows will have automatically installed.

Beyond graphics drivers, I try to stick with whatever Windows Update decides to install unless there is a specific problem I'm trying to solve.
That way I stay with an active update channel, and it's another thing I don't have to manage or remember.

For Intel devices, you can use [Intel Drive & Support Assistant](https://www.intel.com/content/www/us/en/support/intel-driver-support-assistant.html) to install or update any Intel drivers.

There is a chance that you'll need to look up your specific motherboard to download vendor-specific drivers.

## Do some diagnostic benchmarks

[UserBenchmark](https://www.userbenchmark.com/) doesn't have a great reputation for being trustworthy, but I've yet to encounter a similar alternative for what I want.

If you want to make sure all of your main components (CPU, RAM, graphics, disk) are all functioning within expectations, then it's great.
Just don't try to compare with non-similar components.

Download and run the benchmark tool, if any of your results fall significantly below the 50th percentile, you'll need to diagnose that component.

You could need to install a vendor-specific driver over the generic one or change your hardware setup.
For example, some generic SATA drivers can perform significantly worse than your motherboard's SATA drivers, or your new SSD could be connected to a SATA 2 port instead of a SATA 3 port on your motherboard.

Alternatively, you can use [3DMark](https://www.3dmark.com/) for a much better benchmark of your CPU and GPU.
This doesn't contain specific benchmarks for RAM or disk, which is one reason I prefer UserBenchmark.

## Install software

This is very much up to you, but here's a quick list of what I usually install upfront in no particular order.
This will include the things listed above.

* [Macrium Reflect Free](https://www.macrium.com/reflectfree)
* [NVIDIA](https://www.nvidia.com/Download/index.aspx)/[AMD](https://www.amd.com/en/support) drivers
* [Intel Driver and Support Assistant](https://www.intel.com/content/www/us/en/support/intel-driver-support-assistant.html)
* [UserBenchmark](https://www.userbenchmark.com/)
* [CrystalDiskMark](https://crystalmark.info/en/software/crystaldiskmark/)
* [CrystalDiskInfo](https://crystalmark.info/en/software/crystaldiskinfo/)
* [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html)
* [GPU-Z](https://www.techpowerup.com/gpuz/)
* [Discord](https://discord.com/)
* [NZXT CAM](https://www.nzxt.com/camapp) — for specific hardware
* [MSI Afterburner](https://www.msi.com/page/afterburner) — for NVIDIA GPU
* [7zip](https://www.7-zip.org/)
* [Epic Games Launcher](https://www.epicgames.com/unrealtournament/en-US/download)
* [Steam](https://store.steampowered.com/)
* [Logitech G HUB](https://www.logitechg.com/en-us/innovation/g-hub.html) — for specific hardware
* [Firefox](https://www.mozilla.org/en-US/firefox/)
* [WinDirStat](https://windirstat.net/download.html)

Other software is installed on an as-needed basis.
I don't try to install everything I had before I reinstalled.
Some of these include:

* [Cura](https://ultimaker.com/software/ultimaker-cura)
* [Fusion 360](https://www.autodesk.com/products/fusion-360/overview)
* [Jetbrains Toolbox](https://www.jetbrains.com/toolbox-app/)

## Conclusion

If you followed along, you should now have a fresh install of Windows with the old one stored in a backup.
Hopefully, you've accomplished your goal that lead you here in the first place.
