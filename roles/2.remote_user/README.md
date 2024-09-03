# Ansible Playbook: User Creation and SSH Setup

This Ansible playbook is designed to automate the process of creating a user, setting up SSH access, and configuring sudo privileges on a remote server. Additionally, you can enable the option to create and configure a teammate user.

## Tasks Overview

### For Personal User Setup:

1. **Create User:**
   - This task creates a new user with the specified username, assigns `/bin/bash` as the default shell, adds the user to the `sudo` group, and creates a home directory.

2. **Create SSH Directory:**
   - This task ensures that the `.ssh` directory is created in the user's home directory, which is required for SSH key-based authentication.

3. **Copy SSH Public Key:**
   - This task copies the local SSH public key (`id_rsa.pub`) to the newly created user's `.ssh/authorized_keys` file on the remote server, allowing for SSH key-based login.

4. **Configure Sudo Access:**
   - This task adds the user to the `/etc/sudoers` file, granting them passwordless sudo privileges.

### (Optional): For Adding a Teammate

If you want to add a teammate to the server, you can enable the following tasks:

1. **Create Teammate User:**
   - Similar to the personal user setup, this task creates a new user for your teammate with sudo privileges.

2. **Create Teammate's SSH Directory:**
   - Ensures that the teammate's `.ssh` directory is created.

3. **Copy Teammate's SSH Public Key:**
   - Copies the teammate's SSH public key to the `.ssh/authorized_keys` file for SSH key-based login.

4. **Configure Teammate's Sudo Access:**
   - Grants your teammate passwordless sudo privileges by adding them to the `/etc/sudoers` file.

## Variables
- `user_name`: The name of the user to be created.
- `teammate`: The name of the teammate user to be created (optional).

## Usage

To execute this playbook, you need to have Ansible installed on your control node. Follow the steps below to run the playbook:

1. Clone this repository to your local machine.
2. Ensure you have SSH access to the target machines.
3. Define the variables `user_name` and `teammate` (if applicable) in your inventory file or pass them as extra variables when running the playbook.
4. Run the playbook using the following command:

   ```bash
   ansible-playbook -i inventory playbook.yml --extra-vars "user_name=your_username"
   ansible-playbook -i inventory playbook.yml --extra-vars "teammate=your_teammate"
