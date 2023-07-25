#!/bin/bash

# Make sure to boot into the Arch Linux ISO and ensure an internet connection is available.
pacman -Sy --needed --noconfirm archlinux-keyring
# Verify that the NVMe partitions are available
lsblk

# Assuming /dev/nvme0n1p7 is the root partition and /dev/nvme0n1p8 is the boot partition
root_partition="/dev/nvme0n1p9"
boot_partition="/dev/nvme0n1p8"

# Update the system clock
timedatectl set-ntp true

# Format the root partition (ext4 filesystem)
mkfs.ext4 "$root_partition"

# Mount the root partition
mount "$root_partition" /mnt

# Create a new directory for systemd-boot and mount the boot partition
mkdir /mnt/boot_systemd
mount "$boot_partition" /mnt/boot_systemd

# Pacstrap essential packages
pacstrap /mnt base base-devel linux linux-firmware

# Generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt

# Set the time zone (change 'Region' and 'City' to your timezone)
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

# Generate /etc/adjtime
hwclock --systohc

# Uncomment 'en_US.UTF-8 UTF-8' in /etc/locale.gen to generate the locale
# and then run locale-gen
sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
locale-gen

# Set the LANG variable in /etc/locale.conf
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set the hostname (change 'yourhostname' to your desired hostname)
echo "archlinux" > /etc/hostname

# Add matching entries to /etc/hosts
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   yourhostname.localdomain  yourhostname" >> /etc/hosts

# Set the root password
passwd

# Create a new user (change 'username' to your desired username)
useradd -m -G wheel -s /bin/bash shaquibimdad

# Set the password for the new user
passwd shaquibimdad

# Allow the new user to execute administrative tasks with sudo
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Install and configure systemd-boot
bootctl --path=/boot_systemd install

# Create a new boot entry for Arch Linux
cat <<EOF > /boot_systemd/loader/entries/arch.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=PARTUUID=$(blkid -s PARTUUID -o value "$root_partition") rw
EOF


# Update the bootloader
bootctl --path=/boot_systemd update

# Exit chroot
exit

# Unmount all partitions
umount -R /mnt

# Reboot the system
reboot
