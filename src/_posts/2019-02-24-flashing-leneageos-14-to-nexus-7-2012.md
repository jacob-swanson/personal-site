---
layout: post
title: Flashing LineageOS 14.1 to a Nexus 7 (2012)
categories:
  - tech
tags:
  - android
  - nexus
  - nexus7
  - lineage
  - lineageos
---

# {{page.title}}

![Nexus 7 (2012)](/assets/nexus-7-2012.png)

The Nexus 7 (2012) ended with a terrible update that made the tablet basically unusable.
I will cover the steps I took in flashing LineageOS to my wife's old Nexus 7.

These steps aren't high quality instructions. I wanted to capture my general steps and be able to retrace my path if needed.
Feel free to ask any questions.

My first step was to realize that I actually had the 2012 version of the device instead of the 2013 one.
The 2012 one is lacking a rear facing camera, so that's how you can tell them apart.

## Device codenames

These are the codenames used to refer to the devices.
This will be helpful if you need to Google search for anything.

* Nexus 7 (2013) — Flo
* Nexus 7 (2012) — Grouper

## Key concepts

* Bootloader — Responsible for starting the device
* Recovery — A primitive recovery console for your device
* ROM — The main system software, which is not modifiable

## Installation steps

I loosely followed the [LineageOS instructions for the Nexus 7 (2013)](https://wiki.lineageos.org/devices/flo/install) substituting for the Nexus 7 (2012) downloads.

### Setting up your system

Download ADB and fastboot.
[Here's LineageOS's guide](https://wiki.lineageos.org/adb_fastboot_guide.html).
Just download the zip, and unzip it.
Don't worry about adding it to your environment.

### Unlocking the bootloader

Boot into the bootloader by holding the power and volume down button while powering on the device.

Verify that your PC can find the device by typing: `fastboot devices`

Unlock the bootloader by typing: `fastboot oem unlock`

Restart the device, booting back into the bootloader for the next step.

### Installing a custom recovery

Download the latest [TWRP for grouper](https://dl.twrp.me/grouper/).

Boot into the bootloader.

Verify that your PC can find the device by typing: `fastboot devices`

Flash the custom recovery by typing: `fastboot flash recovery twrp-*-grouper.img`

Reboot into bootloader again, then boot into recovery.
TWRP should launch.
If it doesn't you may have the wrong TWRP image for your device.
I did this using the flo version myself.
You just have to re-flash the right image again.

### Finding and downloading a ROM

There aren't any officially supported ROMs at this time (Feb. 2019), and I doubt there'll ever be one at this point.

You can find ROMs in the [XDA forums for the Nexus 7](https://forum.xda-developers.com/nexus-7/development).
I went with [LineageOS 14.1](https://forum.xda-developers.com/nexus-7/development/rom-lineageos-14-1-nexus-7-2012-t3530261).
Download it or any other ROM you want to try.

### Downloading Google Apps

Go to [https://opengapps.org/](https://opengapps.org/) and select the following for your download:

* Platform: ARM
* Android: 7.1 (for LineageOS 14.1)
* Variant: pico (needed due to small system partition size)

### Installing the ROM

Create a backup of your device if you are using TWRP.
Copy to your PC since it will be wiped in a later step.

Wipe the Data, Cache, and System partitions using the **Wipe** tool.

Sideload the LineageOS .zip package:

1. On the device, select **Advanced**, **ADB Sideload** and swipe to begin.
1. On your PC, sideload the package using: `adb sideload lineage-*.zip`
1. Sideload Google Apps using: `adb sideload open_gapps-arm-7.1-pico-*.zip`

## References

* [https://wiki.lineageos.org/devices/flo/install](https://wiki.lineageos.org/devices/flo/install)
* [https://forum.xda-developers.com/nexus-7/development/rom-lineageos-14-1-nexus-7-2012-t3530261](https://forum.xda-developers.com/nexus-7/development/rom-lineageos-14-1-nexus-7-2012-t3530261)
