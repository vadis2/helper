# Create new domain
````
cd /var/www
ls
sudo mkdir -p laravel3.pp.ua
ls
sudo chown -R $USER:$USER /var/www/laravel3.pp.ua
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/laravel3.pp.ua/index.html
````
````
<html>
    <head>
        <title>Welcome to laravel3.pp.ua!</title>
    </head>
    <body>
        <h1>Success!  The laravel3.pp.ua server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/laravel3.pp.ua

````
````
server {
    root /var/www/laravel3.pp.ua;
    index index.php index.html index.htm;

    server_name laravel3.pp.ua www.laravel3.pp.ua;
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
````
Enable both the sites by creating symbolic links to the sites-enabled directory
````
sudo ln -s /etc/nginx/sites-available/laravel3.pp.ua /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/laravel3.pp.ua
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain laravel3.pp.ua
````
sudo nano /etc/hosts
````