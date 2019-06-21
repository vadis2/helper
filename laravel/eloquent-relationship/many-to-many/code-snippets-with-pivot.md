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
        return $this->belongsToMany('App\Models\Company', 'user_companies')->withTimestamps();
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
````
## Create user
````
$user->companies()->attach($request->get('company'));
````