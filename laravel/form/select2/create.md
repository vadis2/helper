# Select2. Create part
## View
````
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
````
````
<div class="form-group">
    <label class="col-sm-3 control-label">Genres</label>

    <?php
    if (old('genres')) {
        $arrayJs = '[' . implode(",", old('genres')) . ']';
    } else {
        $arrayJs = '[]';
    }
    ?>

    <div class="col-sm-9">
        <select class="form-control select2" multiple="multiple"
                data-placeholder="Select Genres" name="genres[]"
                style="width: 100%;">
            @foreach($genres as $key=>$genre)
                <option value="{{ $key }}">{{ $genre->name }}</option>
            @endforeach
        </select>
    </div>
</div>
````
````
<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2();
    });
    // Example:    $('.select2').val(["1","2"]);
    $('.select2').val({{ $arrayJs }});
</script>
````

## Controller
````
public function create()
    {
        ...
        $genres  = Genre::all()->keyBy('id');
        ...
        
        return view('albums-admin::admin.albums.create', compact(
            ...
            'genres',
            ...
        ));
    }
    
public function store(AlbumRequest $request)
{
    ...
    
    $album = new Album([
        ...
        'genres'       => json_encode($request->genres),
        ...
    ]);
    
    $album->save();
    
    return redirect(route('admin/albums'))->with('status', 'New Album has been created!');
}
````
### With pivot table (many to many)
````
public function store(CreateSystemUserRequest $request)
{
    ...
    $user = new User([
        ...
    ]);

    $user->save();

    $user->companies()->attach($request->companies2);

    return redirect()->route('admin/manage/system-users')->with('status', 'A new User has been created!');
}
````

## DB
````
Schema::create('albums', function (Blueprint $table) {
    ...
    $table->string('genres', 100)->nullable();
    ...
});
````

### pivot table
If many-to-many relationships is setup it is enough.
