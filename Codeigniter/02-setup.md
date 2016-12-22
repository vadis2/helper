# Setup
## Create DB
## Config
### config.php
1. url
2. index.php

#### config.php
 Delete index.php 

#### .htaccess
````
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]
````
#### .conf для apache2
````
sudo nano /etc/apache2/sites-enabled/chang.com.conf

<VirtualHost *:80>
    <Directory /var/www/html>
                    Options Indexes FollowSymLinks MultiViews
                    AllowOverride All
                    Order allow,deny
                    allow from all
    </Directory>

    . . .
</VirtualHost>

sudo service apache2 restart
````
3. .htaccess

### database.php 
````
...
'dbdriver' => 'mysql'
````

