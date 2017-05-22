# Re-migration
````
php artisan migrate:reset
````
Delete manually left tables

````
php artisan migrate
php artisan db:seed
php artisan db:seed --class=AdditionalSeeder
````