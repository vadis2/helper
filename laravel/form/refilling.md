# Refilling
## edit
````
value="{{ old('company') ? old('company') : $handyman->company }}"

<option value="{!! $user->id !!}" @if(old('user_id') == $user->id or $request->user_id == $user->id) selected="selected" @endif>
   {!! $user->name !!}
</option>

District: <input type="radio" class="flat" name="vicinity" value="district"
   @if(old('vicinity') == 'district'
   or $request->vicinity == 'district') checked="" @endif />
````
## create
````
value="{{ old('company') }}"
````

## Select2
````
<?php
    if (old('genres')) {
        $arrayJs = '[' . implode(",", old('genres')) . ']';
    }
?>

in js (it's not php array!):
//  $('.select2').val(["1","2"]);
    $('.select2').val({{ $arrayJs }});
````

## CKE editor
````
<textarea id="editor1" name="editor1" rows="10" cols="80"
  placeholder="About">{{ old('editor1') }}</textarea>
````
````
<textarea id="editor1" name="editor1" rows="10" cols="80"
  placeholder="About">{{ old('editor1') ? old('editor1') : $album->about }}</textarea>
````