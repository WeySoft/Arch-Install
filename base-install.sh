 #!/bin/sh

ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:$1hgdm,bmsN$ | chpasswd

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf


pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant base-devel linux-headers bluez bluez-utils cups hplip alsa-utils pulseaudio openssh flatpak

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd

useradd -m ws
echo ws:Sonnenstrasse6 | chpasswd
usermod -aG wheel ws

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/ws
