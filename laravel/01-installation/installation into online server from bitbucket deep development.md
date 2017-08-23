# Installation into online server from bitbucket deep development
Clone from git
or
````
sudo git pull origin master

````
````
sudo chmod -R o+w storage
sudo chmod -R o+w bootstrap/cache

stat storage
stat bootstrap/cache
````
Copy .env from working site
(laravel3.pp.us)
````
sudo nano .env
````

Install vendor:
````
sudo composer install
````

Check log in. If there was Auth editing repeat it in online server.
To change blade login view:
````
cd vendor/laravel/framework/src/Illuminate/Foundation/Auth
sudo nano AuthenticatesUsers.php
````
To change blade register view:
````
cd vendor/laravel/framework/src/Illuminate/Foundation/Auth
sudo nano RegistersUsers.php

attention to
use...
function showRegistrationForm()
````

````
??? sudo composer update
sudo php artisan migrate
sudo php artisan db:seed or --class...
````

May be:
````
php composer dumpautoload -o
php artisan config:cache
php artisan route:cache
````


