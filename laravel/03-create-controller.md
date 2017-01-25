````
php artisan make:controller PagesController
````
# Add action
````
public function home()
    {
        return view('welcome');
    }
````
# Add route
````
Route::get('/', 'PagesController@home');
````

# Clear views cache
````
php artisan view:clear
````

