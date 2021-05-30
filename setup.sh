#!/bin/sh

pacman -Suy --noconfirm
echo Installing all the needed pacages from main artix/arch repo
pacman -S \
	xorg \
	lightdm \
	lightdm-gtk-greeter \
	lightdm-gtk-greeter-settings \
	xmonad \
	xmonad-contrib \
	pacman-contrib \
	code \
	xss-lock \
	fcitx5 \
	fcitx5-mozc \
	fcitx5-qt \
	fcitx5-gtk \
	adobe-source-han-sans-jp-fonts \
	arandr \
	lxappearance \
	qt5ct \
	thunar \
	thunar-archive-plugin \
	thunar-volman \
	xfce4-settings \
	tumbler \
	raw-thumbnailer \
	gvfs \
	gvfs-mtp \
	networkmanager \
	networkmanager-openrc \
	network-manager-applet \
	nextcloud-client \
	polkit-gnome \
	nitrogen \
	htop \
	alacritty \
	rofi \
	base-devel \
	noto-fonts-emoji \
	neofetch \
	neovim \
echo "Pleas profide a username:"
read -r name
useradd -m "$name"
passwd "$name"
echo adding user to some basic groups
usermod -a -G wheel "$name"
usermod -a -G video "$name"
usermod -a -G uucp "$name"
mv setup2.sh /home/"$name"/setup2.sh
chown "$name":"$name" /home/"$name"/setup2.sh
chmod +x /home/"$name"/setup2.sh
printf "pleas uncomment the wheel group to alow the user to use 'sudo':Press Enter to continu"
read -r
EDITOR=nvim visudo
printf "The system needs to reboot for the user to be added to the groups. \n \
	after reboot log in as the new user \n \
	Then run setup2.sh found in your home directory \n \
	\n press enter to continu \n "
read -r
echo "Press y to reboot or leave blanck to exit setup"
read -r confirm

if [ "$confirm" = "y" ]
then
	reboot
else
	exit 0
fi
