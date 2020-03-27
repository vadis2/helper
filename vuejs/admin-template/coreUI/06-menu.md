# Menu
## Front-end
1. Copy-paste file menu. Path: src/views/wny/menu

2. Edit menu file.

3. Add to src/router/index.js:
````
// Views
const Dashboard = () => import('@/views/Dashboard')
...
const DashboardOrganizationGeneralManager = () => import('@/views/wny/dashboard/OrganizationGeneralManager')
````
````
{
  path: 'dashboard-organization-general-manager',
  name: 'DashboardOrganizationGeneralManager',
  component: DashboardOrganizationGeneralManager
},
````

It will lead to the error in the browser due to absence of the page.

4. Copy-paste page in src/views/wny/dashboard: create OrganizationGeneralManager.vue

5. Edit OrganizationGeneralManager.vue

6. src/containers/DefaultContainer.vue

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
7.src/store.js

Create initial value:
````
state: {
    user: {
      loggedIn: false,
      isSuperadmin: false,
      isDeveloper: false,
````
8. src/mixin/mixin.js
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
9. Check front-end.

## Back-end
1. Create middleware
* copy-paste from existing
* register it in kernel.php
