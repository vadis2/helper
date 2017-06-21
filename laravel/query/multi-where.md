# Multi where
````
$projects = DB::table('projects')
            ->where('handyman_id', '=', $handymanId)
            ->where('client_id', '=', $landlordId)
            ->get();
````
