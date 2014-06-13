#!/bin/bash -x

echo ">>> Installing spf13-vim distribution"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
echo colorscheme molokai >> ~/.vimrc.local

echo ">>> Installing ohmyz sh"
curl -L http://install.ohmyz.sh | sh
sed -i 's/robbyrussell/amuse/g' ~/.zshrc


