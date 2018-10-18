# Create new domain
````
cd /var/www
ls
sudo mkdir -p cms.com
ls
sudo chown -R $USER:$USER /var/www/cms.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/cms.com/index.html
````
````
<html>
    <head>
        <title>Welcome to cms.com!</title>
    </head>
    <body>
        <h1>Success!  The cms.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/cms.com

````
````
server {
    root /var/www/cms.com;
    index index.php index.html index.htm;

    server_name cms.com www.cms.com;
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
sudo ln -s /etc/nginx/sites-available/cms.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/cms.com
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Insert new domain cms.com
````
sudo nano /etc/hosts
````