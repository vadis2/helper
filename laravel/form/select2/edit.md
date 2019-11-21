# Select2. Edit part
## View
````
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
````
````
<div class="form-group c-form__form-group c-form__form-group--edit">
    <label class="c-form__label c-form__label--edit c-form__label--light-grey"
           for="company">Company</label>

    <?php
    if (old('companies')) {
        $arrayJs = '[' . implode(",", old('companies')) . ']';
    }
    ?>

    <div class="col-sm-9">
        <select class="form-control select2" multiple="multiple"
                data-placeholder="Select Companies" name="companies[]"
                style="width: 100%;">
            @foreach($companies as $key=>$company)
                <option value="{{ $key }}">{{ $company->name }}</option>
            @endforeach
        </select>
    </div>
</div>
````
````
<script>
    $(document).ready(function () {
        //Initialize Select2 Elements
        $('.select2').select2();
    });

    // example: $('.select2').val(["1","2"]);
    $('.select2').val({{ $arrayJs }});
</script>
````

## Controller
````
public function edit($id)
{
    ...
    $companiesSelected = $userEdited->companies()->get()->pluck('id')->toArray();

    // We must create js array
    $arrayJs = '[' . implode(",", $companiesSelected) . ']';

    ...
    
    return view('admin.manage.system-users.edit',
        compact(
            ...
            'arrayJs',
            ...
        )
    );
}

public function update(AlbumRequest $request, $id)
{
    $album = Album::whereId($id)->first();
    
    ...
    $album->genres       = json_encode($request->genres);
    ...
    
    $album->save();
    
    return redirect(route('admin/albums'))->with('status', 'The Album has been edited!');
}
````

### With pivot table (many to many)
````
public function update(EditSystemUserRequest $request, $id)
{
    $user = User::whereId($id)->first();

    ...
    
    $user->save();

    $user->companies()->sync($request->companies);

    return redirect()->route('admin/manage/system-users')->with('status', 'The User has been updated!');
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
