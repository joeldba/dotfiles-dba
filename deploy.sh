#!/bin/bash

# this (shoddily-made) script deploys my builds of dwm, slstatus, st, and dmenu, in addition to my dotfiles
# the script is meant to be run on a fresh install of Arch or an Arch-based distro
# to the best of my knowledge, it works (at least on my end!). i don't know how, but it does
# dependencies are gcc + make, git, libx11, libxcb, libxft, libxinerama, ttf-droid, nerd-fonts-hack (AUR), picom, neofetch, ranger, and vim
# a working internet connection helps, too!
# be sure to run chmod +x deploy.sh to make the script executable
# ONLY run this script inside the dotfiles-dba dir so everything works

# stop script if any errors occur
set -e

# prompt the user that they have executed the script
echo "you have executed the deploy-dba script, which will begin performing its actions in 10 seconds. if you don't want the script to run for whatever reason, press Ctrl + C now."
sleep 10

# make ~/.config dir
mkdir ~/.config
echo "~/.config dir has been made. deploying my suckless builds in 3..."
sleep 4

# this section pulls, builds, and installs my builds of dwm, slstatus, st, and dmenu
# clone the repos:
git clone https://github.com/joeldba/dwm-dba.git
git clone https://github.com/joeldba/slstatus-dba.git
git clone https://github.com/joeldba/st-dba.git
git clone https://github.com/joeldba/dmenu-dba.git

# move them to ~/.config/...
mv -v dwm-dba/ ~/.config/dwm-6.2
mv -v slstatus-dba/ ~/.config/slstatus
mv -v st-dba/ ~/.config/st-0.8.4
mv -v dmenu-dba/ ~/.config/dmenu

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

echo "suckless utils have been deployed... now attempting to deploy dotfiles"
sleep 3 

# deploying dotfiles
cd ~/dotfiles-dba

cp -v .bashrc ~/.bashrc
cp -v .vimrc ~/.vimrc
cp -v .xinitrc ~/.xinitrc
sudo cp -v etc/environment /etc/environment
sudo cp -v usr/share/vim/vim82/colors/nord.vim /usr/share/vim/vim82/colors/nord.vim
cp -rv .config/neofetch ~/.config
cp -rv .config/picom ~/.config
cp -rv .config/ranger ~/.config

# nothing failed... hopefully ;)
echo "task failed successfully"
