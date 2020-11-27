# Index policy
## Policy file
````
public function viewAny(User $user)
    {
        if ($user->isAdmin() or $user->isSuperAdmin()) {
            return true;
        }

        return null;
    }
````
## Controller
````
    public function index()
    {

        $userAuth = Auth::user();

        if ($userAuth !== null) {
            if ($userAuth->can('viewAny', Citizen::class)) {
                $citizens = Citizen::select([
                    'id',
                    'user_id',
                    'first_name',
                    'last_name',
                    'created_at',
                    'updated_at'
                ])->get();

                return response()->json([
                    'success' => true,
                    'code'    => 200,
                    'message' => 'Created Citizen Index',
                    'data'    => $citizens
                ]);
            }
        }

        return response()->json([
            'success' => false,
            'code'    => 403,
            'message' => 'You do not have permission.',
            'data'    => null
        ], 403);

    }
````
## Route middleware
````
Route::get('/citizens', 'CitizensController@index')->middleware('can:viewAny,App\Models\Citizen');
````
