# Official link
https://laravel.com/docs/5.6/validation#custom-validation-rules

# How to add
Add in App/Provider/AppServiceProvider.php Validator
````
<?php

namespace App\Providers;

use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //Paginator::useBootstrapThree();
        Schema::defaultStringLength(191);

        Validator::extend('uniqueFirstAndLastName', function ($attribute, $value, $parameters, $validator) {
            $count = DB::table('users')->where('first_name', $value)
                ->where('last_name', $parameters[0])
                ->get()
                ->count();

            $bool = false;
            if ($count == 0) {
                $bool = true;
            }
            return $bool;
        });

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
````

Add in Request:
````
public function rules()
    {
        return [
            'first_name' => 'required|max:255|uniqueFirstAndLastName:' . $_POST["last_name"],
            'last_name'  => 'required|max:255',
            'email'      => 'required|email|unique:users|max:255',
        ];
    }
````

Add in language validation.php before 'accepted'
````
'unique_first_and_last_name' => 'Your pair of First and Last names must be unique.',
    'accepted'                   => 'The :attribute must be accepted.',
    
````