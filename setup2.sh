#!/bin/sh

name=$USER
cd /home/"$name" || exit 1
echo installing paru pacage manager
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit 1
makepkg -si --noconfirm
cd .. || exit 1
rm -R paru-bin
echo installing pacages with paru
paru
paru -S \
        themix-full-git \
        picom-jonaburg-git \
        polybar \
        nerd-fonts-iosevka \
	noto-fonts-emoji \
git clone https://github.com/ZastianPretorius/config.git
cd config || exit 1
for entry in *
do
	mv "$entry" /home/"$name"/"$entry"
done
cd || exit 1
mkdir Pictures
cd Pictures || exit 1
git clone https://github.com/ZastianPretorius/wallpapers.git
printf "sudo password:"
read -r  pass
echo "$pass" | sudo rc-update add NetworkManager
echo "$pass" | suso rc-update add lightdm


