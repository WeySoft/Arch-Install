# Arch-Install
Basic Archinstallscript

Steps for installing Arch:

1. If needed, load your keymap
2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git vim amd-ucode (or intel-ucode ))
7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
8. Chroot in with arch-chroot /mnt
9. Download the git repository with git clone https://github.com/weysoft/arch-install
10. cd arch-basic
11. chmod +x base-install.sh
12. run with ./base-install.sh
