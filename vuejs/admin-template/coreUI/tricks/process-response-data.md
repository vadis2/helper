# Process response data
0.We have to make ````options```` from ````optionsApi````.

1.Get data ````optionsApi```` from response:
````
created() {
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
}
````
````mounted```` may be instead of ````created````.

2.Create ````optionsApi```` in reactive data:
```` 
export default {
    name: 'OrganizationCreate',
    data() {
        return {
            name: '',
            order: '',
            parentId: 'Please select an option',
            optionsApi: [],
            errors: [],
            myError: false
        }
    },
```` 
Do not use ````options```` in the reactive data (here).

3.Use in the form ````options````:
````
<b-form-group
  label="Parent Structure Item"
  label-for="parent_id"
  :label-cols="3"
>
  <b-form-select id="parent_id"
                 v-model="parentId"
                 :plain="true"
                 :options=options
                 value="Please select">
  </b-form-select>
</b-form-group>
````

4.Process ````optionsApi```` in ````computed````:
````
computed: {
            options: function () {
                let trick = this.optionsApi;
                console.log(trick);
                let optionsArr = [
                    {value: 0, text: "Select Parent Organization"}
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

                return optionsArr;
        },
````
