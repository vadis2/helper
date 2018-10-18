# Configuration
## interesting link
http://devmarketer.io/learn/deploy-laravel-5-app-lemp-stack-ubuntu-nginx/

## PHP
Install extensions:
https://learninglaravel.net/books/laravel/deploying-our-laravel-applications-3rd-edition


Edit path to public
```
sudo nano /etc/nginx/sites-available/laravel3.pp.ua
```
Change permissions to 
```
storage
bootstrap/cache

sudo chmod -R 777 /var/www
```
## Web Server configuration

```
sudo nano /etc/nginx/sites-available/laravel3.pp.ua
location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```

## Restart
````
service nginx restart
````

## Open port
```
sudo ufw allow 3306
```
