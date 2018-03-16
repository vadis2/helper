# Package Workflow for JIRA
* Create dir packages
* Create a dir “vadiasov” and a subdir “users”
* Inside that subdirectory, create dir “src”
* Create composer.json file inside Users directory
```` 
cd to_app_root
composer init
library!!!
insert!!!
 "autoload": {
        "psr-4": {
            "Vadiasov\\Calculator\\": "src"
        }
    },
```` 

1. Service Provider
````
php artisan make:provider UsersServiceProvider
````

* Move provider in src.
* Change namespace: V(!)endor\P(!)ackage_name
* include our service provider into providers list of config/app.php file.
````
Vadiasov\Calculator\CalculatorServiceProvider::class,
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

* Edit file


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
* Check in browser
Maybe,
````
sudo chmod -R 777 bootstrap/cache
````
3. Migrations
* create migration in standard way
* move migration file to src/migrations
* insert in ServiceProvider:
````
public function boot()
    {
        $this->loadMigrationsFrom(__DIR__.'/migrations');
    }
````
* after package installation simply "pa migrate"
* migrate for developer:
````
php artisan migrate --path=/packages/websanova/demo/src/migrations
````
 
4. Seeds
* create seeds in standard way
* move seeds file to src/migrations
* publish seed
* make seeds

5. Tests
* To include in main composer.json:
````
composer require --dev phpunit/phpunit
composer require --dev orchestra/testbench
````
* Add namespaces for your tests in main composer.json
````
"autoload-dev": {
        "psr-4": {
            "Vadiasov\\MyPackage\\Test\\": "packages/vadiasov/mypackage/tests",
        }
    }
````
* Create phpunit.xml in src:
````
<?xml version="1.0" encoding="UTF-8"?>
<phpunit bootstrap="vendor/autoload.php"
         backupGlobals="false"
         backupStaticAttributes="false"
         colors="true"
         verbose="true"
         convertErrorsToExceptions="true"
         convertNoticesToExceptions="true"
         convertWarningsToExceptions="true"
         processIsolation="false"
         stopOnFailure="false">
    <testsuites>
        <testsuite name="MyPackage Test Suite">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
    <filter>
        <whitelist>
            <directory suffix=".php">src/</directory>
        </whitelist>
    </filter>
</phpunit>
````
6. Tests for Facade:
* Create base testcase in tests\TestCase.php
````
<?php
namespace lasselehtinen\MyPackage\Test;
use lasselehtinen\MyPackage\MyPackageFacade;
use lasselehtinen\MyPackage\MyPackageServiceProvider;
use Orchestra\Testbench\TestCase as OrchestraTestCase;

class TestCase extends OrchestraTestCase
{
    /**
     * Load package service provider
     * @param  \Illuminate\Foundation\Application $app
     * @return lasselehtinen\MyPackage\MyPackageServiceProvider
     */
    protected function getPackageProviders($app)
    {
        return [MyPackageServiceProvider::class];
    }
    /**
     * Load package alias
     * @param  \Illuminate\Foundation\Application $app
     * @return array
     */
    protected function getPackageAliases($app)
    {
        return [
            'MyPackage' => MyPackageFacade::class,
        ];
    }
}
````
7. Tests for Controller
````
namespace Vadiasov\RolesAdmin;

class DemoTest extends \PHPUnit\Framework\TestCase
{
    public function testSomethingIsTrue()
    {
        $this->assertTrue(true);
    }
}
````
Test command:
````
cd pack
vendor/bin/phpunit packages/vadiasov/roles-admin/
````
8. Routes
* create routes in src/HTTP/
````
// src/Http/routes.php

Route::get('admin/roles', function () {
    return 'Test Roles';
});
````
* Provider:
````
public function boot()
{
    require __DIR__ . '/Http/routes.php';
}
````
* Check route in browser

9. Controller
* create a directory “Controllers” inside “Http”
* create controller
````
pamc UsersController
````
* move controller in Http dir
* change namespace
````
namespace Vvvadis\Users\Http\Controllers;
or
namespace Vadiasov\RolesAdmin\Http;
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
* Register controller in provider=>register
````
// register our controller
    $this->app->make('Devdojo\Calculator\CalculatorController');
    
    or
    
    $this->app->make('Vadiasov\RolesAdmin\Http\RolesController');
````
* add route in routes of package
````
Route::get('get-user', 'Vvvadis\Users\Http\Controllers\UsersController@showUser');

or

Route::get('admin/get-user', 'Vadiasov\RolesAdmin\Http\RolesController@showUser')
````
* test route

10. Model
* create a directory “Models” inside “src”
* create model with trick dir
````
php artisan make:model Models/User
````
* or create standard Model in dir app

11. View
* create a directory “views” inside “src”
* We need to inform Laravel about our views/users directory through 
our service provider’s boot method
````
  $this->loadViewsFrom(__DIR__ . '/views', 'name_package');
````
Here users is a package name? that must be repeated in controller's view.
* Controller
````
return view('name_package::admin.roles.index', compact(
            'roles',
            'active',
            'users'
        ));
````
* action in view:
````
<a href="{{action('\Vadiasov\RolesAdmin\Http\RolesController@edit', $role->id)}}">
                                                <i class="fa fa-pencil" aria-hidden="true"></i></a>
````

12. To allow developers to manage the layout of the package’s output, 
   you can publish the views to the app’s views directory using 
   the following in boot method
````
$this->loadViewsFrom(__DIR__ . '/views', 'name_package');
$this->publishes([__DIR__.'/views' => resource_path('views/vadiasov/name_package'),
$this->publishes([__DIR__.'/seeds' => database_path('seeds'),
$this->publishes([__DIR__.'/migrations' => database_path('migrations'),
        ]);
````
Seeds doesn't work after publishing. ?

13. Installation
* main composer:
````
"require": {
        "vadiasov/calculator": "dev-master"
    },
````
* composer update
* config/app.php: enter and check typehinting!
````
Vadiasov\Calculator\CalculatorServiceProvider::class,
````
* check
````
cda
````

14. Run php artisan vendor:publish to copy the files.
15. Migrate
16. cda
17. seed
18. check (routes etc)
