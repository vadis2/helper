# Installation into online server from bitbucket deep development
https://github.com/petehouston/laravel-deploy-on-shared-hosting
https://medium.com/laravel-news/the-simple-guide-to-deploy-laravel-5-application-on-shared-hosting-1a8d0aee923e

1.
````
cd to_root
git init
````
2. Clone from git
````
sudo git clone https://vvadis@bitbucket.org/vvadis/dhh.git
````

3. Edit server configuration:
````
sudo nano /etc/nginx/sites-available/laravel3.pp.ua

server {
    root /usr/share/nginx/srs3.com/blog/public;
    index index.php index.html index.htm;

    server_name srs3.com www.srs3.com;
    location / {
        try_files $uri $uri/ /index.php;
    }

    location ~ \.php$ {
        try_files $uri /index.php =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

service nginx restart
````
4. 
````
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap/cache

stat storage
stat bootstrap/cache
````
5. Copy .env from working site
(laravel3.pp.us)
````
sudo nano .env
````

6. Install vendor:
````
sudo composer install
````
7. Create DB

8. Migrate
````
pa migrate
````

9. Seed
````
php artisan db:seed
sudo php artisan db:seed  --class=StartSeeder
````

9. Check log in. If there was Auth editing repeat it in online server.
To change blade login view:
````
cd vendor/laravel/framework/src/Illuminate/Foundation/Auth
sudo nano AuthenticatesUsers.php
````
To change blade register view:
````
cd vendor/laravel/framework/src/Illuminate/Foundation/Auth
sudo nano RegistersUsers.php

attention to
use...
function showRegistrationForm()
````

May be:
````
cda
````


