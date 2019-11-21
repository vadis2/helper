# Installation
1. main composer:
````
"require": {
        "vadiasov/calculator": "dev-master"
    },
````
2. composer update
3. config/app.php: enter and check typehinting!
````
Vadiasov\Calculator\CalculatorServiceProvider::class,
````
4. check
````
cda
````

5. Run php artisan vendor:publish to copy the files.
6. Migrate
````
pa migrate --path=/packages/vadiasov/tracks-admin/src/Migrations
or
pa migrate --path=/vendor/vadiasov/tracks-admin/src/Migrations
````
7. cda
8. seed
9. Create Model
10. Create menu
9. check (routes etc)