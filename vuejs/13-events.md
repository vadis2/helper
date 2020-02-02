# Events
## Fire event in method
````
<a v-if="item.detailsExist != true" v-on:click="addDetails(item.id)" class="btn btn-success">Add Details</a>

methods: {
  addDetails(id) {
    this.$emit('add-details', {'customer_id': this.customer_id, 'user_id': id});
    this.$router.push({path: '/admin/user-details/create'})
  }
}
````
## How organize an event from a child to a parent
### Create event in the child
````
this.$emit('new-customer-user-created', true);
````
'new-customer-user-created' is event name.
true - argument that is passed with event.
### Create listening of the event in the parent
````
<customer-user-add v-on:new-customer-user-created="downloadData"></customer-user-add>
````
'new-customer-user-created' is event name.true
downloadData - function, that works when an event is fired.
