# Select
## Options from file
### Layout
````
<b-form-group
  label="State"
  label-for="state"
  :label-cols="3"
>
  <b-form-select id="state"
                 v-model="state"
                 :plain="true"
                 :options=states
                 value="Please select">
  </b-form-select>
</b-form-group>
````
### File with options (states.js in shared)
Attention! fields: value, text
````
export const states = [
  { value: 'AL', text: 'Alabama' },
  { value: 'AK', text: 'Alaska' },
  { value: 'AS', text: 'American Samoa', $isDisabled: true }
]
````
### import options data
````
import {states} from './../../../../shared/states'
````
### data
````
data() {
    return {
        state: '',
        states: states
    }
````
### mounted specific value:
Attention! ````this.state```` must contain simple value.
````
mounted() {
    let headers = {
        headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + localStorage.token
        }
    };

    this.$http.get(API_URL + '/user-profiles/' + this.$route.params.id, headers)
        .then(response => (
            this.user_id = response.data.data.user_id,
                this.state = response.data.data.state,
        ));
}
````




