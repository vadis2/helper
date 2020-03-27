# Table Final 
## Html part:
````
<template>
  <div className="animated">
    <b-card>
      <b-card-header>
        <i class="icon-menu mr-1"></i>Book Index
        <a href="https://coreui.io/pro/vue/" class="badge badge-danger">Demo Module Static</a>
        <div class="card-header-actions">
          <a href="https://github.com/matfish2/vue-tables-2" rel="noopener noreferrer" target="_blank" className="card-header-action">
            <small className="text-muted">docs</small>
          </a>
        </div>
      </b-card-header>
      <b-card-body>
        <v-client-table :columns="columns" :data="data" :options="options" :theme="theme" id="dataTable">
<!--          <a slot="uri" slot-scope="props" target="_blank" :href="props.row.uri" class="icon-eye"></a>-->

<!--          <div slot="child_row" slot-scope="props">-->
<!--            The link to {{props.row.name}} is <a :href="props.row.uri">{{props.row.uri}}</a>-->
<!--          </div>-->
        </v-client-table>
      </b-card-body>
    </b-card>
  </div>
</template>
````

## Script part:
````
<script>
    import Vue from 'vue'
    import {ClientTable, Event} from 'vue-tables-2'

    Vue.use(ClientTable)

    export default {
        name: 'Books',
        components: {
            ClientTable,
            Event
        },
        data: function () {
            return {
                columns: ['id', 'title', 'author_name', 'actions'],
                data: [],
                options: {
                    headings: {
                        id: 'ID',
                        title: 'Title',
                        author_name: 'Author Name',
                        actions: 'Actions'
                    },
                    sortable: ['title', 'author_name'],
                    filterable: ['title', 'author_name'],
                    sortIcon: {base: 'fa', up: 'fa-sort-asc', down: 'fa-sort-desc', is: 'fa-sort'},
                    pagination: {
                        chunk: 5,
                        edge: false,
                        nav: 'scroll'
                    }
                },
                useVuex: false,
                theme: 'bootstrap4',
                template: 'default'
            }
        },
        mounted() {
            this.$http.get('/book')
                .then(response => (
                    this.data = response.data.data
                ))
                .catch(error => console.log(error));
        }
    };
</script>

````
