# Select
## Options from API
### Logic
1. hook created gives options data (dirty) optionsApi that is in data()
2. computed reacts on the change of optionsApi and creates options from optionsApi and departmentId. 

### Layout
````
<b-form-group
  label="Department"
  label-for="department_id"
  :label-cols="3"
>
  <b-form-select id="department_id"
                 v-model="departmentId"
                 :plain="true"
                 :options=options
                 value="Please select">
  </b-form-select>
</b-form-group>
````
### data
````
data() {
    return {
        // options are absent!
        optionsApi: [], // item list for select. ust be processed
        departmentId: ''
    }
},
````
### get source of options data
````
created() {
    // get source data to process it and insert it in the select
    let headers = {
        headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + localStorage.token
        }
    };
    this.$http.get(API_URL + '/organizations', headers)
        .then(response => (
            this.optionsApi = response.data.data
        ));

},
````
### process the source of the list to create it
````
computed() {
    // create item list for select
    options: function () {
        let trick = this.optionsApi;
        console.log(trick);
        let optionsArr = [
            {value: 0, text: "Select Organization"}
        ];

        trick.forEach(function (item, index, array) {
            console.log(item.id + " " + item.name)

            let row = {
                value: item.id,
                text: item.name
            };

            optionsArr.push(row)
        });
        console.log(optionsArr);

        console.log('departmentId:');
        console.log(trick.find(x => x.id === this.$route.params.id));

        return optionsArr;
    },
    // create selected item from the list
    departmentId: function () {
        let trick = this.optionsApi;
        console.log('departmentId:');
        console.log(trick);
        console.log(trick.find(x => x.id === this.$route.params.id));

        let departmentId = trick.find(x => x.id === this.$route.params.id).department_id;

        return departmentId
    }
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




