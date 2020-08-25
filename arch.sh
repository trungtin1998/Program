# Bisically script installing Arch Linux and encrypt root partion by using LUKS

# Global variable
disk='/dev/nvme0n1'
efi_partition='${disk}p1'
boot_partition="${disk}p2"
root_partition="${disk}p3"
hostname='TF1T'
username='trungtin'
fullname='Trung Tin'

# Update the system clock
timedatectl set-ntp true
pacman -Syyy

# Partition the disk
gdisk /dev/nvme0n1
g

# EFI partition
n


+5012M
# Choose EFI Sytem
# 1: EF00
# 2: Type follow
EF00



# boot partition
n


+1G
# 8300
# root partition



n



w


# Configuring LUKS Encryption on the Disk
modprobe dm-crypt
modprobe dm-mod

# Encrypt root partition
cryptsetup luksFormat -y -v $root_partition
YES
cryptsetup open $root_partition luks_root

mkfs.vfat -n "EFI System Partition" /dev/nvme0n1p1
mkfs.ext4 -L boot /dev/nvme0n1p2
mkfs.ext4 -L root /dev/mapper/luks_root
mount /dev/mapper/luks_root /mnt
cd /mnt
mkdir boot
mount /dev/nvme0n1p2 boot
mkdir boot/efi
mount /dev/nvme0n1p1 boot/efi
dd if=/dev/zero of=swap bs=1M count=4096
mkswap swap
swapon swap
chmod 0600 swap

#+--------------+
#| Installation |
#+--------------+
# Select the mirrors
pacman -Syy
pacman --noconfirm --needed -S pacman-contrib
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
mirrorlist_generator='https://www.archlinux.org/mirrorlist/?country=SG&country=TH&country=VN&protocol=http&protocol=https&ip_version=4&use_mirror_status=on'

curl "$mirrorlist_generator" > /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
sed -i '/^##/d' /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist
rm /etc/pacman.d/mirrorlist.backup

pacstrap -i /mnt base base-devel efibootmgr grub linux linux-firmware
genfstab -U /mnt > /mnt/etc/fstab

# newly installed Arch Linux
arch-chroot /mnt
echo 'Enter Passwd ROOT: '
passwd

# Essential packages
pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector git bluez bluez-utils cups xdg-utils xdg-user-dirs pulseaudio-bluetooth

# Timezone and localization
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo '$hostname' > /etc/hostname
vim /etc/hosts
echo "127.0.0.1\tlocalhost\t$hostname" > /etc/hosts
echo "::1\tlocalhost\t$hostname" > /etc/hosts

# Network
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable org.cups.cupsd

# Pacman
sed -i 's/^#Color/Color/g;/#\[multilib\]/,/#Include/ s/^#//g' /etc/pacman.conf
pacman -Syy

# Users
useradd -m -G wheel -s /bin/zsh -c '$fulname' '$username'
echo "USER PASSWORD $username"
passwd '$username'


# Allow users in group wheel to use sudo
sed -i '/%wheel\sALL=(ALL)\sALL/s/^#\s//g' /etc/sudoers


vim /etc/default/grub
# Set
GRUB_CMDLINE_LINUX=”cryptdevice=/dev/nvme0n1p3:luks_root”

vim /etc/mkinitcpio.conf
# In the HOOKS section, add encrypt after block as shown in the marked section of the screenshot below. Then save the file

# Install GRUB
mkinitcpio -p linux
grub-install --boot-directory=/boot --efi-directory=/boot/efi /dev/nvme0n1p2
grub-mkconfig -o /boot/grub/grub.cfg
grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg
# Exit chroot
exit

#reboot
 
#nmtui
# Graphic card drivers
#sudo pacman -S --noconfirm nvidia nvidia-utils xf86-video-intel xorg sddm plasma kde-applications packagekit-qt5 firefox libreoffice

# Install Yay
#git clone https://aur.archlinux.org/yay.git
#cd yay/
#makepkg -si PKGBUILD
# Install Fonts
#yay -S ttf-ms-fonts
# Install Timeshift
#yay -S timeshift
# Enable Trim timer
#sudo systemctl enable fstrim.timer

