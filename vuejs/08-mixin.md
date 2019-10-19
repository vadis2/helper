# Mixin
## Link
https://blog.bitsrc.io/understanding-mixins-in-vue-js-bdcf9e02a7c1
## Manual
1. Create src/mixins/mixin.js
````
export default {
  methods: {
    roleStoreConfig(mainRole) {
      this.allToFalse();
      switch (mainRole) {
        case 'superadmin':
          store.state.role.isSuperadmin = true;
          break;
````
2. In component:
````
import mixin from "../mixins/mixin";
````
````
export default {
    name: 'DefaultHeaderDropdownAccnt',
    mixins: [mixin],
````
