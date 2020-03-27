# Local Installation
## Directory
````
cd Documents/Projects
````
## Install core
````
composer create-project --prefer-dist laravel/laravel passport
cd passport
````
## Check Installation
````
php artisan serve
````
Open in a browser by click on the link in the terminal
## Configuration
````
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap/cache

stat storage
stat bootstrap/cache
````
## Edit .env
````
sudo nano .env
````
Change DB parameters.
## Create DB with selected parameters

## Install Passport
````
composer require laravel/passport
````
## Migrate
````
php artisan migrate
````
## Edit model User
add:
````
use HasApiTokens;
````
Check existing of 
````
use Laravel\Passport\HasApiTokens;
````
## Edit app/Providers/AuthServiceProvider.php
Add:
````
use Laravel\Passport\Passport;
````
Uncomment:
````
'App\Model' => 'App\Policies\ModelPolicy',
````
Add ````passport::routes();````:
````
public function boot()
{
    $this->registerPolicies();

    passport::routes();
}
````
## Edit config/auth.php
````
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],

    'api' => [
        'driver' => 'passport',
        'provider' => 'users'
    ],
],
````
## Edit routes/api.php
Comment:
````
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
````
Add:
````
Route::group(['prefix' => 'auth'], function () {
    Route::post('login', 'Auth\AuthController@login')->name('login');
    Route::post('register', 'Auth\AuthController@register');
    Route::group([
        'middleware' => 'auth:api'
    ], function () {
        Route::get('logout', 'Auth\AuthController@logout');
        Route::get('user', 'Auth\AuthController@user');
    });
});
````
## Create controller
````
php artisan make:controller Auth/AuthController
````
## Edit controller
````
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    //
    public function login(Request $request)
    {
        $request->validate([
            'email'    => 'required|string|email',
            'password' => 'required|string'
        ]);
        $credentials = request(['email', 'password']);
        // print_r($credentials);die;
        if (!Auth::attempt($credentials))
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        $user        = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        $token       = $tokenResult->token;
        if ($request->remember_me)
            $token->expires_at = Carbon::now()->addWeeks(1);
        $token->save();
        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type'   => 'Bearer',
            'expires_at'   => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString()
        ]);
    }

    public function register(Request $request)
    {
        $request->validate([
            'name'     => 'required|string',
            'email'    => 'required|string|email|unique:users',
            'password' => 'required|string'
            //            'lName'    => 'required|string',
            //            'fName'    => 'required|string',
        ]);
        $user = new User;
//        $user->first_name = $request->fName;
//        $user->last_name  = $request->lName;
        $user->name     = $request->name;
        $user->email    = $request->email;
        $user->password = bcrypt($request->password);
        $user->save();
        return response()->json([
            'message' => 'Successfully created user!'
        ], 201);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    public function user(Request $request)
    {
        return response()->json($request->user());
    }
````
## Use \Fruitcake\Cors\HandleCors::class for CORS 
or
### Create middleware Cors
````
php artisan make:middleware Cors
````
````
public function handle($request, Closure $next)
{
//        return $next($request);
    return $next($request)
        ->header('Access-Control-Allow-Origin', '*')
        ->header('Access-Control-Allow-Methods',
            'GET, POST, PUT, PATCH, DELETE, OPTIONS')
        ->header('Access-Control-Allow-Headers',
            'Content-Type, Authorization, X-Requested-With, X-XSRF-TOKEN');
}
````
### Register new middleware in app/Http/Kernal.php
Add ````\App\Http\Middleware\Cors::class,````,
comment ````\Fruitcake\Cors\HandleCors::class````:
````
protected $middleware = [
    \App\Http\Middleware\TrustProxies::class,
    \App\Http\Middleware\Cors::class,
//        \Fruitcake\Cors\HandleCors::class,
    \App\Http\Middleware\CheckForMaintenanceMode::class,
    \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
    \App\Http\Middleware\TrimStrings::class,
    \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
];
````
## Run passport
````
php artisan passport:install
php artisan serve
````

## Test
Open Postman.
### Register
Post 
http://127.0.0.1:8002/api/auth/register
Query Params:
- name
- email
- password
### Login
Post
http://127.0.0.1:8002/api/auth/login
Query Params:
- email
- password

Response:
```` 
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmNkMmNkODZkZmEwN2QxNTkxOGM5YWYzMTYxNzA1ZjljZGNjZDdiZmQ0M2NjMDdjMDA3ZDY0OTEwOTg3MmRjNWFiNGVkYWNmMWYwMGE4NGUiLCJpYXQiOjE1ODQxOTA0NzgsIm5iZiI6MTU4NDE5MDQ3OCwiZXhwIjoxNjE1NzI2NDc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.g8gW0tIE0BxZ1JFMB1GOaa9ZNCpJp0raQ0tR3bBNS2ZRJuo_VigFRbFHoZT9sbYQ2qjNt1Z8X2G2HnMAa1fqpqfVeJ5VOzk-sBFGZeoLv25aJleSHp4fDG5fzU9JfHQJ2d450V9pOGh7GdO-o4A9k8pmKciFsiGQL3WGmfRc2VSBLyRlg_J3RANCCPdMPIqEnWeCnUvKdIYuzNgSwYjnq5e-dES_lATrY6hUv0r23Zvu-RMVBzwYhSYVRds7IJtJPq6QyGXLe8n3Klvvt1ZItQCp9163oJIYQSPeiJNcQg1psCzvppISf8mbZTx19Bn4xa1j4dNq2U90o_YdrBEAgcfs3pFR2jAji4WMuia1DY80F67wyd5xJzdCA7KFPk0xCJoAWXKmYnMFR6bAXnnm--c4g2vVDGGXRpFuJkAR6W_DeKzd8lSTe-AmgnHfze63stAqH15VRt10_QZEN7oZBOix1WLCnQkXK7bbXGpRUFyp1lEoxGul6Vweu3l1_aq7aUgrffcYIUgU3JE1GC_FUVg3y41zBE0XJywqPLfoWkTUjrd6xBwgjQZ_3pzUjte9Qe9h4D96ZwQ9Mq6TazofrJEZlyn2o-mqLk9ZIc4uv4n6jMm-TBko4Zp5CMzZaG0q7ex40mvIGpeYd2iJBEg7tim2omal9FcMdhQb-nF_YEs",
    "token_type": "Bearer",
    "expires_at": "2021-03-14 12:54:38"
}
```` 
### Get user
Get
http://127.0.0.1:8002/api/auth/user
Headers:
- Authorization
````
Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmNkMmNkODZkZmEwN2QxNTkxOGM5YWYzMTYxNzA1ZjljZGNjZDdiZmQ0M2NjMDdjMDA3ZDY0OTEwOTg3MmRjNWFiNGVkYWNmMWYwMGE4NGUiLCJpYXQiOjE1ODQxOTA0NzgsIm5iZiI6MTU4NDE5MDQ3OCwiZXhwIjoxNjE1NzI2NDc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.g8gW0tIE0BxZ1JFMB1GOaa9ZNCpJp0raQ0tR3bBNS2ZRJuo_VigFRbFHoZT9sbYQ2qjNt1Z8X2G2HnMAa1fqpqfVeJ5VOzk-sBFGZeoLv25aJleSHp4fDG5fzU9JfHQJ2d450V9pOGh7GdO-o4A9k8pmKciFsiGQL3WGmfRc2VSBLyRlg_J3RANCCPdMPIqEnWeCnUvKdIYuzNgSwYjnq5e-dES_lATrY6hUv0r23Zvu-RMVBzwYhSYVRds7IJtJPq6QyGXLe8n3Klvvt1ZItQCp9163oJIYQSPeiJNcQg1psCzvppISf8mbZTx19Bn4xa1j4dNq2U90o_YdrBEAgcfs3pFR2jAji4WMuia1DY80F67wyd5xJzdCA7KFPk0xCJoAWXKmYnMFR6bAXnnm--c4g2vVDGGXRpFuJkAR6W_DeKzd8lSTe-AmgnHfze63stAqH15VRt10_QZEN7oZBOix1WLCnQkXK7bbXGpRUFyp1lEoxGul6Vweu3l1_aq7aUgrffcYIUgU3JE1GC_FUVg3y41zBE0XJywqPLfoWkTUjrd6xBwgjQZ_3pzUjte9Qe9h4D96ZwQ9Mq6TazofrJEZlyn2o-mqLk9ZIc4uv4n6jMm-TBko4Zp5CMzZaG0q7ex40mvIGpeYd2iJBEg7tim2omal9FcMdhQb-nF_YEs
````
- Accept
````
application/json
````

Response:
```` 
{
    "id": 1,
    "name": "admin",
    "email": "admin@admin.com",
    "email_verified_at": null,
    "created_at": "2020-03-14T12:13:36.000000Z",
    "updated_at": "2020-03-14T12:13:36.000000Z"
}
```` 
### Logout
Get
http://127.0.0.1:8002/api/auth/logout
Headers:
- Authorization
````
Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmNkMmNkODZkZmEwN2QxNTkxOGM5YWYzMTYxNzA1ZjljZGNjZDdiZmQ0M2NjMDdjMDA3ZDY0OTEwOTg3MmRjNWFiNGVkYWNmMWYwMGE4NGUiLCJpYXQiOjE1ODQxOTA0NzgsIm5iZiI6MTU4NDE5MDQ3OCwiZXhwIjoxNjE1NzI2NDc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.g8gW0tIE0BxZ1JFMB1GOaa9ZNCpJp0raQ0tR3bBNS2ZRJuo_VigFRbFHoZT9sbYQ2qjNt1Z8X2G2HnMAa1fqpqfVeJ5VOzk-sBFGZeoLv25aJleSHp4fDG5fzU9JfHQJ2d450V9pOGh7GdO-o4A9k8pmKciFsiGQL3WGmfRc2VSBLyRlg_J3RANCCPdMPIqEnWeCnUvKdIYuzNgSwYjnq5e-dES_lATrY6hUv0r23Zvu-RMVBzwYhSYVRds7IJtJPq6QyGXLe8n3Klvvt1ZItQCp9163oJIYQSPeiJNcQg1psCzvppISf8mbZTx19Bn4xa1j4dNq2U90o_YdrBEAgcfs3pFR2jAji4WMuia1DY80F67wyd5xJzdCA7KFPk0xCJoAWXKmYnMFR6bAXnnm--c4g2vVDGGXRpFuJkAR6W_DeKzd8lSTe-AmgnHfze63stAqH15VRt10_QZEN7oZBOix1WLCnQkXK7bbXGpRUFyp1lEoxGul6Vweu3l1_aq7aUgrffcYIUgU3JE1GC_FUVg3y41zBE0XJywqPLfoWkTUjrd6xBwgjQZ_3pzUjte9Qe9h4D96ZwQ9Mq6TazofrJEZlyn2o-mqLk9ZIc4uv4n6jMm-TBko4Zp5CMzZaG0q7ex40mvIGpeYd2iJBEg7tim2omal9FcMdhQb-nF_YEs
````
- Accept
````
application/json
````

Response:
```` 
{
    "message": "Successfully logged out"
}
```` 




