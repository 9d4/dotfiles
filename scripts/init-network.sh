#!/bin/bash

set -e

echo ">>> Installing networking tools..."
sudo pacman -Sy --noconfirm iwd systemd-resolvconf

echo ">>> Configuring systemd-networkd for Ethernet..."
sudo mkdir -p /etc/systemd/network
sudo tee /etc/systemd/network/20-wired.network > /dev/null <<EOF
[Match]
Name=en*

[Link]
RequiredForOnline=routeable

[Network]
DHCP=yes
MulticastDNS=yes

[DHCPv4]
RouteMetric=100

[IPv6AcceptRA]
RouteMetric=100
EOF

echo ">>> Configuring iwd for Wi-Fi management..."
sudo mkdir -p /etc/iwd
sudo tee /etc/iwd/main.conf > /dev/null <<EOF
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
EOF

echo ">>> Enabling networking services..."
sudo systemctl enable --now systemd-networkd
sudo systemctl enable --now systemd-resolved
sudo systemctl enable --now iwd

echo ">>> Linking resolv.conf to systemd-resolved stub..."
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo ">>> Network setup complete."
echo ">>> Use 'iwctl' to connect to Wi-Fi if needed."
