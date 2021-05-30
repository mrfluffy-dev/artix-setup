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
	siji
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
	elif ["$entry" = ".." ]
	then
	else
		mv "$entry" /home/"$name"/"$entry"
	fi
done
cd || exit 1
mkdir Pictures
cd Pictures || exit 1
git clone https://github.com/ZastianPretorius/wallpapers.git
printf "sudo password:"
read -r  pass
echo "$pass" | sudo rc-update add NetworkManager
echo "$pass" | sudo rc-update add lightdm


