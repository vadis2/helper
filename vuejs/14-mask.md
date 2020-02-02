# Mask
## Import
````
import MaskedInput from 'vue-text-mask';
  
export default {
...
   components: {
      MaskedInput,
    },
...
````
## Layout
````
<b-form-group
    label="Phone Home"
    label-for="phone_home"
    :label-cols="3"
>
  <masked-input
      id="phone_home"
      v-model="$v.phone_home.$model"
      :mask="['(', /[1-9]/, /\d/, /\d/, ')', ' ', /\d/, /\d/, /\d/, '-', /\d/, /\d/, /\d/, /\d/]"
      type="text"
      :class="status($v.phone_home)"
      class="form-control">

  </masked-input>
 </b-form-group>
````
1. insert tag ````masked-input````
2. insert :mask=...

## Check
