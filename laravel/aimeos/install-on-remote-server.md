# Installation into online server
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
sudo nano /etc/nginx/sites-available/autoadmin.pp.ua

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

6.1 Generate key
````
php artisan key:generate
````
7. Create DB

7.1. 
````
php artisan vendor:publish --all
php artisan migrate
php artisan aimeos:setup --option=setup/default/demo:1

php artisan cache:clear

php artisan ui vue --auth
npm install && npm run dev

php artisan aimeos:account --super <email>

mkdir public/files public/preview public/uploads
chmod 777 public/files public/preview public/uploads
````
10. Create all required directories
````
sudo php artisan storage:link
sudo chmod -R 777 storage
...
sudo chmod -R 777 storage
````

