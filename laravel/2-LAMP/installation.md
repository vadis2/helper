# Check composer
```
composer
```

# Install
````
cd /var/www/lcore.com
ls
sudo rm -f index.html
ls
sudo composer create-project laravel/laravel your-project --prefer-dist
````

# Config
````
sudo chgrp -R www-data /var/www/lcore.com/public_html/core
sudo chmod -R 775 /var/www/lcore.com/public_html/core/storage
sudo nano /etc/apache2/sites-available/lcore.com.com.conf

<VirtualHost *:80>
    ServerName lcore.com
    ServerAlias www.lcore.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/lcore.com/public_html/core/public

    <Directory /var/www/lcore.com/public_html/core>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

sudo a2ensite lcore.com.conf
sudo a2enmod rewrite
sudo service apache2 restart
````

# Check site
