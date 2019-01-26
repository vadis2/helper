# API
https://blog.pusher.com/build-rest-api-laravel-api-resources/

## Create a new Laravel app
````
laravel new book-reviws-api
````
## Create models and migrations
````
php artisan make:model Book -m
php artisan make:model Rating -m
````

Open first migration file:
````
public function up()
{
  Schema::create('books', function (Blueprint $table) {
    $table->increments('id');
    $table->unsignedInteger('user_id');
    $table->string('title');
    $table->text('description');
    $table->timestamps();
  });
}
````
Second table:
````
public function up()
{
  Schema::create('ratings', function (Blueprint $table) {
    $table->increments('id');
    $table->unsignedInteger('user_id');
    $table->unsignedInteger('book_id');
    $table->unsignedInteger('rating');
    $table->timestamps();
  });
}
````

Migrate:
````
php artisan migrate
````

## Define relationships between models
````
// app/User.php

public function books()
{
  return $this->hasMany(Book::class);
}
````
````
// app/Book.php

public function user()
{
  return $this->belongsTo(User::class);
}
````
````
// app/Rating.php

public function book()
{
  return $this->belongsTo(Book::class);
}
````

## Allowing mass assignment on some fields
````
// app/Book.php

protected $fillable = ['user_id', 'title', 'description'];
````
````
// app/Rating.php

protected $fillable = ['book_id', 'user_id', 'rating'];
````

## Helpers
````
php artisan ide-helper:generate
php artisan ide-helper:models
php artisan ide-helper:meta
````

## Adding user authentication
````
composer require tymon/jwt-auth "1.0.*"

php artisan vendor:publish --provider="Tymon\JWTAuth\Providers\LaravelServiceProvider"

php artisan jwt:secret
````
