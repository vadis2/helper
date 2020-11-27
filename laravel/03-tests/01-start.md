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

./vendor/bin/phpunit --filter UserControllerTest --testdox 

test UserControllerTest 

or run 1 specific test from test file:

test testGetRules tests/Functional/Api/V1/Controllers/RulesControllerTest
test testGetRules tests/Functional/API/v1/RulesControllerTest
````
