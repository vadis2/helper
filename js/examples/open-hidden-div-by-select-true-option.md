# Open hidden div by select true option
````
<div class="form-group">
    <label class="control-label col-md-4">User Type</label>

    <div class="col-md-6">
        <?php $old = (old('usertype_id') == '' ? '' : old('usertype_id')); ?>
        <select id="userType_id" class="form-control" name="usertype_id"  onchange="typeChanged()">
            <option value="">Choose User Type</option>
            @foreach($userTypes as $userType)
                <option value="{!! $userType->id !!}"
                        @if($userType->id == $old) selected="selected" @endif>
                    {!! $userType->name !!}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="form-group" id="units" style="visibility: hidden">
    <label class="control-label col-md-4">Units</label>

    <div class="col-md-6">
        <?php $old = (old('unit_id') == '' ? '' : old('unit_id')); ?>
        <select class="form-control" name="unit_id">
            <option value="">Choose Unit</option>
            @foreach($units as $unit)
                <option value="{!! $unit->id !!}"
                        @if($unit->id == $old) selected="selected" @endif>
                    {!! $unit->state_code . ' ' . $unit->zip . ' ' . $unit->city . ' ' . $unit->address_line_1 . ' ' . $unit->address_line_2 !!}
                </option>
            @endforeach
        </select>
    </div>
</div>

<script>
    function typeChanged() {
        var select = document.getElementById("userType_id");
        if (select.options[select.selectedIndex].value == 1)
        {
            document.getElementById("units").style.visibility = 'visible';
        } else {
            document.getElementById("units").style.visibility = 'hidden';
        }
    }
</script>
````