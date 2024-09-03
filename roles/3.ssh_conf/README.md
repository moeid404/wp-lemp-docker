# Ansible Playbook: SSH Configuration

This Ansible playbook is designed to configure the SSH server (`sshd`) on a remote machine to enhance security by changing the default settings.

## Tasks Overview

1. **Change SSH Port:**
   - This task modifies the SSH configuration to change the default SSH port from 22 to a custom port specified by the `port` variable. Changing the SSH port helps reduce the risk of automated attacks on the default port.

2. **Disable Root Login:**
   - This task configures SSH to disallow direct root login by setting `PermitRootLogin` to `no`. Disabling root login enhances security by requiring users to log in with a non-root account and then elevate privileges.

3. **Enable Public Key Authentication:**
   - This task ensures that SSH is configured to use public key authentication by setting `PubkeyAuthentication` to `yes`. Public key authentication is more secure than password-based authentication.

4. **Disable Password Authentication:**
   - This task disables password authentication for SSH, requiring all users to use SSH key pairs instead. This further enhances security by preventing brute-force password attacks.

## Handlers

- **Restart SSHD:**
  - A handler is included to restart the SSH daemon (`sshd`) whenever the SSH configuration is modified. This ensures that all changes take effect immediately.

## Variables

- `port`: The SSH port number to use instead of the default port 22.

## Usage

To execute this playbook, you need to have Ansible installed on your control node. Follow the steps below to run the playbook:

1. Clone this repository to your local machine.
2. Ensure you have SSH access to the target machines.
3. Define the `port` variable in your inventory file or pass it as an extra variable when running the playbook.
4. Run the playbook using the following command:

   ```bash
   ansible-playbook -i inventory playbook.yml --extra-vars "port=your_port"
