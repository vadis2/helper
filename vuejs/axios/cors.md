# CORS
1. File vue.config.js. Add back-end server:
````
devServer: {
    proxy: 'http://wny.com/',
  }
````
## Solution #1
2. File routes/api.php. Add:
````
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE, PATCH');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');
````
or
````
header('Access-Control-Allow-Origin:  http://localhost:8080');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE, PATCH');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');
````
## Solution #2
https://github.com/barryvdh/laravel-cors

#Theory
https://thewebtier.com/laravel/handle-cors-requests-vuejs-client-laravel-api/

https://medium.com/@baphemot/understanding-cors-18ad6b478e2b

https://learn.javascript.ru/xhr-crossdomain

https://stackoverflow.com/questions/33076705/laravel-5-1-api-enable-cors