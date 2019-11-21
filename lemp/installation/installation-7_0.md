# Installation PHP 7.0
## Initial Server Setup with Ubuntu 16.04
### Create server in DO
167.99.242.147
### Configuration
````
ssh root@167.99.242.147
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
ssh vadis@167.99.242.147
````
### Firewall
````
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
````
## Nginx
````
sudo apt-get update
sudo apt-get install nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw status
````
Check browser
167.99.242.147
## MySQL
````
sudo apt-get install mysql-server
sudo mysql_secure_installation
````
## PHP
````
sudo apt-get install php-fpm php-mysql php-mbstring php-xml php-curl
sudo nano /etc/php/7.0/fpm/php.ini
````
Find cgi.fix_pathinfo. Must be cgi.fix_pathinfo=0
````
sudo systemctl restart php7.0-fpm
````
## Config Nginx
````
sudo nano /etc/nginx/sites-available/default
````
Insert:
````
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name 167.99.242.147;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
````
````
sudo nginx -t
sudo systemctl reload nginx
````
## Test phpinfo()
````
sudo nano /var/www/html/info.php

<?php
phpinfo();
````
Check 167.99.242.147/info.php

## Make upload of big files possible (in php AND nginx)
````
sudo nano /etc/nginx/nginx.conf

find or add in http block client_max_body_size:
client_max_body_size 100M;

sudo service nginx restart
````
````
sudo nano /etc/php/7.0/fpm/php.ini
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

sudo service php7.0-fpm restart
````
## Install PhpMyAdmin
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

        server_name 167.99.242.147;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
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
sudo nginx -t
sudo /etc/init.d/nginx restart
sudo apt-get install php-mbstring php-gettext
````

Check:
http://167.99.242.147/phpmyadmin
````