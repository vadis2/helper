# Requirement of refresh page after soft deleting or restoring
## Solurion
Insert if-block:
````
downloadData() {
    let headers = {
        headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + localStorage.token
        }
    };

    axios.get(API_URL + '/customers/soft-deleted', headers)
         .then(response => {
             if (response.status === 204) {
                 console.log('204');
                 this.data = [];
             } else {
                 this.data = response.data.data;
                 this.message = response.data.message;
                 this.success = response.data.success;
             }
         })
         .catch(error => console.log(error));
}
````
