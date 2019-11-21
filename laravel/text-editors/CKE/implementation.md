# CKE implementation
````
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Cover Letter <span
                class="required">*</span>
    </label>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <textarea id="letter" name="letter" rows="10" cols="80"
                      placeholder="Cover Letter">{{ old('letter') ? old('letter') : $bid->letter }}</textarea>
    </div>
    <!-- /.box -->
</div>

<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12">Requirements <span
                class="required">*</span>
    </label>
    <div class="col-md-6 col-sm-6 col-xs-12">
        <textarea id="requirements" name="requirements" rows="10" cols="80"
                  placeholder="Requirements">{{ old('requirements') ? old('requirements') : $bid->requirements }}</textarea>
    </div>
    <!-- /.box -->
</div>

@section('js')
    <!-- CK Editor -->
    <script src="{{ asset('ckeditor/ckeditor.js') }}"></script>

    <script type="text/javascript">
        $(function () {
            // Replace the <textarea id="letter"> with a CKEditor
            // instance, using default configuration.
            CKEDITOR.replace('letter');
            CKEDITOR.replace('requirements')
        });
    </script>
@endsection
````