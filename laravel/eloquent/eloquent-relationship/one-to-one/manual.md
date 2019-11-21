# One-to-one
## Manual
### Model
````
namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * Get the phone record associated with the user.
     */
    public function phone()
    {
        return $this->hasOne('App\Phone', 'foreign_key', 'local_key');
    }
}
````
### Model inverse
````
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{
    /**
     * Get the user that owns the phone.
     */
    public function user()
    {
        return $this->belongsTo('App\User', 'foreign_key', 'other_key');
    }
}
````
### Getting
````
$phone = User::find(1)->phone;
````
If we have object $user already then:
````
$phone=$user->phone;
````
