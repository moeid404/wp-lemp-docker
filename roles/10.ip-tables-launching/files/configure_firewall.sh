#!/bin/bash

# Flush all existing rules
iptables -F   # Flush all chains (i.e., remove rules)
iptables -X   # Delete all user-defined chains
iptables -Z   # Zero the packet and byte counters in all chains

# Allow loopback interface traffic (internal server communication)
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow DNS queries (UDP, port 53)
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT

# Allow Docker-related traffic
iptables -A INPUT -i docker0 -j ACCEPT
iptables -A FORWARD -o docker0 -j ACCEPT
iptables -A FORWARD -i docker0 -o docker0 -j ACCEPT
iptables -A OUTPUT -o docker0 -j ACCEPT

# Allow All incoming connections from HTTP and HTTPS
iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming SSH connections from admins
iptables -A INPUT -p tcp --dport 5192 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 5192 -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# Allow outgoing HTTP and HTTPS connections
iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Allow Nginx-PHP-FPM communication
iptables -A INPUT -p tcp --dport 9000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 9000 -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Allow MariaDB communication (MySQL) from containers
iptables -A INPUT -p tcp --dport 3306 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Apply Docker Chains & Launching containers
sudo systemctl restart docker
sudo docker-compose -f /srv/docker-compose.yml up -d

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

#Saving rules:
netfilter-persistent save

