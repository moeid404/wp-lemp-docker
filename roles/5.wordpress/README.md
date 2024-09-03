# Ansible Playbook: WordPress Setup with Nginx

This Ansible playbook automates the setup of a WordPress installation on an Nginx web server. It includes tasks to create necessary directories, download and extract WordPress files, set file permissions, and configure the WordPress installation.

## Tasks Overview

1. **Create Mounted Nginx Directory:**
   - Ensures that the `/var/www/html/` directory exists, which is the default web root directory for Nginx.

2. **Download and Extract WordPress Files:**
   - Downloads the latest WordPress archive from the official WordPress website and extracts it into the `/var/www/html/` directory.
   - The files are owned by the `www-data` user and group, with permissions set to `0755`.

3. **Set Permissions for Files:**
   - Sets file permissions to `644` for all files in the WordPress directory to ensure they are properly secured.

4. **Delete `wp-config-sample.php`:**
   - Removes the `wp-config-sample.php` file from the WordPress directory to prevent confusion and ensure only the actual configuration file is present.

5. **Copy `wp-config.php`:**
   - Uses a Jinja2 template to generate a `wp-config.php` file from a template (`wp-config.php.j2`) and copies it to the WordPress directory. This file contains the necessary configuration settings for your WordPress installation.

## Variables

- `app_name`: The name of the application, which is used to fetch the WordPress files and define the WordPress directory within the `/var/www/html/` path.

## Usage

To execute this playbook, you need to have Ansible installed on your control node. Follow the steps below to run the playbook:

1. Clone this repository to your local machine.
2. Ensure you have SSH access to the target machines.
3. Define the `app_name` variable in your inventory file or pass it as an extra variable when running the playbook.
4. Run the playbook using the following command:

   ```bash
   ansible-playbook -i inventory playbook.yml --extra-vars "app_name=wordpress"
