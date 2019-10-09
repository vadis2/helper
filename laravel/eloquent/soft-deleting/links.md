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
