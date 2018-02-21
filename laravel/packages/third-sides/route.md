# Double middleware is needed
web, auth
````
Route::group(['middleware' => ['web']], function () {
    Route::get('get-user', 'Vvvadis\Users\Http\Controllers\UsersController@showUser');
    Route::get('test', 'Vvvadis\Users\Http\Controllers\UsersController@test');
    
    /* Users */
    Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {
        Route::get('users', 'Vvvadis\Users\Http\Controllers\UsersController@index')->name('admin/users');
        Route::get('test', 'Vvvadis\Users\Http\Controllers\UsersController@test');
//    Route::get('users/create', 'Vvvadis\Users\Http\Controllers\UsersController@create');
    });
});
````