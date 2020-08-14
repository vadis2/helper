# Global registration
## File structure
````
src
  | components
      | ButtonCounter.vue
````
## Component ButtonCounter.vue
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
## Global registration in main.js
````
import Vue from 'vue'
import App from './App.vue'
import ButtonCounter from "./components/ButtonCounter";

Vue.config.productionTip = false;
Vue.component('button-counter', ButtonCounter);

new Vue({
  render: h => h(App),
}).$mount('#app')
````

## Using (local registration)
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

