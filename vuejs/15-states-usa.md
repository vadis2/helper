# USA states implementation
## Import
````
import {states} from './../shared/states';
````
## Vue data
````
export default {
    ...
    data() {
      return {
        ...
        states: states,
        ...
      }
    },
````


## Layout
````
<b-form-group label="State"
              label-for="state"
              :label-cols="4"
              class="label-bold">
  <b-form-select id="state"
                 v-model="$v.state.$model"
                 :plain="true"
                 :options=states
                 :class="status($v.state)">
  </b-form-select>
</b-form-group>
````
