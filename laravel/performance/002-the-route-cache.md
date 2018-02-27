# The Route Cache
Use the route cache to skip route compilation on each request!

## Docs
https://laravel.com/docs/5.6/controllers#route-caching
https://symfony.com/blog/new-in-symfony-3-3-faster-routing
https://serversforhackers.com/laravel-perf/route-cache

## How to
````
pa route:cache
````
To clear route cache:
````
php artisan route:clear
````
## Limitations
Routes don't include any closure.

 
## Simple script to automatize 
````
#!/usr/bin/env bash
#git pull origin naster
#composer install

php artisan optimize
php artisan route:cache
````