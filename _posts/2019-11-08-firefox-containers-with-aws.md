---
layout: post
title: Managing multiple AWS Consoles with JumpCloud and Firefox
categories:
  - tech
tags:
  - firefox
  - aws
---

# {{page.title}}

This article will explain how I setup Firefox to open multiple AWS Consoles in Firefox Container tabs from JumpCloud seamlessly.
No having to right click a link and selecting a container.
Just a normal left click.

This should work with other SSO sites as long as the URL contains something to identify the account.

You'll need [Firefox](https://www.mozilla.org/en-US/firefox/new/) with [Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/) and [Containerise](https://addons.mozilla.org/en-US/firefox/addon/containerise/) installed.

Containerise lets you automatically open websites in dedicated containers with more advanced rules than Multi-Account Containers allows.
This can be used to match a specific URL during the sign in process to redirect to a container tab.

Grab the URL for one of your application links.

![JumpCloud AWS Example](/assets/jumpcloud-aws-example.png)

Here's what one of mine looks like:

```
https://sso.jumpcloud.com/saml2/aws-dev
```

Put this into Containerise and save.
Click the Containerise icon in the toolbar then click the pencil to edit the config manually.
It's a simple CSV format.

```
sso.jumpcloud.com/saml2/aws-dev , AWS Dev
```

Now when you click the link, it should automatically open in a container.

You will need to sign in again, but that's only needed the first time.
You can a password manager like use [bitwarden](https://bitwarden.com/) to speed that part up.
