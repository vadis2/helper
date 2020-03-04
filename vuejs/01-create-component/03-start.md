# How to build component
## Links
There are problem:
 1. What is it? 
 Ready lib?  Or Not? If not how to use in other app?
 https://frontstuff.io/build-your-first-vue-js-component

## Task Workflow
### From the zero
* create component's structure (directory, file)
  * /src/components/Rating (from IDE)
  ````
  src
    | components
        | ButtonCounter.vue
  ````
* create demo-component "Button" to check working structure
````
<template>
    <button v-on:click="count++">Счётчик кликов — {{ count }}</button>
</template>

<script>
    export default {
        name: "ButtonCounter",
        data: function () {
            return {
                count: 0
            }
        }
    }
</script>

<style scoped>

</style>
````
  * insert component in the working page to check demo-component 
  ````
  <template>
    <div id="...">
      ...
      <button-counter></button-counter>
      ...
    </div>
  </template>
  
  <script>
  ...
  import ButtonCounter from "./components/ButtonCounter";
  
  export default {
    ...,
    components: {
      ...,
      ButtonCounter
    }
  }
  </script>
  
  <style>
  ...
  </style>
  ````
* create component with static demo values in the layout
* move static demo values in the props
````
<script>
  export default {
    name: "CustomerUsers",
    props: ['users'],
    data: function () {
      return {

      }
    }
  }
</script>
````
Using:
````
data() {
  return {
    customer: {
      name: "Customer WNY2",
      organization: "WNY2",
      type: "Business",
      city: "New York2",
      line_1: "408 3rd Court Brentwood",
      line_2: "22",
      state: "Ca",
      zip: 11718,
      customer_owner_user: "John Higgins"
    },
    users: [
      {'id': 1, 'name': 'Eleanor Rigby'},
      {'id': 2, 'name': 'Sargent Peppers'}
    ]
  }
},
````
* get values for props from the request
  * create endpoints in the api
  * import constants of endpoints in the vue-file
  * check and process api-data to substitute demo values
* insert component in the working page. 
