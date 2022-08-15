#!/bin/bash

# Set timezone
ln -sf /usr/share/zoneinfo/Asia/Makassar /etc/localtime
# Generate /etc/adjtime
hwclock --systohc

# Set Localization
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Set system locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Network configuration
echo "### Network Configuration ###"
echo -n "Hostname: "
read hostname
echo "$hostname" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $hostname.localdomain $hostname" >> /etc/hosts

# Set root password
echo "### Root Password ###"
passwd

# Boot loader
pacman -S grub intel-ucode
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Enabling Network Manager
pacman -S networkmanager network-manager-applet
systemctl enable NetworkManager

# TRIM
systemctl enable fstrim.timer


printf "\e[1;32mDone! Type exit, umount -R /mnt and reboot.\e[0m"
