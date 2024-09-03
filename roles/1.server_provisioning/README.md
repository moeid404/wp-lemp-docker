# Ansible Playbook: System Package Management

This Ansible playbook is designed to manage system packages on Ubuntu-based systems. It ensures that the system's package cache is updated, all packages are upgraded, and essential tools such as `procps`, `vim`, and `ntp` are installed.

## Tasks Overview

1. **Update apt package cache:**
   - This task updates the apt package cache to ensure that the system has the latest information about available packages.

2. **Upgrade all apt packages:**
   - This task upgrades all installed packages to their latest versions, ensuring that the system is up-to-date with the latest security patches and features.

3. **Ensure `procps` package is installed:**
   - This task checks and installs the `procps` package, which provides utilities like `top` to monitor system processes.

4. **Install Vim:**
   - This task installs the `vim` text editor, a powerful tool for editing files directly from the command line.

5. **Install NTP:**
   - This task installs the Network Time Protocol (NTP) daemon, which is essential for synchronizing the system clock with remote servers.

## Usage

To execute this playbook, you need to have Ansible installed on your control node. Follow the steps below to run the playbook:

1. Clone this repository to your local machine.
2. Ensure you have SSH access to the target machines.
3. Run the playbook using the following command:

   ```bash
   ansible-playbook -i inventory playbook.yml
