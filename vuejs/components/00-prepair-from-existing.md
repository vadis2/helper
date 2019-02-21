# How to prepare a new component
Do it from existing component.

## router.js  
Copy-paste existing route code:
````
{
   path: '/admin/table',
   name: 'admin.mytable',
   component: Table,
   meta: {
       auth: {roles: 1, redirect: {name: 'login'}, forbiddenRedirect: '/403'}
   }
},
````
Edit it to:
````
{
   path: '/admin/table1',
   name: 'admin.mytable1',
   component: Table1,
   meta: {
       auth: {roles: 1, redirect: {name: 'login'}, forbiddenRedirect: '/403'}
   }
},
````
Add page:
````
import Table1 from './pages/Table1'
````

Create page:
````
<template>
    <div id="app2">
        <img width="25%" src="../assets/logo.png">

        <v-client-table :data="tableData" :columns="columns" :options="options"></v-client-table>
    </div>
</template>

<script>
    // import HelloWorld from "../components/HelloWorld";

    export default {
        name: "Table",
        // components: {
        //     HelloWorld
        // },
        // data() {
        //     return {
        //         columns: ["id", "name", "age"],
        //         tableData: [
        //             { id: 1, name: "John", age: "20" },
        //             { id: 2, name: "Jane", age: "24" },
        //             { id: 3, name: "Susan", age: "16" },
        //             { id: 4, name: "Chris", age: "55" },
        //             { id: 5, name: "Dan", age: "40" }
        //         ],
        //         options: {
        //             // see the options API
        //         }
        //     };
        // }


        data() {
            return {
                columns: ["id", "name", "slug", "description"],
                has_error: false,
                tableData: [],
                options: {
                    // see the options API
                }
            }
        },
        mounted() {
            this.getRoles()
        },
        methods: {
            getRoles() {
                this.$http({
                    url: `roles`,
                    method: 'GET'
                })
                    .then((res) => {
                        this.tableData = res.data.roles
                    }, () => {
                        this.has_error = true
                    })
            }
        }
    };
</script>

<style>
    #app2 {
        font-family: "Avenir", Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 60px;
    }
</style>
````
It is important to create data for rendering at the server:
````
data() {
    return {
        columns: ["id", "name", "slug", "description"],
        has_error: false,
        tableData: [],
        options: {
            // see the options API
        }
    }
},
````