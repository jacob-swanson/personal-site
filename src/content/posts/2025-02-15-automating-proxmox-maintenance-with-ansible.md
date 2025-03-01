---
pubDate: 2025-02-15
title: Automating Proxmox Homelab Maintenance with Ansible
description: Automate Proxmox homelab maintenance with Ansible. Learn how to streamline updates, ensure consistency, and reduce manual effort with simple playbooks.
---

Running Proxmox in the homelab is a great way to learn about virtualization, containerization, and infrastructure management.
However, keeping everything up to date is time-consuming when done manually.
Ansible, a simple automation platform, can streamline routine maintenance, ensuring updates and changes are consistently applied across your fleet.

This guide covers how to automate routine Proxmox updates using Ansible, reducing manual effort and ensures consistency across your environment!

To get started, you need Ansible installed on a control node. A control node is any Linux machine.
It can be a laptop, desktop, or any other machine; however, it should be separate from the machines managed by Ansible.

## Prerequisites

1. [Install Ansible on your control node](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html).
2. [Configure password-less SSH authentication to your Proxmox servers for the root user](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server).
3. One or more [Proxmox Virtual Environment](https://www.proxmox.com/en/products/proxmox-virtual-environment/overview) or [Proxmox Backup](https://www.proxmox.com/en/products/proxmox-backup-server/overview) servers.

## Defining Ansible Inventory

An Ansible inventory is a file that defines the hosts and groups of hosts Ansible manages.
Create an inventory file listing your Proxmox VE and Proxmox Backup servers.

Start by creating a new directory and placing these files in it.

In this example, I have created two groups:

1. `pve` - For Proxmox VE hosts
2. `pbs` - For Proxmox Backup hosts

```yaml title="inventory.yaml"
pve:
  hosts:
    pve-10:
      ansible_host: 192.168.1.10
    pve-11:
      ansible_host: 192.168.1.11
    pve-12:
      ansible_host: 192.168.1.12
pbs:
  hosts:
    pbs-13:
      ansible_host: 192.168.1.13
```

## Creating Ansible Config

Create an Ansible config file.

```ini title="ansible.cfg"
[defaults]
# Silence a warning from Ansible.
interpreter_python = auto_silent
# Use the root user on remote machines, not the user you are logged in as on the control node.
remote_user        = root
# Inventory file, to avoid specifying it on command line.
inventory          = inventory.yaml
```

This guide uses the root user for simplicity, but running Ansible as root over SSH carries some security risk.
For security, configure SSH key-based authentication and disable password-based login to reduce attack surface.
Consider using a non-root user with `sudo` privileges to further limit potential exposure.
Then you can modify your `remote_user` and add `become: true` to your Ansible config.

## Creating Your First Playbook

This will be a simple playbook that verifies connectivity to all the hosts that you defined in your Ansible inventory.

```yaml title="playbooks/ping.yaml"
- name: Ping
  hosts: all
  tasks:
    - name: Ping
      ansible.builtin.ping:
```

Run the playbook:

```console
$ ansible-playbook playbooks/ping.yaml
PLAY [Ping] *******************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************
ok: [pve-10]
ok: [pve-11]
ok: [pve-12]
ok: [pbs-13]

TASK [Ping] *******************************************************************************************************
ok: [pve-10]
ok: [pve-11]
ok: [pve-12]
ok: [pbs-13]

PLAY RECAP *******************************************************************************************************
pbs-13                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-10                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-11                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-12                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Setting up a Command Runner

Running the same commands is repetitive and can be difficult to remember after taking long breaks.
[just](https://github.com/casey/just) is a handy way to save and run project-specific commands.

```just title="justfile"
# Show help
help:
    @just --list --unsorted

# Ping all hosts
ping:
    ansible-playbook playbooks/ping.yaml
```

Run the ping playbook using `just`.

```console
$ just
Available recipes:
    help # Show help
    ping # Ping all hosts
$ just ping
...
PLAY RECAP *******************************************************************************************************
pbs-13                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-10                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-11                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
pve-12                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Creating a Playbook for Installing Updates

This playbook will show the available updates on all hosts.
You can use this to check to see if any updates are needed.

In addition to just installing upgrades using `apt`, this playbook will...

1. Show you the available upgrades, so you have some clues if something ends up broken.
2. Reboot the machine if the updates require it.
3. Process each host in series instead of using the default linear strategy, to reduce blast radius.

This playbook will install updates on all hosts.

```yaml title="playbooks/install-updates.yaml"
- name: Install upgrades
  # Do one host at a time to reduce blast radius.
  serial: 1
  hosts:
    - all
  tasks:
    - name: Update apt cache
      ansible.builtin.apt:
        update_cache: true
        cache_valid_time: 3600

    - name: Get upgradable packages
      ansible.builtin.shell: |
        apt list --upgradable | sed '/Listing.../d'

    - name: Show upgradable packages
      ansible.builtin.debug:
        msg: "{{ upgrades_result.stdout_lines }}"

    - name: Pause
      pause:
        prompt: Do you want to upgrade the above packages? Press enter to continue, or Ctrl+c and then "a" to abort.
      when: upgrades_result.stdout_lines|length > 0

    - name: Install apt upgrades
      ansible.builtin.apt:
        upgrade: dist
        autoremove: true
        autoclean: true
      register: apt_upgrade_result

    - name: Check if reboot is required
      ansible.builtin.stat:
        path: /var/run/reboot-required
      register: reboot_required_file

    - name: Show reboot required
      ansible.builtin.debug:
        msg: Reboot required
      when: reboot_required_file.stat.exists

    - name: Reboot
      ansible.builtin.reboot:
        # Wait for LXCs and VMs to autostart. You will want to increase this if yours take longer than 30s.
        post_reboot_delay: 30
      when: reboot_required_file.stat.exists
```

Now add a new command to your `justfile`.

```just title="justfile" ins={8-11}
# Show help
help:
    @just --list --unsorted

# Ping all hosts
ping:
    ansible-playbook playbooks/ping.yaml

# Install updates
install-updates:
    ansible-playbook playbooks/install-updates.yaml
```

Then run it!

```console
$ just install-updates
...
PLAY RECAP *******************************************************************************************************
pbs-13                     : ok=6    changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
pve-10                     : ok=6    changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
pve-11                     : ok=6    changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
pve-12                     : ok=6    changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
```

### Waiting for LXCs to Finish Booting

These tasks are optional, but are useful if you are making extensive use of LXCs.

Add these tasks to have Ansible wait for your LXCs to finish booting.
This prevents the reboot task from continuing when the previous host hasn't finished recovering yet, or from having a long `post_reboot_delay`.
This checks the `systemd` status of each LXC to see if it's done booting.

```yaml title="playbooks/install-updates.yaml" ins={7-100}
# ...
- name: Reboot
  ansible.builtin.reboot:
    # Wait for LXCs and VMs to autostart. You will want to increase this if yours take longer than 30s.
    post_reboot_delay: 30
  when: reboot_required_file.stat.exists

- name: Wait for LXCs to finish booting
  ansible.builtin.shell: |
    # Fail on error instead of continuing
  	set -eu -o pipefail

  	# Ignore PBS
  	if ! command -v pct &>/dev/null; then
  	  exit 0
  	fi
  	# List running containers and check systemd status
  	pct list | tail -n +2 | while read -r vmid status lock name; do
  	  # The lock column can be empty, so shift right
  	  if [[ "$name" == "" ]]; then
  		  name=$lock
  		  lock=""
  	  fi
  	  # Skip stopped LXCs
  	  if [[ "$status" != "running" ]]; then
  		  echo "$vmid ($name) is $status"
  		  continue
  	  fi
  	  # Check systemd status
  	  systemd_status=$(pct exec "$vmid" -- systemctl is-system-running)
  	  echo "$vmid ($name) is $systemd_status"
  	  if [[ "$systemd_status" != "running" ]]; then
  		  exit 1
  	  fi
  	done
  args:
    executable: /bin/bash
  when: reboot_required_file.stat.exists
  retries: 3
  delay: 30
  register: lxc_wait_result
  until: lxc_wait_result.rc == 0

- name: Show wait for LXCs to finish booting output
  debug: msg="{{ lxc_wait_result.stdout_lines }}"
  when: reboot_required_file.stat.exists
```

## Next Steps

Now that you've automated Proxmox updates with Ansible, consider expanding and modifying these playbooks to your liking and cover any other maintenance tasks.
By refining your automations, you _hopefully_ save some time and make your homelab a more reliable environment!
