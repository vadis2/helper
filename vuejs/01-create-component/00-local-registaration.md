# Local registration
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

