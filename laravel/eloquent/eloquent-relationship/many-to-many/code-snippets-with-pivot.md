# Objects
* Users
* Companies

# pivot table
user_company

# Model User
````
/**
     * The companies that belong to the user.
     */
    public function companies()
    {
        return $this->belongsToMany('App\Models\Company', 'user_companies')
            ->withTimestamps();

    }
````

# Model Company
````
/**
     * The users that belong to the company.
     */
    public function users()
    {
        return $this->belongsToMany('App\Models\User', 'user_companies');
    }
````

# Controller
## Get companies
````
$companies = $user->companies()->get();
$event = Event::whereId($id)
    ->with('users:name,email,user_type,citizen_id,company_id,creator_id')
    ->get();
````
### Structure, test
````
$response->assertJsonStructure(
            [
                'success',
                'code',
                'data' =>
                    [

                        "category_id",
                        "creator_id",
                        "payment_type",
                        "regions",
                        "type",
                        "active",
                        "read",
                        "title",
                        "description",
                        "max",
                        "map",
                        "created_at",
                        "updated_at",
                        "users" =>
                            [
                                [
                                    "name",
                                    "email",
                                    "user_type",
                                    "citizen_id",
                                    "company_id",
                                    "creator_id",
                                    "pivot" =>
                                        [
                                            'event_id',
                                            'user_id',
                                            'created_at',
                                            'updated_at'
                                        ]
                                ]
                            ]
                    ],
                'message'
            ]
````

## Create user
````
$user->companies()->attach($request->get('company'));
````
## Detach roles
All:
````
$user->roles()->detach();
````
Specified:
````
$user->roles()->detach([2, 3]);
````
