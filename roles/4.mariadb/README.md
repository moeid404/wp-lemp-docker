# Ansible Playbook: MariaDB Installation and Configuration

This Ansible playbook automates the installation and configuration of MariaDB on a remote server. It includes tasks to set up the MariaDB server, secure the installation, and create a database and user for a WordPress installation.

## Tasks Overview

1. **Install MariaDB Server and Dependencies:**
   - Installs the MariaDB server along with the required Python dependencies (`mariadb-server` and `python3-mysqldb`).
   - Updates the package cache to ensure the latest versions of the packages are installed.

2. **Ensure MariaDB Service is Running and Enabled:**
   - Starts the MariaDB service and ensures it is enabled to start on boot.

3. **Set Root Password for MariaDB:**
   - Configures the root password for the MariaDB server if a password is provided.

4. **Remove Anonymous Users:**
   - Removes anonymous users from the MariaDB server to enhance security.

5. **Create WordPress Database:**
   - Creates a database for WordPress using the specified database name.

6. **Create WordPress User:**
   - Creates a database user with all privileges on the WordPress database and assigns the specified password.

7. **Remove Test Database:**
   - Deletes the default `test` database to further secure the MariaDB installation.

8. **Reload Privilege Tables:**
   - Reloads the MariaDB privilege tables to ensure that all changes take effect.

9. **Ensure MariaDB Bind-Address is Set:**
   - Configures the MariaDB server to listen on a specific IP address by modifying the `bind-address` setting.

10. **Restart MariaDB:**
    - Restarts the MariaDB service to apply configuration changes.

## Variables

- `mariadb_root_password`: The root password for the MariaDB server.
- `wp_db_name`: The name of the WordPress database to be created.
- `wp_db_user`: The username for the WordPress database user.
- `wp_db_password`: The password for the WordPress database user.
- `wp_db_host`: The IP address that MariaDB will bind to.

## Usage

To execute this playbook, you need to have Ansible installed on your control node. Follow the steps below to run the playbook:

1. Clone this repository to your local machine.
2. Ensure you have SSH access to the target machines.
3. Define the necessary variables (`mariadb_root_password`, `wp_db_name`, `wp_db_user`, `wp_db_password`, `wp_db_host`) in your inventory file or pass them as extra variables when running the playbook.
4. Run the playbook using the following command:

   ```bash
   ansible-playbook -i inventory playbook.yml --extra-vars "mariadb_root_password=your_root_password wp_db_name=your_wp_db_name wp_db_user=your_wp_db_user wp_db_password=your_wp_db_password wp_db_host=your_wp_db_host"
