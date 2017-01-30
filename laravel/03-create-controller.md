## Create controller
````
php artisan make:controller TestController
````
## Add action
````
public function test()
    {
        return view('test');
    }
````
## Add route
````
Route::get('/', 'TestController@home');
````
## Create view

## Clear views cache if it's needed
````
php artisan view:clear
````

