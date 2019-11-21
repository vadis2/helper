# Select
## Options from file
### Layout
````
<b-form-group
  label="Status"
  label-for="status"
  :label-cols="3"
>
  <b-form-select id="status"
                 v-model="status"
                 :plain="true"
                 :options=statuses
                 value="Please select">
  </b-form-select>
</b-form-group>
````
### data
````
data() {
    return {
        status: '',
        statuses: ['active', 'inactive', 'terminated']
    }
},
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
            this.status = response.data.data.status,
   
        ));
}
````




