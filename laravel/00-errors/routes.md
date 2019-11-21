# Routes errors
## admin, admin/ don't work
````
Route::group(['prefix' => 'admin', 'namespace' => 'Admin'], function () {
    /* Dashboard */
    Route::get('', 'DashboardController@index');
    Route::get('/', 'DashboardController@index');
    Route::get('home', 'DashboardController@index');
````
Because dir public has subdir admin.
