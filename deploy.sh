#!/bin/bash

# this (shoddily-made) script deploys my builds of dwm, slstatus, st, and dmenu, in addition to my dotfiles. to the best of my knowledge, it works. i don't know how, but it does.

# dependencies are gcc + make, git, libx11, libxcb, libxft, libxinerama, ttf-droid, nerd-fonts-hack (AUR), and vim. package names may vary from distro to distro. a working internet connection helps, too!

# be sure to run chmod +x deploy.sh to make the script executable

# ONLY run this script inside this directory so everything works


mkdir ~/.config
echo ".config dir has been made... just in case if it didn't exist before"

sleep 3

git clone https://github.com/joeldba/dwm-dba.git
git clone https://github.com/joeldba/slstatus-dba.git
git clone https://github.com/joeldba/st-dba.git
git clone https://github.com/joeldba/dmenu-dba.git

mv -v dwm-dba/ ~/.config/dwm-6.2
mv -v slstatus-dba/ ~/.config/slstatus
mv -v st-dba/ ~/.config/st-0.8.4
mv -v dmenu-dba/ ~/.config/dmenu

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

echo "suckless software has been deployed... now deploying dotfiles"
sleep 3 

cd ~/dotfiles-dba

cp -v .bashrc ~/.bashrc
cp -v .vimrc ~/.vimrc
cp -v .xinitrc ~/.xinitrc
sudo cp -v etc/environment /etc/environment
sudo cp -v usr/share/vim/vim82/colors/nord.vim /usr/share/vim/vim82/colors/nord.vim
cp -rv .config/neofetch ~/.config
cp -rv .config/picom ~/.config
cp -rv .config/ranger ~/.config

echo "task failed successfully"
