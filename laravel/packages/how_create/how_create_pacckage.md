# Tutorial for L5 without Models
https://devdojo.com/blog/tutorials/how-to-create-a-laravel-package

# There is workflow to publish package
http://laraveldaily.com/how-to-create-a-laravel-5-package-in-10-easy-steps/

# My pdf
It has some errors in namespace. 

# How to access a packages methods
````
When building a third-party package that interacts with Laravel, 
it's better to inject Laravel contracts instead of using facades. 
Since packages are built outside of Laravel itself, you will not 
have access to Laravel's facade testing helpers.

Your contract:

namespace Your\Package;

public interface YourPackageContract
{
    public function availableMethod();
}
Your implementation:

namespace Your\Package;

class YourPackage implements YourContract
{
    public function availableMethod()
    {
        //  Implement your method
    }
}
Your service provider:

namespace Your\Package;

use Illuminate\Support\ServiceProvider;

class YourPackageServiceProvider extends ServiceProvider
{
    public function register()
    {
        // Tell Laravel that when an instance of YourPackageContract is requested, an instance of YourPackage should be returned
        $this->app->singleton('Your\Package\YourPackageContract', function($app) {
            return new YourPackage();
        });
    }

    public function provides()
    {
        return ['Your\Package\YourPackageContract'];
    }
}
Your Facade:

namespace Your\Package\Facades;

use Illuminate\Support\Facades\Facade;

class YourPackage extends Facade
{
    public function getFacadeAccessor()
    {
        return 'Your\Package\YourPackageContract';
    }
}
Usage in a controller:

class SomeController
{
    public function index(YourPackageContract $yourPackage)
    {
        // $yourPackage should now be an instance of YourPackage
        $yourPackage->availableMethod();

        // You can also use the Facade which refers to the same instance
        YourPackage::availableMethod();
    }
}
````

