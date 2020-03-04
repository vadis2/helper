# Form Edit
## Create component's structure (directory, file)
  * /src/components/Rating (from IDE)
  ````
  src
    | components
        | ButtonCounter.vue
  ````
## create demo-component "Button" to check working structure
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
## insert component in the working page to check demo-component 
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
## start to change the Button-component to own
Copy the content of Create file to the Edit file.

### Change Title
For example:
````
<b-card-header>
  <i class="icon-menu mr-1"></i> Edit File

  <div class="card-header-actions"></div>
</b-card-header>
````

### Change tag form
````
<b-form
  id="formEditFile"
  @submit.prevent=checkForm
  novalidate=novalidate
>
````

Remember about file upload. If there is upload:
````
<b-form
   id="formEditFile"
   @submit.prevent=checkForm
   novalidate=novalidate
   enctype="multipart/form-data"
 >
````
### Validation
1. Change Validation file
2. Change import of validation file
3. Change ````checkForm: function (e) ```` according to new validation rules.

### Props
1. Add data to props (data for editing)
2. Delete editing data from 
````
export default {
    ...,
    data: function () {
      return {
````
They are in the props already.

### Change create() to update()
1. Edit function
2. Add API endpoints
3. Import API endpoints
4. Edit events

## Edit parent page
### Template
Add  ````:fileInput="fileInput"````, that is needed by the props:
````
<div id="editFile" :style="{ 'display': displayEditForm}">
  <file-edit v-on:update-file-block="closeUpdateFileForm" v-on:file-is-updated="fileIsUpdated" :owner="owner" :customer="customer" :fileInput="fileInput"></file-edit>
  <hr>
</div>
````
### Reactive data
Add data for props in the reactive data:
````
fileInput: {
  description: ''
}
````

### Download required data
````
editFile: function (fileId) {
    this.displayEditForm = 'block';
    getFile(fileId)
      .then(response => {
        this.fileInput = response.data.data;
        this.message = response.data.message;
        this.success = response.data.success;
      })
      .catch((request) => this.getFileFailed(request));
    this.closeNewFileForm();
  },
  getFileFailed(req) {
    this.errors = false;
    this.error = 'File Information Getting failed! ' + req;
    console.log(req);
    this.flash(req.response.data.message + " Status code: " + req.response.data.code, 'error');
  },
````
## Component
Config buttons.
Config visibility if it s needed.

