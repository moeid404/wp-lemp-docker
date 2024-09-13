# SSH Configuration Role

This role is designed to configure the SSH server (`sshd`) on a remote machine to enhance security by changing the default settings.

## Tasks Overview

1. **Change SSH Port:**
   - This task modifies the SSH configuration to change the default SSH port from 22 to a custom port specified by the `port` variable. Changing the SSH port helps reduce the risk of automated attacks on the default port.

2. **Disable Root Login:**
   - This task configures SSH to disallow direct root login by setting `PermitRootLogin` to `no`. Disabling root login enhances security by requiring users to log in with a non-root account and then elevate privileges.

3. **Enable Public Key Authentication:**
   - This task ensures that SSH is configured to use public key authentication by setting `PubkeyAuthentication` to `yes`. Public key authentication is more secure than password-based authentication.

4. **Disable Password Authentication:**
   - This task disables password authentication for SSH, requiring all users to use SSH key pairs instead. This further enhances security by preventing brute-force password attacks.

5. **Restart SSHD** 
   - Restarts the SSH service to apply the changes made to the `sshd_config` file.


## Variables

- `port`: The port used by Ansible to connect to the remote server. Default is `22`. This variable allows you to specify a different port if you have customized SSH settings on your server.

## Usage

Include this role in your playbook to configure the SSH server:

**Example Playbook:**

```yaml
- hosts: all
  roles:
    - ssh_configuration
```


## Author Information

This role was created in 2024 by **Mohamed Eid**.

