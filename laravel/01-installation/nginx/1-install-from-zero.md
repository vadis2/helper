# Install from zero
## Install Laravel
https://laravel.com/docs/5.5/installation

Use
````
composer create-project --prefer-dist laravel/laravel blog
or
composer create-project --prefer-dist laravel/laravel dhh
````

## change server configuration:
````
sudo nano /etc/nginx/sites-available/cms.com

server {
    root /var/www/cms.com/cms/public;
    index index.php index.html index.htm;

    server_name cms.com www.cms.com;
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

service nginx restart
````
````
cd cms
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap/cache

stat storage
stat bootstrap/cache
````

## Create DB

## Change .env
````
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=srs
DB_USERNAME=root
DB_PASSWORD=456v123
````

## Create phpStorm project
````
sudo chown -R $USER:$USER /var/www/cms.com
````
Create project