# Table
## Insert table in the layout
````
<v-client-table :columns="columns" :data="data" :options="options" :theme="theme" id="dataTable">
  <p slot="actions" slot-scope="props">
    <a :href="'#/admin/customers/' + props.row.id + '/show'" class="fa fa-user-o action-icon"></a>
    <a :href="'#/admin/customer-comments/' + props.row.id" class="fa fa-comment-o action-icon"></a>
    <a :href="'#/admin/customers/' + props.row.id + '/edit'" class="icon-pencil action-icon"></a>
    <a :href="'#/admin/customers/' + props.row.id + '/files'" class="fa fa-files-o action-icon"></a>
    <a class="icon-trash" v-on:click="deleteCustomer(props.row.id)" style="cursor: pointer"></a>
  </p>

  <!--          <div slot="child_row" slot-scope="props">-->
  <!--            The link to {{props.row.name}} is <a :href="props.row.uri">{{props.row.uri}}</a>-->
  <!--          </div>-->
</v-client-table>
````
````data```` is source of data
````options```` is settings
````columns```` is imported DB columns

## Import libraries, scripts
````
import Vue from "vue";
import {ClientTable, Event} from 'vue-tables-2';

const API_URL = process.env.VUE_APP_API_URL;
Vue.use(ClientTable);
````

## Define vue page
````
export default {
    name: "Files",
    components: {
      ClientTable,
      Event,
      ...
    },
````

## Define data()
````
data() {
  return {
    columns: ['id', 'name', 'type', 'organization.name', 'created_at', 'updated_at', 'actions'],
    data: [],
    options: {
      headings: {
        id: 'ID',
        name: 'Account Name',
        type: 'Type',
        'organization.name': 'Organization',
        created_at: 'Created',
        updated_at: 'Updated',
        actions: 'Actions'
      },
      sortable: ['name', 'type', 'organization.name', 'created_date', 'updated_date'],
      filterable: ['name', 'type', 'organization.name', 'created_date', 'updated_date'],
      sortIcon: {base: 'fa', up: 'fa-sort-asc', down: 'fa-sort-desc', is: 'fa-sort'},
      pagination: {
        chunk: 5,
        edge: false,
        nav: 'scroll'
      }
    },
    ...
  }
},
````

## Style
````
<style lang="scss">
  #dataTable {
    width: 95%;
    margin: 0 auto;

    .VuePagination {
      text-align: center;
      justify-content: center;
    }

    .vue-title {
      text-align: center;
      margin-bottom: 10px;
    }

    .VueTables__search-field {
      display: flex;
    }

    .action-icon {
      margin-right: 10px;
    }

    .VueTables__search-field input {
      margin-left: 0.25rem;
    }

    .VueTables__limit-field {
      display: flex;
    }

    .VueTables__limit-field select {
      margin-left: 0.25rem !important;
    }

    .VueTables__table th {
      text-align: center;
    }

    .VueTables__child-row-toggler {
      width: 16px;
      height: 16px;
      line-height: 16px;
      display: block;
      margin: auto;
      text-align: center;
    }

    .VueTables__child-row-toggler--closed::before {
      content: "+";
    }

    .VueTables__child-row-toggler--open::before {
      content: "-";
    }
  }

</style>
````
## Dynamic data
````
methods: {
      deleteCustomer: function (customerId) {
        let headers = {
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + localStorage.token
          }
        };

        axios.delete(API_URL + '/customers/' + customerId, headers)
             .then(request => this.customerDeletingSuccessful(request))
             .catch((request) => this.customerDeletingFailed(request));
      },
      customerDeletingSuccessful(req) {
        this.errors = false;
        this.error = false;
        this.flash('The Customer is deleted.', 'success');

        this.downloadData();
      },
      customerDeletingFailed(req) {
        this.errors = false;
        this.error = 'Customer Deleting failed! ' + req;
      },

      downloadData() {
        let headers = {
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + localStorage.token
          }
        };

        axios.get(API_URL + '/customers', headers)
             .then(response => {
               this.data = response.data.data;
               this.message = response.data.message;
               this.success = response.data.success;
               console.log(this.message);
               console.log(this.success);
               console.log("data: " + this.data);
               console.log("start_date: " + this.data[1].start_date);
             })
             .catch(error => console.log(error));
      }
    },
    mounted() {
      this.downloadData();
    }
````
