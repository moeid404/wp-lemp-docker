# Template Configuration and Launch Containers Role

This role is responsible for setting up and launching Nginx and PHP-FPM containers using Docker Compose. It handles creating necessary directories, templating configuration files, and starting the containers.

## Overview

The role performs the following tasks:

1. **Create Required Directories**  
   Ensures that the necessary directories for Nginx, PHP-FPM, and Docker Compose are created on the remote server.

2. **Template and Deploy Nginx Configuration**  
   Uses a Jinja2 template to generate the Nginx configuration file and deploy it to the specified path on the remote server.

3. **Deploy PHP-FPM Configuration**  
   Copies the PHP-FPM configuration file (`www.conf`) to the specified path on the remote server.

4. **Template and Deploy Docker Compose File**  
   Uses a Jinja2 template to generate the Docker Compose file and deploy it to the specified path on the remote server.

5. **Deploy Dockerfile**  
   Copies the Dockerfile to the specified path on the remote server.

6. **Start Services Using Docker Compose**  
   Runs `docker-compose up -d` to start the Nginx and PHP-FPM services in detached mode.

## Variables

The following variables are used in this role and should be defined in your Ansible playbook or vars files:

### Role-Specific Variables

- **`docker_compose_path`**: The path where the Docker Compose file will be deployed.  
  Example: `/srv/docker/docker-compose.yml`.

- **`dockerfile_path`**: The path where the Dockerfile will be deployed.  
  Example: `/srv/docker/Dockerfile`.

### Docker Compose Template Variables

The Docker Compose template (`docker-compose.yml.j2`) uses the following variables to configure the services:

- **`nginx_image`**: The Docker image to use for the Nginx container.  
  Default: `nginx`.

- **`nginx_container_name`**: The name of the Nginx container.  
  Default: `nginx_container`.

- **`nginx_conf_path`**: The path to the Nginx configuration file inside the container.  
  Example: `/etc/nginx/conf.d/nginx.conf`.

- **`wordpress_path`**: The path to the WordPress installation directory.  
  Default: `/var/www/html/wordpress`.

- **`php_fpm_image`**: The Docker image to use for the PHP-FPM container.  
  Default: `php_fpm_custom_image`.

- **`php_fpm_container_name`**: The name of the PHP-FPM container.  
  Default: `php_fpm_container`.

- **`php_fpm_conf_path`**: The path to the PHP-FPM configuration file inside the container.  
  Example: `/usr/local/etc/php-fpm.d/www.conf`.

- **`app_network`**: The Docker network to which the containers will be connected.  
  Default: `app`.

### Nginx Template Variables

The Nginx configuration template (`nginx.conf.j2`) uses the following variables:

- **`ssl_cert_path`**: The path to the SSL certificate file used by Nginx.  
  Example: `/etc/letsencrypt/live/{{ domain_name }}/fullchain.pem`.

- **`ssl_key_path`**: The path to the SSL certificate key file used by Nginx.  
  Example: `/etc/letsencrypt/live/{{ domain_name }}/privkey.pem`.

- **`wordpress_root`**: The root directory of the WordPress installation on the server.  
  Example: `/var/www/html/wordpress`.

- **`domain_name`**: The domain name for the Nginx server configuration.  
  Example: `training.mikkawy.space`.

## Usage

Include this role in your playbook and ensure that the required variables are defined in a `vars` file or inventory file or in the main playbook like the upcoming example.

**Example Playbook:**

```yaml
- hosts: webservers
  vars:
    domain_name: training.mikkawy.space
    docker_compose_path: /srv/docker/docker-compose.yml
    dockerfile_path: /srv/docker/Dockerfile
    nginx_image: nginx
    nginx_container_name: nginx_container
    nginx_conf_path: /etc/nginx/conf.d/nginx.conf
    wordpress_path: /var/www/html/wordpress
    php_fpm_image: php_fpm_custom_image
    php_fpm_container_name: php_fpm_container
    php_fpm_conf_path: /usr/local/etc/php-fpm.d/www.conf
    app_network: app
    ssl_cert_path: /etc/letsencrypt/live/{{ domain_name }}/fullchain.pem
    ssl_key_path: /etc/letsencrypt/live/{{ domain_name }}/privkey.pem
    wordpress_root: /var/www/html/wordpress
  roles:
    - template_and_launch_containers
```

## Author Information

This role was created in 2024 by **Bahy Ahmed**.

