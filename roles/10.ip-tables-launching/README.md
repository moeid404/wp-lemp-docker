# Configuring IPTables Firewall Role

This role is responsible for setting up iptables firewall rules on the server to secure the environment by allowing only the necessary traffic and blocking everything else. It ensures that the Nginx and PHP-FPM containers can communicate with each other, and that the MariaDB database can accept and respond to connections 

## Tasks Overview

The role performs the following tasks:

1. **Copy the iptables Configuration Script to the Server**  
   Copies a shell script that configures the iptables rules to the `/usr/local/bin/` directory on the remote server.

2. **Execute the iptables Configuration Script**  
   Runs the script to apply the iptables rules, ensuring that only necessary traffic is allowed.

3. **Restart Docker Service to Apply iptables Changes**  
   Restarts the Docker service to ensure that the iptables changes take effect and that Docker can properly manage network traffic.

4. **Restart Nginx and PHP-FPM Containers Using Docker Compose**  
   Restarts the Nginx and PHP-FPM containers to ensure they are running with the updated firewall settings.

## Script Details

The iptables script (`configure_firewall.sh`) contains the following rules:

- **Flush Existing Rules**: Clears all current iptables rules to start with a clean slate.
- **Allow Loopback Traffic**: Permits traffic on the loopback interface (`lo`), which is necessary for internal server communication.
- **DNS Traffic**: Allows outgoing DNS queries and their responses.
- **Docker Traffic**: Permits all necessary traffic for Docker-related interfaces.
- **HTTP and HTTPS Traffic**: Allows incoming and outgoing web traffic on ports 80 (HTTP) and 443 (HTTPS).
- **SSH Access**: Allows SSH connections on port 22 to enable remote administration.
- **Nginx and PHP-FPM Communication**: Permits traffic between Nginx and PHP-FPM on port 9000.
- **MariaDB Communication**: Allows MariaDB (MySQL) traffic on port 3306 for database interactions and to allow incoming connections on this port from the Nginx and PHP-FPM containers to the host. .
- **Default Policies**: Sets the default policies to drop all incoming, outgoing, and forwarding traffic that isn’t explicitly allowed.
- **Persist Rules**: Saves the iptables rules so they persist after a reboot.

## Usage

Include this role in your playbook to automatically apply the firewall configuration to your server:

**Example Playbook:**

```yaml
- hosts: all
  roles:
    - Configure_Firewall

