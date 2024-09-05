# Launching Nginx and PHP-FPM Containers Role

This role is responsible for deploying and launching Nginx and PHP-FPM containers using Docker Compose. It templates the Docker Compose file and Dockerfile, and then starts the containers.

## Overview

The role performs the following tasks:

1. **Create and Deploy Docker Compose File**  
   Uses a Jinja2 template to generate the Docker Compose file and deploy it to the specified path on the remote server.

2. **Deploy Dockerfile**  
   Copies the Dockerfile to the specified path on the remote server. This Dockerfile is used to build the custom PHP-FPM image.

3. **Start Services Using Docker Compose**  
   Runs `docker-compose up -d` to start the Nginx and PHP-FPM services in detached mode.

## Variables

The following variables are used in this role and should be defined in your Ansible playbook or inventory file:

- **`docker_compose_path`**: The path where the Docker Compose file will be deployed. Example: `/srv/docker-compose.yml`.
- **`dockerfile_path`**: The path where the Dockerfile will be deployed. Example: `/srv/Dockerfile`.

## Docker Compose Template Variables

The Docker Compose template (`docker-compose.yml.j2`) uses the following variables to configure the services:

- **`nginx_image`**: The Docker image to use for the Nginx container. Default value: `nginx`.
- **`php_fpm_image`**: The Docker image to use for the PHP-FPM container. Default value: `php_fpm_custom_image`. Change this if using a different custom image.
- **`nginx_container_name`**: The name of the Nginx container. Default value: `nginx_container`.
- **`php_fpm_container_name`**: The name of the PHP-FPM container. Default value: `php_fpm_container`.
- **`wordpress_path`**: The path to the WordPress installation directory. Default value: `/var/www/html/wordpress`.
- **`app_network`**: The Docker network to which the containers will be connected. Default value: `app-network`.

## Usage

Include this role in your playbook and ensure that the required variables are defined in a `vars` file or inventory file:

**Example Playbook:**

```yaml
- hosts: all
  vars_files:
    - vars.yml
  roles:
    - Launch_Containers

