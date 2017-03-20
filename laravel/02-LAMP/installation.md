# Check composer
```
composer
```

# Install
````
cd /var/www/lcore.com/public_html
ls
sudo rm -f index.html
ls
sudo composer create-project laravel/laravel your-project --prefer-dist
````

# Config
````
sudo chgrp -R www-data /var/www/lcore.com/public_html/core
sudo chmod -R 775 /var/www/lcore.com/public_html/core/storage
sudo nano /etc/apache2/sites-available/lcore.com.conf

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

sudo chown -R $USER:$USER /var/www

chmod -R 777 storage
````

# Check site
## base url
## routing
```
Route::get('test1', function () {
    return 'Hello Test 1';
});
```
# Configuration
https://laravel.com/docs/5.4/installation#configuration

## DB
### app/config/database.php
````
'mysql' => [
            'driver' => 'mysql',
            'host' => env('DB_HOST', '127.0.0.1'),
            'port' => env('DB_PORT', '3306'),
            'database' => env('DB_DATABASE', 'lcore'),
            'username' => env('DB_USERNAME', 'root'),
            'password' => env('DB_PASSWORD', '456v123'),
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
            'strict' => true,
            'engine' => null,
        ],
````
### .env
````
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=lcore
DB_USERNAME=root
DB_PASSWORD=456v123
````
