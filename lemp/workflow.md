````
ssh root@46.101.202.5
adduser vadis

usermod -aG sudo vadis
su - vadis
mkdir ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
````
Local comp:
````
cat ~/.ssh/id_rsa.pub
````
Copy and paste in the server opened nano window.
````
chmod 600 ~/.ssh/authorized_keys
exit
````
Disable Password Authentication
````
sudo nano /etc/ssh/sshd_config

PasswordAuthentication no (default last once)

sudo systemctl reload sshd
````
Test in new terminal
````
ssh vadis@46.101.202.5
````
Update packages
````
sudo apt update
sudo apt upgrade
````
Ubuntu: resolve the “perl: warning: Setting locale failed” problem
* http://libre-software.net/ubuntu-setting-locale/
One-command line:
````
echo "export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8">>~/.bash_profile

sudo reboot
locale
````
Old Nginx version
````
sudo apt update
sudo apt install nginx
````

Install latest Nginx Mainline
````
echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" | sudo tee -a /etc/apt/sources.list
wget -qO - https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt update
sudo apt install nginx
````
Check
````
sudo service nginx status
nginx -v
http://46.101.202.5 (It must be not working)
````
Install ufw firewall
````
sudo apt install ufw
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw status
sudo ufw enable
sudo ufw status
sudo service nginx restart
http://46.101.202.5
````
Install MySQL
````
sudo apt-get install mysql-server //use root as login!!
````
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#step-2-install-mysql
````
mysql_secure_installation

sudo service mysql status
sudo service mysql stop
sudo service mysql start
````
Install PHP
````
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.2 php7.2-fpm php7.2-mysql php7.2-curl php7.2-xml php7.2-zip php7.2-gd php7.2-mbstring
sudo systemctl restart php7.2-fpm
sudo service php7.2-fpm status
````
Configure PHP
````
sudo nano /etc/php/7.2/fpm/php.ini
find
;cgi.fix_pathinfo=1
edit to
cgi.fix_pathinfo=0
sudo systemctl restart php7.2-fpm
````
Configure Nginx to Use the PHP Processor
````
sudo mkdir /var/www/abp.pp.ua
````
````
sudo rm -f /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-available/abp.pp.ua
````

Insert:
````
server {
    listen 80;
    listen [::]:80;

    root /var/www/abp.pp.ua;
    index index.html index.htm index.nginx-debian.html;

    server_name abp.pp.ua;

    location / {
        try_files $uri $uri/ =404;
    }
}
````
````
sudo ln -s /etc/nginx/sites-available/abp.pp.ua /etc/nginx/sites-enabled/abp.pp.ua
sudo /etc/init.d/nginx restart
````
Create index.html
````
sudo nano /var/www/abp.pp.ua/index.html
````
Insert
````
Hello!
````
Check in browser abp.pp.ua

PHP checking
````
sudo nano /etc/nginx/sites-available/abp.pp.ua
````
Edit:
````
server {
    listen 80;
    listen [::]:80;

    root /var/www/abp.pp.ua;
    index index.php index.html index.htm;

    server_name abp.pp.ua www.abp.pp.ua;

    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to index.html
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

sudo nginx -t
sudo /etc/init.d/nginx restart
````
Create a PHP File to Test Configuration
````
sudo nano /var/www/abp.pp.ua/info.php

Insert:

<?php
phpinfo();

Check:
http://abp.pp.ua/info.php
````
Make upload of big files possible (in php AND nginx)
````
sudo nano /etc/nginx/nginx.conf

find/add in http block client_max_body_size:
client_max_body_size 100M;

sudo service nginx restart
````
````
sudo nano /etc/php/7.2/fpm/php.ini
````
Find
````
upload_max_filesize
post_max_size
````
Change to:
````
upload_max_filesize = 100M
post_max_size = 100M

sudo service php7.2-fpm restart
````
Install PhpMyAdmin
* https://devanswers.co/installing-phpmyadmin-nginx-ubuntu-16-04-17-04/

````
sudo apt-get update
sudo apt-get install phpmyadmin // no selection!!
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
````
Check default config for Nginx:
````
sudo nano /etc/nginx/sites-enabled/default
````
````
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.php index.html index.htm index.nginx-debian.html;

        server_name 46.101.202.5;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include fastcgi_params;
        }

        location /phpmyadmin {
                index index.php;
         }
}

````
````
sudo /etc/init.d/nginx restart
````

Check:
http://46.101.202.5/phpmyadmin
````



