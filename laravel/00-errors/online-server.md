# Online server
After changing of .env always make
````
sudo php artisan config:cache
````

# Changing columns for table "currencies" requires Doctrine DBAL; install "doctrine/dbal"
First
````
sudo composer require doctrine/dbal
````
Then migrate.
