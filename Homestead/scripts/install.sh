#!/bin/bash

echo ">>> Installing Pygments to color cat"
easy_install Pygments

echo ">>> Installing Fontconfig"
apt-get install Fontconfig

echo ">>> Installing powerline fonts"
wget https://github.com/Lokaltog/powerline-fonts/blob/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf -O SourceCodePro.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv SourceCodePro.otf /usr/share/fonts/
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo ">>> Installing z-shell"
apt-get -y install zsh
chsh -s /bin/zsh vagrant
service ssh restart
