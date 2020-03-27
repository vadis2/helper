# How to implement select into a form
## Template
```
<b-form-group label="Category *"
              label-for="lsCategoryId"
              :label-cols="3"
              class="label-bold"
>
  <b-form-select id="lsCategoryId"
                 v-model="$v.lsCategoryId.$model"
                 :plain="true"
                 :options=lsCategoryOptions
                 :class="status($v.lsCategoryId)">
  </b-form-select>
</b-form-group>
```
```lsCategoryId``` - field value
```lsCategoryOptions``` - a set of rows for drop down

## Create validation rules
wny/src/components/validations/leadSources.js
```
import {required, integer} from 'vuelidate/lib/validators'
import {alphaSpace} from '../../shared/validation-rules'

export const validations = {
  name: {
    required,
    alphaSpace
  },
  lsCategoryId: {
    required,
    integer
  }
};
```
## Import validation rules
```
import {validations} from '../../../components/validations/leadSources';
```
## Scrypt. Data
It's required to be reactive.
```
data() {
  return {
    name: '',
    lsCategoryOptions: [{value: 0, text: 'active'}, {value: 1, text: 'inactive'}],
    lsCategoryId: '',
    errors: [],
    error: false
  }
},
```
Options must have structure 
```
{
  value,
  text
}
```

## Use validations
```
data() {
  ...
},
validations: validations,
```

## To process errors
```$xslt
methods: {
  ...,
  status(validation) {
    return {
      error: validation.$error,
      dirty: validation.$dirty
    }
  },
  ...
}
```
