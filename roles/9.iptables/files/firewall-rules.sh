#!/bin/bash
#[FLush,Delete-Chains and Zero all packets]
iptables -F
iptables -X
iptables -Z

#[DNS Resolving]
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

#[Internal connections]
#1#loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
#2#MariaDB
iptables -A INPUT -p tcp --dport 3306 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -m conntrack --ctstate E -j ACCEPT
#3#Docker [Docker Container >> Host]
iptables -A INPUT -i docker_app -j ACCEPT          # docker: the work directory for Docker, app: the container network name
iptables -A OUTPUT -o docker_app -j ACCEPT
#4#Communication Nginx and PHP-FPM containers
iptables -A INPUT -i docker_app -p tcp --dport 9000 -j ACCEPT
iptables -A OUTPUT -i docker_app -p tcp --sport 9000 -j ACCEPT

#[Incoming connections] [User >> SERVER]
#1#HTTP
iptables -A INPUT  -p tcp --dport 80 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -m conntrack --ctstate E -j ACCEPT
#2#HTTPS
iptables -A INPUT  -p tcp --dport 443 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -m conntrack --ctstate E -j ACCEPT
#3#SSH
iptables -A INPUT  -p tcp --dport 22 -m conntrack --ctstate N,E -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate E -j ACCEPT

#[Outgoing connection] [Server >> Outside]
#1#HTTP
iptables -A OUTPUT -p tcp --dport 80 -m conntrack --ctstate N,E -j ACCEPT 
iptables -A INPUT -p tcp --sport 80 -m conntrack --ctstate E -j ACCEPT
#2#HTTPS
iptables -A OUTPUT -p tcp --dport 443 -m conntrack --ctstate N,E -j ACCEPT
iptables -A INPUT  -p tcp --sport 443 -m conntrack --ctstate E -j ACCEPT

#Apply Docker Chains
sudo systemctl restart docker
sudo docker-compose -f /srv/docker/docker-compose.yml up -d

#[Default POLICIES]
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#Saving rules:
netfilter-persistent save