# CORS config for Laravel back-end
## Current used Laravel version
7.*
## Config/cors.md
````
'paths' => ['api/*'],

'allowed_methods' => ['POST', 'GET', 'PUT', 'DELETE'],

'allowed_origins' => ['http://localhost:4002', 'http://angularjs.pp.ua'],

'allowed_origins_patterns' => [],

'allowed_headers' => ['*'],

'exposed_headers' => [],

'max_age' => 0,

'supports_credentials' => false,
````
## Middleware cors.md
````
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param \Closure                 $next
     *
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        return $next($request)
            ->header('Access-Control-Allow-Origin', '*')
            ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    }
}
````
## Routes api.php
````
Route::prefix('v1')->group(function () {
    // Users
    Route::prefix('users')->group(function () {
        Route::delete('/{id}', 'UsersController@destroy');
        Route::post('/logout', 'AuthController@logout')->middleware('cors');
    });
});
````
## Kernel.php
````
protected $routeMiddleware = [
    ...
    'cors' => \App\Http\Middleware\Cors::class,
    ...
    ];
````

