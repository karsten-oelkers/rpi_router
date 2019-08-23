#!/bin/bash

LAN="eth0"
WAN1="eth1"
WAN2="wlan0"
WAN="wwan0"

sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE
sudo iptables -t nat -A postrouting -o $WAN1 -j MASQUERADE
sudo iptables -A FORWARD -i $WAN -o $LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $WAN1 -o $LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT
sudo iptables -A FORWARD -i $LAN -o $WAN1 -j ACCEPT



