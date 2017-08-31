# Workflow
LoginController redirects after login to 
protected $redirectTo = '/histories/after_login';

web route: 
Route::get('histories/after_login', 'Admin\HistoriesController@after_login');

HistoriesController save get and save data and redirect to
return redirect()->route('trigger');

etc.