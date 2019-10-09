# Middleware. Dingo
## Links
https://github.com/dingo/api/wiki/Authentication

## In the controller
````
class LogoutController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['jwt.auth', 'activity'], []);
    }

    /**
     * Log the user out (Invalidate the token)
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        Auth::guard()->logout();

        return response()
            ->json(['message' => 'Successfully logged out']);
    }
}
````
### For specific method
````
public function __construct()
    {
        $this->middleware(['jwt.auth', 'activity'], ['only' => 'index']);
    }
````
