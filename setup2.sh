!#/bin/sh

name = $USER
cd /home/$name
echo installing paru pacage manager
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si --noconfirm
cd ..
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
cd config
for entry in *
do
	mv $entry /home/$name/$entry
done
cd
mkdir Pictures
cd Pictures
git clone https://github.com/ZastianPretorius/wallpapers.git
read -sp "sudo password:" pass
sudo rc-update add NetworkManager | echo $pass
suso rc-update add lightdm | echo $pass


