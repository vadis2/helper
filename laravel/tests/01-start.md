# How to start 
````
pa config:clear
pa cache:clear
````
Migrate
````
php artisan migrate:refresh --seed --env=testing
````
Start
````
./vendor/bin/phpunit
````