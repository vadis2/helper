# Migration
## Doc
https://laravel.com/docs/5.4/migrations
## Artisan
````
php artisan make:migration create_users_table

php artisan migrate

php artisan migrate:rollback

php artisan migrate:rollback --step=5

php artisan make:migration add_shipped_to_purchase_orders_table --table=purchase_orders

All:
php artisan migrate:reset
````

## ide-helper
````
pa ide-helper:generate
pa ide-helper:models
pa ide-helper:meta
````
