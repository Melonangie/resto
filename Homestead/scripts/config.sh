#!/bin/bash -x

# sudo -u vagrant bash << "DOF"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
echo colorscheme molokai >> ~/.vimrc.local

curl -L http://install.ohmyz.sh | sh
sed -i 's/robbyrussell/amuse/g' ~/.zshrc
# DOF

echo ">>> Installing ohmyz sh"
echo ">>> Installing spf13-vim distribution"
