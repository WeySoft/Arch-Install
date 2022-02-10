#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo pacman -S --noconfirm xorg sddm plasma konsole firefox vlc telegram-desktop code ttf-liberation wine lutris

sudo flatpak install -y spotify 

sudo systemctl enable sddm
