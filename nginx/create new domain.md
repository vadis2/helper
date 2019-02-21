# Create new domain
````
cd /var/www
ls
sudo mkdir -p metras5.com
ls
sudo chown -R $USER:$USER /var/www/metras5.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/metras5.com/index.html
````
````
<html>
    <head>
        <title>Welcome to metras5.com!</title>
    </head>
    <body>
        <h1>Success!  The metras5.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/metras5.com

````
````
server {
    root /var/www/metras5.com;
    index index.php index.html index.htm;

    server_name metras5.com www.metras5.com;
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
sudo ln -s /etc/nginx/sites-available/metras5.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/metras5.com
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain metras5.com
````
sudo nano /etc/hosts
````