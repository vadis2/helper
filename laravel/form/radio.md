# Radio
## Create
````
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Mark for the Client
        <span class="required">*</span></label>
    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="row">
            <?php for ($i = 1; $i <= 9; $i++): ?>
            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-left: 16px">
                <?php echo $i; ?>
            </div>
            <?php endfor; ?>
            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-left: 12px">
                10
            </div>
        </div>
        <div class="row">
            <?php for ($i = 1; $i <= 10; $i++): ?>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <input type="radio" class="flat" name="mark_for_client"
                       value="<?php echo $i; ?>"
                       @if(old('mark_for_client') == $i) checked="" @endif />
            </div>
            <?php endfor; ?>
        </div>
    </div>
</div>
````

## Edit
````
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Mark for the
        Handyman <span class="required">*</span></label>
    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="row">
            <?php for ($i = 1; $i <= 9; $i++): ?>
            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-left: 16px">
                <?php echo $i; ?>
            </div>
            <?php endfor; ?>
            <div class="col-md-1 col-sm-1 col-xs-1" style="padding-left: 12px">
                10
            </div>
        </div>
        <div class="row">
            <?php for ($i = 1; $i <= 10; $i++): ?>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <input type="radio" class="flat" name="mark_for_handyman"
                       value="<?php echo $i; ?>"
                       @if(old('mark_for_handyman') == $mark->mark_for_handyman
                              or $mark->mark_for_handyman == $i) checked="" @endif />
            </div>
            <?php endfor; ?>
        </div>
    </div>
</div>
````