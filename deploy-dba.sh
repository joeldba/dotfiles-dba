#!/bin/bash

# this (shoddily-made) script deploys my builds of dwm, slstatus, st, and dmenu, in addition to my dotfiles and the programs i use
# it is intended for my own personal use, but you may modify it to your liking and use it on your own system
# this script assumes you are running it on a freshly-installed Arch-based system, as a normal user with sudo privileges
# a working internet connection helps, too!
# uncomment multilib repo and run 'pacman -Sy' in /etc/pacman.conf before running (should already be done for Manjaro users, Artix users need to uncomment the lib32 repo in addition to multilib)
# be sure to run chmod +x deploy.sh to make the script executable
# ONLY run this script inside the dotfiles-dba dir so everything works

# prompt the user that they have executed the script
echo "you have executed the deploy-dba script, which will begin performing its actions in 10 seconds. if you don't want the script to run for whatever reason, press Ctrl + C now."
sleep 10

echo "installing your programs... answer "y" when necessary"
sleep 2

# get packages from pacman and aur
sudo pacman -S pacman-contrib xorg-server xorg-xinit libx11 libxcb libxft libxinerama nvidia ttf-droid noto-fonts-emoji ttf-hack ttf-dejavu neofetch ranger cmus htop asciiquarium cmatrix vim nitrogen firefox discord gimp audacity steam virtualbox papirus-icon-theme adapta-gtk-theme lxappearance kvantum-qt5 scrot sxiv zip unzip nvidia-settings

git clone https://aur.archlinux.org/picom-tryone-git.git
cd picom-tryone-git
makepkg -si
cd ..
rm -rf picom-tryone-git

git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts
makepkg -si
cd ..
rm -rf ttf-ms-fonts

git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher
makepkg -si
cd ..
rm -rf minecraft-launcher

git clone https://aur.archlinux.org/pfetch.git
cd pfetch
makepkg -si
cd ..
rm -rf pfetch

git clone https://aur.archlinux.org/tty-clock.git
cd tty-clock
makepkg -si
cd ..
rm -rf tty-clock

git clone https://aur.archlinux.org/cli-visualizer.git
cd cli-visualizer
makepkg -si
cd ..
rm -rf cli-visualizer

echo "your programs have been installed. beginning deployment of suckless utils..."
sleep 3

# make ~/.config dir if it didn't exist already
mkdir ~/.config
echo "~/.config dir has been made, if it didn't exist already. this is where the source code for the suckless utilities will live"
sleep 6

# this section pulls, builds, and installs my builds of dwm, slstatus, st, and dmenu
# clone the repos:
git clone https://github.com/joeldba/dwm-dba.git
git clone https://github.com/joeldba/slstatus-dba.git
git clone https://github.com/joeldba/st-dba.git
git clone https://github.com/joeldba/dmenu-dba.git
git clone https://github.com/joeldba/slock-dba.git

# move them to ~/.config/...
mv -v dwm-dba/ ~/.config/dwm-6.2
mv -v slstatus-dba/ ~/.config/slstatus
mv -v st-dba/ ~/.config/st-0.8.4
mv -v dmenu-dba/ ~/.config/dmenu
mv -v slock-dba/ ~/.config/slock-1.4

# ...and install them
cd ~/.config/dwm-6.2
make
sudo make install
make clean

cd ..
cd slstatus/
make
sudo make install
make clean

cd ..
cd st-0.8.4/
make
sudo make install
make clean

cd ..
cd dmenu/
make
sudo make install
make clean

cd ..
cd slock-1.4/
make
sudo make install
make clean

echo "suckless utils have been deployed... now attempting to deploy dotfiles"
sleep 3 

# deploying dotfiles
cd ~/dotfiles-dba

cp -v .bashrc ~/.bashrc
cp -v .vimrc ~/.vimrc
cp -v .xinitrc ~/.xinitrc
cp -v .Xdefaults ~/.Xdefaults
sudo cp -v etc/environment /etc/environment
sudo cp -v gruvbox.vim /usr/share/vim/vim82/colors/
cp -rv .config/neofetch ~/.config
cp -rv .config/ranger ~/.config
cp -rv .config/gtk-3.0 ~/.config
cp -rv .config/Kvantum ~/.config
cp -rv .config/picom ~/.config

# nothing failed... hopefully ;)
echo "task failed successfully"
