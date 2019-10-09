# Menu
## Front-end
1. Copy-paste. Path: src/views/wny/menu

2. src/containers/DefaultContainer.vue

Create import: 
````
import navDeveloper from '../views/wny/menu/nav_developer'
````
Add in data():
```` 
data() {
    return {
        navSuperadmin: navSuperadmin.items,
        navGuest: navGuest.items,
        navDeveloper: navDeveloper.items,
        store: store
    }
},
```` 
Add in template:
````
<SidebarNav v-if="store.state.user.isSuperadmin === true" :navItems="navSuperadmin" ></SidebarNav>
<SidebarNav v-if="store.state.user.isDeveloper === true" :navItems="navDeveloper" ></SidebarNav>
````
3.src/store.js

Create initial value:
````
state: {
    user: {
      loggedIn: false,
      isSuperadmin: false,
      isDeveloper: false,
````

4.src/main.js

Add:
````
Vue.mixin({
  methods: {
    roleStoreConfig(mainRole) {
      this.allToFalse();
      switch (mainRole) {
        case 'superadmin':
          store.state.user.isSuperadmin = true;
          break;
        case 'developer':
          store.state.user.isDeveloper = true;
          break;
````
Add:
````
allToFalse() {
  store.state.user.isSuperadmin = false;
  store.state.user.isDeveloper = false;
````
## Back-end
1. Create middleware
* copy-paste from existing
* register it in kernel.php

2. 
