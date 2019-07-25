# Usage
## serve with hot reload at localhost:8080
npm run serve

see at
http://localhost:8080 (8081, etc)

to check servers:
````
netstat -nlp | grep :808*
````
Output:
````
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      27486/node      
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:8081            0.0.0.0:*               LISTEN      28548/node      
tcp6       0      0 :::80                   :::*                    LISTEN      -     
````

or concrete:
````
netstat -nlp | grep :8080
````

to kill one:
````
kill 27486
````

If the process refuses to exit, then just use the -9 flag, which is a SIGTERM and cannot be ignored:
````
kill -9 27486
````

## build for production with minification
````
npm run build
````

Change server settings:
```` 
cd /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/wnyfe.com

````
````
server {
    root /var/www/wnyfe.com/CoreUI-Vue/dist;
    index index.php index.html index.htm;

    server_name wnyfe.com www.wnyfe.com;
    location / {
        try_files $uri $uri/ /index.php;
    }

    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        include snippets/fastcgi-php.conf;
    }
```` 
```` 
sudo nginx -t
sudo systemctl reload nginx
```` 
Check in browser.

## run linter
npm run lint

## run unit tests
npm run test:unit

## run e2e tests
npm run test:e2e