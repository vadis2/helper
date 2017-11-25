````
$requests = ProjectRequest::where('user_id', $user->id)->get();
$units    = Unit::all();
$units    = $units->keyBy('id');

$filtered = $requests->filter(function ($request, $key) use ($units) {
    $unit    = $units[$request->unit_id];

    if ($unit->status === 'paid') {
        return $request;
    }
});

return $filtered;
````