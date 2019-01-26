# Create new domain
````
cd /var/www
sudo mkdir -p metras2.com
sudo chown -R $USER:$USER /var/www/metras2.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/metras2.com/index.html
````
````
<html>
    <head>
        <title>Welcome to metras2.com!</title>
    </head>
    <body>
        <h1>Success!  The metras2.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/metras2.com

````
````
server {
    root /var/www/metras2.com;
    index index.php index.html index.htm;

    server_name metras2.com www.metras2.com;
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
sudo ln -s /etc/nginx/sites-available/metras2.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/metras2.com
````
Do an Nginx configuration test:
````
sudo nginx -t
````
Then reload Nginx if OK is displayed
````
sudo systemctl reload nginx
````
Create row in the file hosts
````
cd /etc
sudo nano hosts
````

Git config
````

[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
````
Bash config
````
sudo nano ~/.bashrc

# composer
alias cu='composer update'

# cd
alias dhh='cd /usr/share/nginx/dhh.com/dhh/dhh'

# pa
alias pa='php artisan'
alias pam='php artisan make:'
alias pamc='php artisan make:controller'
alias pammo='php artisan make:model'
alias pammi='php artisan make:migration'
alias pammid='php artisan make:middleware'
alias pamr='php artisan make:request'
alias pams='php artisan make:seeder'
alias pammid='php artisan make:middleware'
alias pamt='php artisan make:test'
alias pu='vendor/bin/phpunit'
alias cda='composer dump-autoload'
alias pads='php artisan db:seed'

. ~/.bashrc
````