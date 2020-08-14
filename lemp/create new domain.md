# Create new domain
````
cd /var/www
sudo mkdir -p paa.com
sudo chown -R $USER:$USER /var/www/paa.com
sudo chmod -R 755 /var/www
````
Page sample
````
sudo nano /var/www/paa.com/index.html
````
````
<html>
    <head>
        <title>Welcome to paa.com!</title>
    </head>
    <body>
        <h1>Success!  The paa.com server block is working!</h1>
    </body>
</html>
````
Create Server Block Files for Domain
````
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/paa.com

````
````
server {
    listen 80;
    listen [::]:80;

    root /var/www/paa.com;
    index index.php index.html index.htm;

    server_name paa.com www.paa.com;

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
sudo ln -s /etc/nginx/sites-available/paa.com /etc/nginx/sites-enabled
````
If duplicate:
````
sudo rm -f /etc/nginx/sites-enabled/paa.com
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
sudo nano /etc/hosts
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
