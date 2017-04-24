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
