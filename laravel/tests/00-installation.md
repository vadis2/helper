# Create .env.testing
1. Copy .env
2. Delete application key
3. DB part must be edited
4. Close DB emptying in all demo tests
5. Create DB for testing: metras3-test
```` 
// use Illuminate\Foundation\Testing\RefreshDatabase;
```` 

# Create application key
````
pa key:generate
````

# Edit config/database.php
Add in Connections:
````
'testing' => [
    'driver'    => 'mysql',
    'host'      => env('DB_HOST', '127.0.0.1'),
    'port'      => env('DB_PORT', '3306'),
    'database'  => env('DB_DATABASE', 'forge'),
    'username'  => env('DB_USERNAME', 'forge'),
    'password'  => env('DB_PASSWORD', ''),
    'charset'   => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix'    => '',
    'strict'    => true,
    'engine'    => null,
],
````
# Edit .env.testing: DB part
````
DB_CONNECTION=testing
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=metras3-test
DB_USERNAME=root
DB_PASSWORD=456v123
````
