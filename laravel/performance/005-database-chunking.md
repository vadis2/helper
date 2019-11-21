# Database Chunking
Reduce memory usage on queries returning lots of data!

## Docs
https://laravel.com/docs/5.6/queries#chunking-results
https://serversforhackers.com/laravel-perf/database-chunking

## How to use
````
DB::table('users')->orderBy('id')->chunk(100, function ($users) {
    foreach ($users as $user) {
        //
    }
});
````