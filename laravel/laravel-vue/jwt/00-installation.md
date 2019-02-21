# server-end
1. Create local domain.
2. Clone repo
````
git clone https://vvadis@bitbucket.org/vvadis/metras2-vue-jwt.git
````
3. Config laravel installation.

# client-side
Create jwt-secret
````
php artisan jwt:secret
````

Install into .env:
````
php artisan jwt:secret
````

Insert into .env
````
MIX_APP_URL="${APP_URL}"
````

Make command
````
npm i @websanova/vue-auth vue-router vue-axios axios es6-promise
npm run dev
````

## Notes
Seeded users didn't registered by JWT and can not to login. 
