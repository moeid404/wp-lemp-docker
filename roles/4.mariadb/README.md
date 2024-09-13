# MariaDB Installation and Configuration Role

This Role automates the installation and configuration of MariaDB on a remote server. It includes tasks to set up the MariaDB server, secure the installation, and create a database and user for a WordPress installation.

## Tasks Overview

The role performs the following tasks:

1. **Install MariaDB Server and Dependencies**  
   Installs the MariaDB server and the necessary Python module for MySQL database management using `apt`. This ensures that the MariaDB server and its dependencies are up-to-date.

2. **Ensure MariaDB Service is Running and Enabled**  
   Starts the MariaDB service and enables it to start on boot. This ensures that the database server is always running and ready for connections.

3. **Create WordPress Database**  
   Creates a new database for WordPress using the `mysql_db` module. This database is required for WordPress to store its data.

4. **Create WordPress User**  
   Creates a new MySQL user with privileges to access the WordPress database. The user is granted all privileges on the database to allow WordPress to manage its content.

5. **Ensure MariaDB Bind-Address is Set to the Desired IP**  
   Configures the `bind-address` setting in the MariaDB configuration file to ensure that the server listens on the specified IP address. This is important for remote connections to the database.

6. **Restart MariaDB**  
   Restarts the MariaDB service to apply the changes made to the configuration file. This ensures that the new settings take effect.

## Variables

- **`wp_db_name`**: The name of the WordPress database to be created. Default is `wp`.

- **`wp_db_user`**: The username for the WordPress database user. Default is `wpuser`.

- **`wp_db_password`**: The password for the WordPress database user. This should be securely managed and provided as a secret.

- **`mariadb_root_password`**: The password for the MariaDB root user. This should be securely managed and provided as a secret.

- **`wp_db_host`**: The IP address on which MariaDB will listen. This is used in the `bind-address` configuration. Example IP: `164.92.238.108`.

## Usage

Include this role in your playbook to configure the MariaDB server for WordPress:

**Example Playbook:**

```yaml
- hosts: all
  roles:
    - mariadb
```


## Author Information

This role was created in 2024 by **Mohamed Eid**.

