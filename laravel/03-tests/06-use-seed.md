# Use Seed
````
<?php

use Illuminate\Foundation\Testing\DatabaseMigrations;

class ExampleTest extends TestCase
{
    use DatabaseMigrations;

    public function setUp(): void
    {
        parent::setUp();

        // you can call
        $this->artisan('db:seed');
        
        // or
        $this->artisan('db:seed --class=UsersTableSeeder');

        // or 
        $this->seed();
    }

    /**
     * A basic functional test example.
     *
     * @return void
     */
    public function testBasicExample()
    {
        $response = $this->get('/');

        // ...
    }
}
````
