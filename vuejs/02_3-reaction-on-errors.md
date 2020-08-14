# Reaction on errors
````
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
