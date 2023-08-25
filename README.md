# www.jacob-swanson.com

[![Netlify Status](https://api.netlify.com/api/v1/badges/93a60034-e728-4e64-894d-b0c6ea9a5697/deploy-status)](https://app.netlify.com/sites/goofy-nightingale-d11a3d/deploys)

Code for my personal website.

## Tech

* GitHub - you are here.
* Jekyll - easy static site generation.
* Netlify - hosting, chosen due to supporting preview deploys.
* Cloudflare - hides my email address from bots.
* Utterances - user comments powered by GitHub.
* Google Analytics - allows me to see if my content is being read.
* Font Awesome - social icons; manually patched to remove unnecessary icons for best performance.
    * They do have a slight layout shift which is a little annoying.

## Running locally

Requirements:
* [Nix: the package manager](https://github.com/DeterminateSystems/nix-installer) or [NixOS: the Linux Distribution](https://nixos.org/)
* [just](https://github.com/casey/just)

```bash
$ just install-dependencies
$ just start
```
