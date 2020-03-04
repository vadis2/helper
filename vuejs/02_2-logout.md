# Logout
## mixin
````
methods {
...
    logout() {
      console.log("Start Logout. Token: " + localStorage.token);
      let headers = {
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + localStorage.token
        }
      };

      this.$http.post('/auth/logout', [], headers)
          .then(request => this.logoutSuccessful(request))
          .catch(request => this.logoutFailed(request));
    },
    logoutSuccessful(req) {
      // console.log(req);
      delete localStorage.token;
      this.allToFalse();
      this.userStoreConfig("");
      this.error = false;
      console.log("Logout!");
      this.$router.replace('/auth/sign-in');
    },
    logoutFailed(req) {
      console.log(req);
      this.error = true;
      this.message = 'Login failed!';
      // console.log("Logout Failed. Token: " + localStorage);
      // console.log("store.state.user: " + store.state.user);
    }
````
## vue
````
import mixin from "../../../mixins/mixin";

export default {
    name: ...,
    mixins: [mixin],
    
methods: {
  downloadData() {
        getCustomerFiles(this.$route.params.id)
          .then(response => {
            this.data = response.data.data;
            this.message = response.data.message;
            this.success = response.data.success;
            console.log(response);
          })
          .catch((error) => this.getFail(error));
      },
      getFail(error) {
        if (error.response) {
          console.log(error.response.data);
          console.log(error.response.status);
          this.logout();
        }
      }
````
