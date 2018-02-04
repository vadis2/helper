# Package Workflow for JIRA
* Create dir packages
* Create a dir “Vvvadis” and a subdir “Users”
* Inside that subdirectory, create dir “src”
* Create composer.json file inside Users directory
```` 
composer init
```` 

1. Service Provider
````
php artisan make:provider UsersServiceProvider
````

* Move provider in src.
* include our service provider into providers list of app.php file.
````
Vvvadis\Users\UsersServiceProvider::class
````
* Add in main composer.json in autoload => psr-4 section    
````
"Vvvadis\\Users\\": "packages/vvvadis/users/src/"
````
*  Run composer dump-autoload to generate autoload files
````
composer dump-autoload
````
Check errors!

2. Basic Functionality
* create a directory “Http” under “src”
* create routes.php in Http
````
Route::get('todos', function(){
    return 'Here goes the Users list';
});
````
* Load the above routes file from our service provider’s boot function.
````
 require __DIR__ . '/Http/routes.php';
````
3. Controller
* create a directory “Controllers” inside “Http”
* create controller
````
pamc UsersController
````
* move controller in Http dir
* change namespace
````
namespace Vvvadis\Users\Http\Controllers;
````
* add
````
use App\Http\Controllers\Controller;
````
* create controller test function showUser to be called from route.
````
  public function showUser()
  {
    return 'User from controller';
  }
````
* add route
````
Route::get('get-user', 'Vvvadis\Users\Http\Controllers\UsersController@showUser');
````
* register controller in provider=>register()
````
// register our controller
        $this->app->make('Vvvadis\Users\Http\Controllers\UsersController');
````
4. Model
* create a directory “Models” inside “src”
* create model with trick dir
````
php artisan make:model Models/User
````
5. View
* create a directory “views” inside “src”
* We need to inform Laravel about our views/users directory through 
our service provider’s boot method
````
  $this->loadViewsFrom(__DIR__ . '/views', 'users');
````
Here users is a package name? that must be repeated in controller's view.
* Controller
````
return view('users::users.index', compact(
            'users'
        ));
````
Here first users - package name
second - subdir in views dir
index - file name.

6. To allow developers to manage the layout of the package’s output, 
   you can publish the views to the app’s views directory using 
   the following in boot method
````
$this->publishes([__DIR__ . '/views' => resource_path('views/vendor/demo-todo')]);
````
   2.
   Again we will have to run php artisan vendor:publish to copy the files.
