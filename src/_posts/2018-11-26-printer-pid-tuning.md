---
layout: post
title: 3D Printer PID Tuning with OctoPrint
categories:
  - tech
tags:
  - 3dprinting
  - octoprint
---

# {{page.title}}

What you'll need

* A 3D Printer
* OctoPrint

## What's PID tuning?

Improving the printer's temperature control.

## Why?

New hotend, age, etc.
Printer doesn't seem to be able to hold a consistent temperature while printing.

## Original Values

These were the original PID values on my Maker Select Plus.
You can retrieve these values from the display on the printer.

PID-P: 33<br/>
PID-I: 1<br/>
PID-D: 189<br/>

## Tuning

1. Open **OctoPrint**
1. Go to the **Terminal** tab
1. Check all the Suppress message checkboxes
1. Enter M303 E0 S230 C10 to start autotuning
   M303 — Command to tune<br/>
   E0 — Tune the extruder (E1 is the heated bed)<br/>
   S230 — Target temperature<br/>
   C10 — Number of iterations<br/>
   **WARNING**: The output in OctoPrint will be pushed out of the buffer by the suppressed messages, so don't leave it for a long time.

1. Wait until it's finished. Here's the output once it's done.
   ```
   Recv: Kp: 20.12
   Recv: Ki: 1.23
   Recv: Kd: 82.41
   Recv: PID Autotune finished! Put the Kp, Ki and Kd constants into Configuration.h
   ```

## New Values

Here's the values that I got after tuning my printer with the [Micro Swiss All Metal Hotend](https://store.micro-swiss.com/products/all-metal-hotend-with-slotted-cooling-block-for-wanhao-i3).

*Values have been rounded to the nearest whole number.*

PID-P: 20<br/>
PID-I: 1<br/>
PID-D: 82<br/>

Enter your values into the printer using the built-in display or use the commands below in the OctoPrint terminal.

```
M301 P20.12 I1.23 D82.41
M500
```

* M301 — Command to set PID values
* P20.12 — Your Kp value
* I1.23 — Your Ki value
* D82.41 — Your Kd value
* M500 — Command to save settings

To view your current settings use M503.

## Sources

* [Prusa i3 (and all Marlin based) 3D printers PID Tuning with Octoprint, Slic3r and Simplify3D](https://web.archive.org/web/20220522191212/https://oxi.ch/2017/03/28/prusa-i3-and-all-marlin-based-3d-printers-pid-tuning-with-octoprint-slic3r-and-simplify3d/)
