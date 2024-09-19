# Applying iptables Rules Role

This role is responsible for setting up iptables firewall rules on the server to secure the environment by allowing only the necessary traffic and blocking everything else. It ensures that the Nginx and PHP-FPM containers can communicate with each other, and that the MariaDB database can accept and respond to connections

## Overview

The role performs the following tasks:

1. **Install `iptables-persistent` Package**  
   Installs the `iptables-persistent` package to ensure that iptables rules persist across system reboots.

2. **Apply iptables Rules**  
   Executes a custom script (`firewall-rules.sh`) that defines and applies the necessary iptables rules to the server.

## iptables Rules Script

The `firewall-rules.sh` script includes the following actions:

1. **Flush, Delete Chains, and Zero All Packets**  
   Flushes (`-F`), deletes chains (`-X`), and zeros packet counters (`-Z`) to reset all existing iptables rules.

2. **DNS Resolving**  
   Allows DNS traffic (port 53) for both input and output.

3. **Internal Connections**  
   - **Loopback Interface**: Permits all traffic on the loopback interface.  
   - **MariaDB**: Allows traffic to and from the MariaDB database on port 3306.  
   - **Docker to Host**: Enables communication between Docker containers and the host.  
   - **Nginx and PHP-FPM Containers**: Allows traffic between Nginx and PHP-FPM containers on port 9000.

4. **Incoming Connections**  
   - **HTTP**: Allows incoming HTTP traffic on port 80.  
   - **HTTPS**: Allows incoming HTTPS traffic on port 443.  
   - **SSH**: Permits SSH connections on port 22.

5. **Outgoing Connections**  
   - **HTTP**: Allows outgoing HTTP traffic on port 80.  
   - **HTTPS**: Allows outgoing HTTPS traffic on port 443.

6. **Apply Docker Chains**  
   Restarts Docker and brings up the services defined in the Docker Compose file.

7. **Set Default Policies**  
   Sets the default policy to `DROP` for all chains (INPUT, OUTPUT, FORWARD).

8. **Save Rules**  
   Saves the iptables rules using `netfilter-persistent`.

## Usage

Include this role in your playbook and ensure that the `firewall-rules.sh` script is available within the role’s files directory:


**Example Playbook:**

```yaml
- hosts: all
  roles:
    - Apply_iptables_Rules
```


## Author Information

This role was created in 2024 by **Bahy Ahmed**.
