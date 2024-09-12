# Role: Obtaining SSL certificate 

This Ansible role automates the process of obtaining SSL certificates for a specified domain using Certbot. The SSL certificates are issued by Let's Encrypt and are stored on the remote server.

## Tasks Overview

1. **Install Certbot:**
   - Ensures Certbot is installed on the remoter server.

2. **Obtain SSL Certificate:**
   - This task uses Certbot to obtain an SSL certificate for the specified domain. The certificate is generated in standalone mode, meaning that Certbot temporarily runs its own web server to perform the domain validation..

## Variables

The following variables are used in this role and should be defined in your inventory file orvars file:

- `domain_name`: Domain for the SSL certificate  (e.g., `domain.example.com`).
- `ssl_email`: Email for Let's Encrypt notifications (e.g., `youremail@example.com`).

## Usage

Include this role in your main playbook:

```yaml
- hosts: your_hosts
  roles:
    - Obtaining_SSL_certificate
  vars:
    domain_name: "yourdomain.com"
    ssl_email: "youremail@example.com"

