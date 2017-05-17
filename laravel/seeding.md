# Seeding
Within the DatabaseSeeder
````
/**
 * Run the database seeds.
 *
 * @return void
 */
public function run()
{
    $this->call(UsersTableSeeder::class);
    $this->call(PostsTableSeeder::class);
    $this->call(CommentsTableSeeder::class);
}
````
````
for a server first:
composer dump-autoload

then:
php artisan db:seed

php artisan db:seed --class=UsersTableSeeder
````