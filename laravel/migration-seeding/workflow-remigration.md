# Re-migration + seed
````
cda
pa migrate:refresh --seed
````
# Re-migration
````
php artisan migrate:reset
````
Delete manually left tables

````
cda
php artisan migrate
php artisan db:seed
php artisan db:seed --class=AdditionalSeeder
````
