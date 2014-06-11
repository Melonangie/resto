#!/usr/bin/env bash

block="server {
    listen 80;
    listen 443 ssl;
    server_name $1;
    root $2;

    ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem;
    ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/$1-error.log error;

    error_page 404 /index.php;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
"

echo "$block" > "/etc/nginx/sites-available/$1"
ln -s "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
service nginx restart
service php5-fpm restart

echo ">>> Fixing locales"
echo LC_ALL="en_US.UTF-8" >> /etc/environment

echo ">>> Coloring cat"
easy_install Pygments

echo ">>> Installing spf13-vim vim distribution"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
echo colorscheme molokai  >> ~/.vimrc.local

echo ">>> Installing spf13-vim vim fonts"
apt-get install Fontconfig
wget https://github.com/Lokaltog/powerline-fonts/blob/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf -O SourceCodePro.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv SourceCodePro.otf /usr/share/fonts/
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d/
echo let g:airline_powerline_fonts=1  >> ~/.vimrc.before.local

echo ">>> Installing ohmyzsh z-shell"
apt-get install zsh
curl -L http://install.ohmyz.sh | sh
sed -i 's/robbyrussell/amuse/g' ~/.zshrc
chsh -s `which zsh`
service ssh restart
