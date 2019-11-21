# Soft deleting
## Links
Manual: https://laravel.com/docs/5.8/eloquent#soft-deleting

## Migration
````
Schema::table('flights', function (Blueprint $table) {
    $table->softDeletes();
});
````
## Model
````
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Flight extends Model
{
    use SoftDeletes;
}
````
## Controller. 
### Restore
````
$profile->restore()
````
### Delete permanently
````
$profile->forceDelete()
````
### Index
````
$flights = App\Flight::withTrashed()
                ->where('account_id', 1)
                ->get();
````
