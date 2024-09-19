# Ansible Playbook: Docker and Docker Compose Installation

This Ansible playbook automates the installation of Docker and Docker Compose on an Ubuntu server. It includes tasks to install necessary dependencies, add Docker's official GPG key and APT repository, install Docker CE, download Docker Compose, and configure the user environment.

## Tasks Overview

#### Update and Install Required Packages:
- **Update apt package index:**
  - Updates the APT package index to ensure the latest package information is retrieved.
  
- **Ensure curl is installed:**
  - Installs `curl`, which is required for downloading resources.

- **Install required packages for Docker:**
  - Installs the necessary packages to allow `apt` to use a repository over HTTPS.

#### Install Docker:
- **Add Docker GPG key:**
  - Downloads and adds Docker's official GPG key to your system to ensure the authenticity of the Docker APT repository.

- **Add Docker APT repository:**
  - Adds Docker's official APT repository to your system's sources list and updates the package cache.

- **Install Docker CE:**
  - Installs Docker Community Edition (CE) from the official Docker repository.

#### Install Docker Compose:
- **Download Docker Compose binary:**
  - Downloads the Docker Compose binary from the official GitHub repository and makes it executable.

- **Verify Docker Compose installation:**
  - Runs a command to verify that Docker Compose was installed correctly and displays the installed version.

### Docker User Configuration

- **Ensure DOCKER_HOST is set in `.bashrc`:**
  - Adds an environment variable `DOCKER_HOST` to the `.bashrc` file to configure Docker to use the Unix socket.

- **Source the `.bashrc` to apply changes:**
  - Sources the `.bashrc` file to apply the changes made, so they take effect immediately.

- **Ensure the docker group exists:**
  - Checks if the `docker` group exists on the system, creating it if necessary.

- **Add user to the docker group:**
  - Adds the specified user to the `docker` group, allowing them to run Docker commands without needing `sudo`.

## Variables

- `user_name`: The username of the account that will be configured to run Docker commands without `sudo`.

## Usage


Include this role in your playbook to ensure that Docker and Docker-compose are installed

**Example Playbook:**

```yaml
- hosts: all
  roles:
    - Docker_installation
```


## Author Information

This role was created in 2024 by **Mohamed Eid**.

