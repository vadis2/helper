# Code
## Component
### Layout
#### Tag ````form````
````
<b-form
  id="formNewFile"
  @submit.prevent=checkForm
  novalidate=novalidate
  enctype="multipart/form-data"
>
````
Accent on ````enctype="multipart/form-data"````!

#### ````input````
````
  <b-form-group
    label="File input"
    label-for="file"
    :label-cols="3"
  >
    <input type="file"
           id="file"
           ref="file"
           v-on:change="handleFileUpload()"
           v-if="uploadReady"
           style="display: block; margin-bottom: 25px;"/>
    <a class="btn btn-warning" @click="clear">Clear File</a>
  </b-form-group>
````
Important! Don't use ````b-form-input````!  This has a bug. Use simple ````input````.

#### Buttons
````
<b-button type="submit"
          variant="primary"
          style="margin-right: 10px">
  Save User
</b-button>
<a class="btn btn-info"
          v-on:click="closeForm"
          style="margin-right: 10px">
  Close form
</a>
<a class="btn btn-danger"
   v-on:click="cancel">
  Cancel
</a>
````

Important! Don't use type "reset" for Cancel and for Close Form. Type "reset" break natural Vue workflow. Instead of type "reset" use ````a```` and add different methods. 

### Script
````
data: function () {
  return {
    ...,
    file: '',
    uploadReady: true
  }
},
````
````
  cancel() {
    this.clear();
    this.fileInput.description = '';
  },
  clear() {
    this.uploadReady = false;
    this.$nextTick(() => {
      this.uploadReady = true
    })
  },
  handleFileUpload() {
    this.file = this.$refs.file.files[0];
    console.log("file: ");
    console.log(this.file);
  },
  closeForm() {
    this.cancel();
    this.$emit('add-file-block', false);
  },
````
````
create() {
    let headers = {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ' + localStorage.token
      }
    };
    console.log(this.file.name);
    let formData = new FormData();
    formData.append('photo', this.file);
    formData.append('filename', this.file.name);
    formData.append('owner_user_id', this.owner.owner_user_id);
    formData.append('owner_object_type', this.owner.owner_object_type);
    formData.append('owner_object_id', this.owner.owner_object_id);
    formData.append('description', this.fileInput.description);
    this.$http.post('/files', formData, headers)
        .then(request => this.createSuccess(request))
        .catch((request) => this.createFail(request));
  },
  createSuccess(req) {
    this.errors = false;
    this.error = false;
    this.flash('New File is created.', 'success');
    this.clear();
    this.fileInput.description = '';
    this.$emit('file-is-added', true);
    // this.$router.replace(this.$route.query.redirect || '/admin/customers/' + store.state.userDetails.customerId + '/files');
  },

  createFail(req) {
    this.errors = false;
    this.error = 'New File creating failed! ' + req;
    console.log(req);
  }
}
````
Attention to ````file````!

## Parent
-

## Validation
### Layout
````
  <b-form-group
    label="File input"
    label-for="file"
    :label-cols="3"
  >
    <input type="file"
           :class="status($v.file)"
           id="file"
           ref="file"
           v-on:change="handleFileUpload()"
           v-if="uploadReady"
           style="display: block; margin-bottom: 25px;"/>
    <a class="btn btn-warning" @click="clear">Clear File</a>
  </b-form-group>
````
Important! ````:class="status($v.file)"```` only.
Not model: file field is only read.

### Script
````    
checkForm: function (e) {
    ...,
    // File
    if (!this.$v.file.required) {
      this.errors.push('File is required.');
    }
````    
### File of validation rules
````
export const validations = {
  file: {
    required
  },
````
