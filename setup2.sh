#!/bin/sh

name=$USER
cd /home/"$name" || exit 1
echo installing paru pacage manager
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit 1
makepkg -si 
cd .. || exit 1
rm -R -f paru-bin
echo installing pacages with paru
paru
paru -S \
        themix-full-git \
        picom-jonaburg-git \
        polybar \
        nerd-fonts-iosevka \
	noto-fonts-emoji \
	font-manager \
	siji \
	brave-bin \
	flatpak
flatpak install discord
flatpak install libreoffice
git clone https://github.com/ZastianPretorius/config.git
cd config || exit 1
for entry in *
do
	mv "$entry" /home/"$name"/"$entry"
done
for entry in .*
do
	if [ "$entry" = "." ]
	then
		echo hello
	elif [ "$entry" = ".." ]
	then
		echo hello
	else
		mv "$entry" /home/"$name"/"$entry"
	fi
done
cd || exit 1
xmonad --recompile
mkdir Pictures
cd Pictures || exit 1
git clone https://github.com/ZastianPretorius/wallpapers.git
sudo rc-update add NetworkManager
sudo rc-update add lightdm


