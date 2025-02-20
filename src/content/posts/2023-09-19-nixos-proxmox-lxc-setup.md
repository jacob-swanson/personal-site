---
pubDate: 2023-09-19
title: NixOS on Proxmox LXC Setup
description: Learn how to install NixOS in an LXC container on Proxmox. This guide covers downloading or building an LXC template, setting up the container, and configuring NixOS for a smooth deployment.
---

This guide will explain how to install NixOS in an LXC container in Proxmox.

## Getting an LXC container template into Proxmox

A template can either be downloaded from the Nix pipeline, or built using the Proxmox LXC community generator.
This file needs to be uploaded to Proxmox as a CT template.

### Downloading an image

Download the latest `nixos-system-x86_64-linux.tar.xz` image from the [Nix pipeline](https://hydra.nixos.org/job/nixos/trunk-combined/nixos.containerTarball.x86_64-linux).

Then upload the CT template using the Proxmox web GUI.

![CT upload](/assets/proxmox-nixos-uploaded-ct-template.png)

### Building an image (Alternative)

If there's an issue with the pre-built image, or the base configuration needs to be changed, you can build your own template using Nix.

To generate a Proxmox LXC template, you will need to have a system with Nix installed.
You can install NixOS in a VM or on a spare machine using the [NixOS ISO](https://nixos.org/download#nixos-iso),
or install Nix on an existing Linux or MacOS machine using [the determinate Nix installer](https://github.com/DeterminateSystems/nix-installer),
which is supported on Windows via WSL as well.

Generate the template.

```
$ nix run github:nix-community/nixos-generators -- --format proxmox-lxc
...
/nix/store/qd61qjxn2dfbmajnv6lckjnv6f7x5ydh-tarball/tarball/nixos-system-x86_64-linux.tar.xz
```

Or customize the initial image by providing your own `configuration.nix`.
You can install additional packages, change the default root password, etc.

```
$ nix run github:nix-community/nixos-generators -- --format proxmox-lxc -c ./configuration.nix
...
/nix/store/qd61qjxn2dfbmajnv6lckjnv6f7x5ydh-tarball/tarball/nixos-system-x86_64-linux.tar.xz
```

Take note of the file path output at the end.
This is the file that needs to be uploaded to Proxmox.

Then upload the CT template using the Proxmox web GUI.

![CT upload](/assets/proxmox-nixos-uploaded-ct-template.png)

## Create an LXC Container

Create a new LXC container using the uploaded template in the web GUI.

- Ensure Nesting is enabled.
- A password is required by Proxmox, but will not be used by NixOS.
- (Optional) upload an SSH public key.
- Configure networking.

Currently (as of 2023/09), the default Proxmox web console is broken with NixOS.
To fix this, change the container's Console mode from `tty` to `console`.
If the container is already started, restart it to get the console working.

Start the container, and open the console.
It may still be blank, however the login prompt should appear after pressing enter.

Enter `root` for the username and `nixos` for the password, unless it was changed in the custom image.

Go ahead and set a new root password now, if you haven't already.
```
# password
New password:
Retype new password:
passwd: password updated successfully
```

Initialize [nixpkgs](https://github.com/NixOS/nixpkgs).
```
# nix-channel update
unpacking channels...
```

Initialize `/etc/nixos/configuration.nix` using this minimal example.
```
# cat > /etc/nixos/configuration.nix <<EOF
{ modulesPath, ... }: {
  imports = [ (modulesPath + "/virtualisation/proxmox-lxc.nix") ];
}
EOF
```

Apply any newer changes since the template was created and reboot.
```
# nixos-rebuild switch
building Nix...
building the system configuration...
# reboot
```

## Finish

After completing these steps, you will have a NixOS Proxmox LXC up and running!

## References

- [NixOS Wiki \| Proxmox Virtual Environment - LXC](https://nixos.wiki/wiki/Proxmox_Virtual_Environment#LXC)
- [GitHub \| nix-community/nixos-generators](https://github.com/nix-community/nixos-generators)
