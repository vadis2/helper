````
<select class="form-control c-form__select c-form__select--light-grey"
        id="company" name="company">
    <option class="c-form__option c-form__option--light-grey" value="0">
        Select
    </option>
    @foreach($companies as $companyId=>$item)
        <option class="c-form__option c-form__option--light-grey"
                value={{ $companyId }} @if((old('company') and (old('company') == $companyId)) or (!old('company') and $userCompany[0]->id == $companyId)) selected="selected" @endif>
            {{ $item->name }}
        </option>
    @endforeach
</select>
````