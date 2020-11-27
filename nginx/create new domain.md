# Create new domain
````
cd /var/www
ls
sudo mkdir -p helix.com
ls
sudo chown -R $USER:$USER /var/www/helix.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/helix.com/index.html
````
````
<html>
    <head>
        <title>Welcome to helix.com!</title>
    </head>
    <body>
        <h1>Success!  The helix.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/helix.com

````
````
server {
    root /var/www/helix.com;
    index index.php index.html index.htm;

    server_name helix.com www.helix.com;
    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to index.html
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
````
Enable both the sites by creating symbolic links to the sites-enabled directory
````
sudo ln -s /etc/nginx/sites-available/helix.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/helix.com
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain helix.com
````
sudo nano /etc/hosts
````
Change bashrc:
````
sudo nano ~/.bashrc
alias mp='cd /var/www/helix.com'
. ~/.bashrc
au
````
