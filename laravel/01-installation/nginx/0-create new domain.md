# Create new domain
````
cd /var/www
ls
sudo mkdir -p wny.com
ls
sudo chown -R $USER:$USER /var/www/wny.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/wny.com/index.html
````
````
<html>
    <head>
        <title>Welcome to wny.com!</title>
    </head>
    <body>
        <h1>Success!  The wny.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/wny.com

````
````
server {
    listen 80;
    listen [::]:80;

    root /var/www/wny.com;
    index index.php index.html index.htm;

    server_name wny.com www.wny.com;

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
sudo ln -s /etc/nginx/sites-available/wny.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/wny.com
````
Do an Nginx configuration test:
Then reload Nginx if OK is displayed
````
sudo nginx -t
sudo /etc/init.d/nginx restart
````
Insert new domain wny.com
````
sudo nano /etc/hosts
````