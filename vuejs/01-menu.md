## Menu
https://stackoverflow.com/questions/34506368/what-is-the-best-way-to-show-different-menus-for-different-user-group-in-vue-js

````
<template>
    <admin-view v-if="userType === 'admin'"></admin-view>
    <user-view v-if="userType === 'user'"></user-view>
    <guest-view v-if="userType === 'guest'"></guest-view>
</template>
<script>
import GuestMenu from 'guestmenu.vue' //if you are using vueify you can use es6 syntax
import AdminMenu from 'adminmenu.vue'
import UserMenu from 'usermenu.vue'

export default {
  data(){
    return {
      userType : '' //This should be handled by some model or any other way
    }
  },
  components : {
    GuestMenu ,
    AdminMenu ,
    UserMenu 
  }
}
</script>
````
