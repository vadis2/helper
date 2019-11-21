# Select fields
````
return \App\Dogs::select('name', 'age')
    ->where('age','<', 6)
    ->orWhere(function($q){
        $q->where('age','>', 8);
        $q->whereIn('name', ['Jane', 'Jerry']);
    })
    ->get();
````
