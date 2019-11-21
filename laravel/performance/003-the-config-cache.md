# The Config Cache
Use the config cache to reduce configuration parsing & see its caveats!

It caches config dir and .env.

## Docs
https://laravel.com/docs/5.6/configuration#configuration-caching
https://serversforhackers.com/laravel-perf/config-cache
````
pa config:cache

## Limitatioms
Don't cache config in a development stage.

## Simple script to automatize 
````
#!/usr/bin/env bash
#git pull origin naster
#composer install

php artisan optimize
php artisan route:cache
php artisan config:cache
````