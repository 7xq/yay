import subprocess

subprocess.run(["rm", "-f", "/etc/pacman.d/mirrorlist"], check=True)
mirror_url = "https://mirror.osbeck.com/archlinux/\$repo/os/\$arch"
subprocess.run(["echo", f"Server = {mirror_url}", "|", "sudo", "tee", "-a", "/etc/pacman.d/mirrorlist"], check=True)

# Install the archlinux-keyring package
subprocess.run(["pacman", "-Sy", "--needed", "--noconfirm", "archlinux-keyring"], check=True)

# Assuming /dev/nvme0n1p7 is the root partition and /dev/nvme0n1p8 is the boot partition
root_partition = "/dev/nvme0n1p9"
boot_partition = "/dev/nvme0n1p8"

# Update the system clock
subprocess.run(["timedatectl", "set-ntp", "true"], check=True)

# Format the root partition (ext4 filesystem)
subprocess.run(["mkfs.ext4", root_partition], check=True)

# Mount the root partition
subprocess.run(["mount", root_partition, "/mnt"], check=True)

# Create a new directory for systemd-boot and mount the boot partition
subprocess.run(["mkdir", "/mnt/boot_systemd"], check=True)
subprocess.run(["mount", boot_partition, "/mnt/boot_systemd"], check=True)

# Pacstrap essential packages
subprocess.run(["pacstrap", "/mnt", "base", "linux", "linux-firmware"], check=True)

# Generate the fstab file
subprocess.run(["genfstab", "-U", "/mnt"], check=True)

# Chroot into the new system and complete the setup inside the chroot environment
chroot_commands = [
    f'ln -sf /usr/share/zoneinfo/Region/City /etc/localtime',
    'hwclock --systohc',
    'sed -i \'/^#en_US.UTF-8 UTF-8/s/^#//\' /etc/locale.gen',
    'locale-gen',
    'echo "LANG=en_US.UTF-8" > /etc/locale.conf',
    'echo "arch" > /etc/hostname',
    'echo "127.0.0.1   localhost" >> /etc/hosts',
    'echo "::1         localhost" >> /etc/hosts',
    'echo "127.0.1.1   arch.localdomain  arch" >> /etc/hosts',
    'passwd',
    'useradd -m -G wheel -s /bin/bash shaquibimdad',
    'passwd shaquibimdad',
    'echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers',
    'bootctl --path=/boot_systemd install',
    f'cat > /boot_systemd/loader/entries/archpp.conf << EOF\n'
    f'title   Arch Linuxpp\n'
    f'linux   /vmlinuz-linux\n'
    f'initrd  /initramfs-linux.img\n'
    f'options root=PARTUUID=$(blkid -s PARTUUID -o value "{root_partition}") rw\n'
    f'EOF',
    'bootctl --path=/boot_systemd update'
]

chroot_command = f'arch-chroot /mnt /bin/bash -c "{"; ".join(chroot_commands)}"'
subprocess.run(chroot_command, shell=True, check=True)

# Unmount all partitions
subprocess.run(["umount", "-R", "/mnt"], check=True)

# Reboot the system
subprocess.run(["reboot"], check=True)
