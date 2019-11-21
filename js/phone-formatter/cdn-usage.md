````
<script src="https://unpkg.com/libphonenumber-js/bundle/libphonenumber-js.min.js"></script>
````
## trivial usage
````
<script>
  alert(new libphonenumber.AsYouType('US').input('213-373-4253'))
  alert(new libphonenumber.AsYouType('UA').input('+380961911997'))
````

## example of processing
````
  var phoneNumber = new libphonenumber.parsePhoneNumberFromString('0961911997', 'UA');
  console.log(phoneNumber.country);
  console.log(phoneNumber.formatInternational());
  console.log(phoneNumber.formatNational());  
</script>
````

## Real using
HTML
````
<div class="form-group">

    <label class="col-sm-2 control-label">{{ trans('companies.phone') }} </label>

    <div class="col-sm-10">
        <input type="text" class="form-control"
               placeholder="{{trans('companies.phone')}}"
               name="phone" value="{{ old('phone') }}" id="phone">
    </div>
</div>
````

JS
````
<script src="https://unpkg.com/libphonenumber-js/bundle/libphonenumber-js.min.js"></script>
````
````
$(document).ready(function () {
    $('#phone').on('focusout', function () {
        // country code
        var country = $('#country').val();

        // current phone
        var currentPhone = document.getElementById('phone').value;
        console.log(currentPhone);

        // processing of current code
        var phoneNumber = new libphonenumber.parsePhoneNumberFromString(currentPhone, country);
        console.log(phoneNumber.country);
        console.log(phoneNumber.formatInternational());
        console.log(phoneNumber.formatNational());

        // changing of input field
        $('input[id=phone]').val(phoneNumber.formatInternational());

    });
});

$(document).ready(function () {
    $('#mobile').on('focusout', function () {
        // country code
        var country = $('#country').val();

        // current phone
        var currentPhone = document.getElementById('mobile').value;
        console.log(currentPhone);

        // processing of current code
        var phoneNumber = new libphonenumber.parsePhoneNumberFromString(currentPhone, country);
        console.log(phoneNumber.country);
        console.log(phoneNumber.formatInternational());
        console.log(phoneNumber.formatNational());

        // changing of input field
        $('input[id=mobile]').val(phoneNumber.formatInternational());

    });
});
````