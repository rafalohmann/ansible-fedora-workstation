# Fedora 41+ Workstation Setup with Ansible

This repository contains an Ansible playbook for setting up and configuring a Fedora 41+ workstation. It includes roles for desktop, development, minimal setup, security, and utilities, allowing for a highly customizable and efficient provisioning process.

## Features

- **Desktop**: Sets up the GNOME desktop environment and related utilities.
- **Development**: Installs tools for developers, including programming languages and environments.
- **Minimal**: Provides essential system packages and performance tweaks.
- **Security**: Configures firewall, encryption, secure boot, and more.
- **Utilities**: Installs CLI tools, media codecs, and graphical applications.

## Prerequisites

1. Install Fedora 41 or later on your machine.
2. Install Ansible:

```bash
sudo dnf install ansible -y
```

3. Clone this repository:

```bash
git clone https://github.com/rafalohmann/ansible-fedora-workstation.git
cd ansible-fedora-workstation
```

## Usage

### Running the Playbook

To run the playbook for all roles:

```bash
ansible-playbook -i localhost, main.yml
```

### Using Tags

Ansible tags allow you to run specific parts of the playbook, focusing only on the roles or tasks you need. Here's how to use them:

1. **List all available tags:**

```bash
ansible-playbook -i localhost, main.yml --list-tags
```

2. **Run tasks with specific tags:**
   Use the `--tags` option to execute tasks associated with specific tags. For example:

```bash
ansible-playbook -i localhost, main.yml --tags "desktop"
```

3. **Exclude specific tags:**
   Use the `--skip-tags` option to skip tasks associated with certain tags. For example:

```bash
ansible-playbook -i localhost, main.yml --skip-tags "security"
```

### Tag Reference

Below is a detailed reference of tags and their purposes, including the **main tags** and their corresponding sub-tags:

| **Tag**                 | **Category**          | **Description**                                                            |
| ----------------------- | --------------------- | -------------------------------------------------------------------------- |
| `desktop`               | Main Tag              | Sets up the GNOME desktop environment, including extensions and utilities. |
| `desktop_packages`      | Sub-Tag (desktop)     | Installs base desktop packages for GNOME.                                  |
| `desktop_utilities`     | Sub-Tag (desktop)     | Installs additional desktop utilities.                                     |
| `boot_graphical_target` | Sub-Tag (desktop)     | Configures the system to boot into a graphical interface.                  |
| `gnome_extensions`      | Sub-Tag (desktop)     | Manages GNOME extensions for customization.                                |
| `development`           | Main Tag              | Sets up development tools and environments.                                |
| `dev_tools`             | Sub-Tag (development) | Installs essential development tools.                                      |
| `pyenv`                 | Sub-Tag (development) | Configures Pyenv for managing Python versions.                             |
| `nvm`                   | Sub-Tag (development) | Configures NVM for managing Node.js versions.                              |
| `minimal`               | Main Tag              | Configures minimal setup, including base packages and performance tweaks.  |
| `base_distro`           | Sub-Tag (minimal)     | Updates system packages and sets up a minimal environment.                 |
| `system_tweaks`         | Sub-Tag (minimal)     | Applies performance optimizations.                                         |
| `security`              | Main Tag              | Configures security features like encryption and secure boot.              |
| `firewall`              | Sub-Tag (security)    | Enables and configures the firewall.                                       |
| `encryption`            | Sub-Tag (security)    | Ensures the system uses disk encryption.                                   |
| `secure_boot`           | Sub-Tag (security)    | Ensures secure boot is enabled in BIOS/UEFI.                               |
| `screen_lock`           | Sub-Tag (security)    | Configures automatic screen locking.                                       |
| `utilities`             | Main Tag              | Installs additional tools for productivity and media handling.             |
| `cli`                   | Sub-Tag (utilities)   | Installs essential command-line utilities.                                 |
| `codecs`                | Sub-Tag (utilities)   | Installs media codecs for audio and video playback.                        |
| `gui`                   | Sub-Tag (utilities)   | Installs graphical applications.                                           |

### Examples

- **Run only the development role:**

```bash
ansible-playbook -i localhost, main.yml --tags "development"
```

- **Skip security-related tasks:**

```bash
ansible-playbook -i localhost, main.yml --skip-tags "security"
```

- **Run desktop and utilities tasks together:**

```bash
ansible-playbook -i localhost, main.yml --tags "desktop,utilities"
```
