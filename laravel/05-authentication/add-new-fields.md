# Add new fields in register form
## processing of new fields
https://stackoverflow.com/questions/42336115/how-can-i-pass-variable-to-register-view
http://www.easylaravelbook.com/blog/2015/09/25/adding-custom-fields-to-a-laravel-5-registration-form/

## pass data to register form
Open end edit
\vendor\laravel\framework\src\Illuminate\Foundation\Auth\RegistersUsers.php

````
<?php

namespace Illuminate\Foundation\Auth;

use App\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Auth\Events\Registered;

trait RegistersUsers
{
    use RedirectsUsers;

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        $countries = Country::all();
        $countries = $countries->keyBy();

        return view('auth.register', compact('countries'));
    }
````
