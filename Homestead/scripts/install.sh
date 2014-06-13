#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

echo ">>> Updating apt-get"
apt-get update

echo ">>> Installing Packages"
apt-get -y install Fontconfig git zsh

echo ">>> Installing powerline fonts"
wget https://github.com/Lokaltog/powerline-fonts/blob/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf -O SourceCodePro.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv SourceCodePro.otf /usr/share/fonts/
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo ">>> Setting z as default shell"
chsh -s /bin/zsh vagrant
service ssh restart

echo ">>> Coloring cat"
easy_install Pygments
