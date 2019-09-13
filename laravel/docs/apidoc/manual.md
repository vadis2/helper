# Documentation
https://laravel-apidoc-generator.readthedocs.io/en/latest/generating-documentation.html

## Help for variables
https://www.ovac4u.com/idoc/#providing-an-example-response

## Commands
````
php artisan apidoc:generate
````
## Config online
1. Change baseURL in config/apidoc.php
2. Change name og Postman collection

## Copy online collection JSON
````
scp root@167.99.242.147:/var/www/codeci.pp.ua/crmbackend2/public/docs/collection.json /var/www/wny2.com/laravel-api-boilerplate-jwt/public/docs/collection_online.json
````

##
````
* @bodyParam department string required Department name
* @bodyParam description string required Description
* @bodyParam parent_id int Parent ID
````
