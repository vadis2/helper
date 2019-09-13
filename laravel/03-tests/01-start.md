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

or with better formatting

./vendor/bin/phpunit --testdox 

or test with the one only test

./vendor/bin/phpunit --filter UserContrillerTest --testdox 

````
