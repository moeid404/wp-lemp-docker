# Templating Configuration Files Role

This role is responsible for templating and deploying the configuration files for Nginx and PHP-FPM to a remote server. It ensures that the necessary directories exist and then uses Jinja2 templates to create the configuration files.

## Overview

The role performs the following tasks:

1. **Ensure Nginx `conf.d` Directory Exists**  
   Ensures that the directory `/etc/nginx/conf.d/` exists on the remote server with the correct permissions.

2. **Ensure PHP-FPM Configuration Directory Exists**  
   Ensures that the directory `/usr/local/etc/php-fpm.d/` exists on the remote server with the correct permissions.

3. **Create Nginx Configuration from Template**  
   Uses a Jinja2 template to generate the Nginx configuration file and deploys it to the specified path on the remote server.

4. **Create PHP-FPM Configuration from Template**  
   Uses a Jinja2 template to generate the PHP-FPM configuration file and deploys it to the specified path on the remote server.

## Variables

The following variables are used in this role and should be defined in your Ansible playbook or inventory , vars file:

- **`nginx_conf_path`**: The path where the Nginx configuration file will be deployed.
- **`php_fpm_conf_path`**: The path where the PHP-FPM configuration file will be deployed.
- **`ssl_cert_path`**: The path to the SSL certificate file, typically stored in `/etc/letsencrypt/live/{{ domain_name }}/fullchain.pem`.
- **`ssl_key_path`**: The path to the SSL certificate's private key, typically stored in `/etc/letsencrypt/live/{{ domain_name }}/privkey.pem`.
- **`wordpress_root`**: The root directory of the WordPress installation, typically `/var/www/html/wordpress`.

## Template Variables

The Nginx template (`nginx.conf.j2`) and PHP-FPM template (`php-fpm.conf.j2`) use the following variables:

- **`ssl_cert_path`**: The full path to the SSL certificate file.
- **`ssl_key_path`**: The full path to the SSL private key file.
- **`wordpress_root`**: The root directory for WordPress files.

These variables allow you to customize the generated configuration files based on your environment.

## Usage

Include this role in your playbook as follows:

```yaml
- hosts: all
  roles:
    - Templating_Config_Files
  vars:
    nginx_conf_path: "/etc/nginx/conf.d/wordpress.conf"
    php_fpm_conf_path: "/usr/local/etc/php-fpm.d/www.conf"
    ssl_cert_path: "/etc/letsencrypt/live/yourdomain.com/fullchain.pem"
    ssl_key_path: "/etc/letsencrypt/live/yourdomain.com/privkey.pem"
    wordpress_root: "/var/www/html/wordpress"

