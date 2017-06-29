# Create new domain
````
cd /usr/share/nginx
sudo mkdir -p srs.com
sudo chown -R $USER:$USER /usr/share/nginx/srs.com
sudo chmod -R 755 /usr/share/nginx
````
Page sample
````
sudo nano /usr/share/nginx/srs.com/index.html
````
````
<html>
    <head>
        <title>Welcome to srs.com!</title>
    </head>
    <body>
        <h1>Success!  The srs.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/srs.com

````
````
server {
    root /usr/share/nginx/srs.com;
    index index.php index.html index.htm;

    server_name srs.com www.srs.com;
    location / {
        try_files $uri $uri/ /index.php;
    }

    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        include snippets/fastcgi-php.conf;
    }
}
````
Enable both the sites by creating symbolic links to the sites-enabled directory
````
sudo ln -s /etc/nginx/sites-available/srs.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/srs.com
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain srs.com
````
sudo nano /etc/hosts
````