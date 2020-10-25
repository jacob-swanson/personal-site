---
layout: post
title:  Capturing game audio separately using ShadowPlay and Voicemeeter Banana 
categories: tech
tags: windows shadowplay capture voicemeeter
---

# {{page.title}}

This will explain how I setup ShadowPlay and Voicemeeter Banana to record game audio in one track and mic/desktop audio in another.

What’s ShadowPlay?
It uses your NVIDIA graphics card to capture video with very little performance impact.

What’s Voicemeeter?
It’s a virtual audio mixer for Windows.
The Banana version is more advanced and has two virtual inputs/outputs which we need for this setup.

## Setup Voicemeeter Banana

Follow the "Quick Startup Guide" from the [Voicemeeter Banana User Manual](https://www.vb-audio.com/Voicemeeter/VoicemeeterBanana_UserManual.pdf) to get Voicemeeter Banana setup.
I'll list the steps below without pictures like the manual has.

1. Install Voicemeeter Banana.
1. Set Windows to output to one of the Voicemeeter Banana inputs.
1. Set the A1 Hardware Out to your output device (speakers or headphones).
1. Run Voicemeeter Banana on startup.

## Setup ShadowPlay

In NVIDIA GeForce Experience, enable ShadowPlay.
After enabling it, you will be able to open the overlay using ALT+Z.

Enable recording audio to separate tracks, and have it always enabled.

## Piping Audio

### Voicemeeter Side

1. Select your mic as the first hardware input using the WDM option, rename it to “Mic”, and enable B1.
1. Rename the first virtual input to "Game" and enable A1.
   This is what your game will output audio to.
1. Rename the second virtual input to "Desktop" and enable A1 and B1.
   This will be your default output device.
1. Select your speakers as the A1 output using the WDM option.

Here’s what mine looks like.

![Voicemeeter Setup](/assets/voicemeeter-setup.png)

**Windows Mixer Side**

1. Open the Windows mixer (search for "mixer").
1. Launch a game and start recording with ShadowPlay.
   This will make the game and NVIDIA Container appear in the mixer.
1. Set the game and NVIDIA Container output device to the Game virtual input.
1. Set the NVIDIA Container input device to the Voicemeeter virtual output.

ShadowPlay will record audio from the output device into one track and the input device into another track.

![Windows Mixer](/assets/voicemeeter-windows-setup.png)

And there you have it! Recording game audio separately from all other audio.
