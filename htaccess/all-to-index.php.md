## Documentation
https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_rewrite-for-apache-on-ubuntu-14-04

## chang.com.conf
```
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
```

# .htaccess
## All to index.php of current directory
```
RewriteEngine on
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /index.php?path=$1 [NC,L,QSA]
```
## All to index.php of root
```
Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [QSA,L]
```
