# How to build component from the zero
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
### template
````
<b-form
  id="formNewFile"
  novalidate=novalidate>
  <b-row>
    <b-col>
      <b-row>
        <b-col class="md-6">
            <b-form-group
              label="Description *"
              label-for="description"
              :label-cols="3"
              class="label-bold"
            >
              <b-form-input
                id="description"
                v-model="file.description"
                type="text">
            
              </b-form-input>
            </b-form-group>
        
            <div slot="footer">
                <b-button type="submit"
                          variant="primary"
                          style="margin-right: 10px">
                  Save User
                </b-button>
            </div>
        </b-col>
      </b-row>
    </b-col>
  </b-row>
</b-form>
````
Accent on ````v-model="file.description"````

### script
````
data: function () {
  return {
    file: {
      description: ''
    }
  }
}
````
### page that calls component
#### Template
* Change component name from ````button-counter```` to ````new-file````
* add ````:file="file"````
````
<new-file :file="file"></new-file>
````
#### script
````
import NewFile from "../../../components/NewFile";
````
````
components: {
  ...,
  NewFile
},
````
````
data() {
  return {
    ...,
    file: {
      description: 'Description',
      owner_user_id: 16
    }
  }
}
````
### Check changes

## Create validation
### Create validation file
#### validation of object's properties
````
import {required, integer} from 'vuelidate/lib/validators'
import {alphaSpaceDotHyphen} from '../../shared/validation-rules'

export const validations = {
  file: {
    description: {
      alphaSpaceDotHyphen
    },
    owner_user_id: {
      required,
      integer
    }
  }
};
````
#### validation of simple properties
````
import {required, integer} from 'vuelidate/lib/validators'
import {alphaSpaceDotHyphen} from '../../shared/validation-rules'

export const validations = {
  description: {
    alphaSpaceDotHyphen
  },
  owner_user_id: {
    required,
    integer
  }
};
````
### Import validation file
#### script in the component
````
import {validations} from '../components/validations/addDetails';
````
````
export default {
  ...,
  validations: validations
````
Check the page, that calls component.

#### layout of the component
````
$v.file.description.$model
````
Insert ````$v.....$model```` in all fields.

#### Check

#### layout of the component
````
<b-form
  ...
  @submit.prevent=checkForm
````
````
<b-form-input
  ...
  :class="status($v.file.description)">

</b-form-input>
    <b-row>
        <b-col>
          <b-row>
            <div class="alert alert-danger" v-if="errors.length">
              <b>Correct, please the following error(s):</b>
              <ul>
                <li v-for="error in errors">{{ error }}</li>
              </ul>
            </div>
            <div class="alert alert-danger" v-if="error">
              {{ error }}
            </div>
          </b-row>
````
If there is another component with errors/error, name them fileErrors/fileError.

#### script in the component
````
status(validation) {
        return {
        error: validation.$error,
        dirty: validation.$dirty
    }
},
````
````
checkForm: function (e) {
        // validation
        this.errors = [];

        // description
        if (!this.$v.file.description.alphaSpaceDotHyphen) {
          this.errors.push('Description must consist of letters, spaces. dots, hyphens only.');
        }

        // owner_user_id
        if (!this.$v.file.owner_user_id.required) {
          this.errors.push('Owner-User ID is required.');
        }

        if (!this.$v.file.owner_user_id.integer) {
          this.errors.push('Owner-User ID must be integer required.');
        }

        if (!this.errors.length && !this.error.length) {
          this.create();
          return true;
        }

        e.preventDefault();
      },
      create() {
        let owner_user_id = this.file.owner_user_id;
        let description = this.file.description;

        addDetails(user_id, prefix, first_name, last_name, suffix, work_title, work_department, work_role, phone_home, phone_work, phone_extension, phone_mob, phone_fax, email_work, email_personal, line_1, line_2, city, state, zip, status)
          .then(request => this.createSuccess(request))
          .catch((request) => this.createFail(request));
      },
      createSuccess(req) {
        this.errors = false;
        this.error = false;
        this.flash('New UserDetails are created.', 'success');
        this.$router.replace(this.$route.query.redirect || '/admin/customers/' + +store.state.userDetails.customerId + '/show');
      },

      createFail(req) {
        this.errors = false;
        this.error = 'New UserDetails creating failed! ' + req;
        console.log(req);
      }
````
#### Check wrong data

### Create API endpoint
````
import httpClient from './httpClient';
import store from "../store";

const END_POINT = '/files';

const file = (owner_object_type, owner_object_id, description, filename, owner_user_id) => httpClient.post( END_POINT, {owner_object_type, owner_object_id, description, filename, owner_user_id});

export {
  file
}
````

### Import API endpoint
````
import {addFile} from "../api/addFile";
````
````
      create() {
        let owner_user_id = this.file.owner_user_id;
        let description = this.file.description;

        addDetails(user_id, prefix, first_name, last_name, suffix, work_title, work_department, work_role, phone_home, phone_work, phone_extension, phone_mob, phone_fax, email_work, email_personal, line_1, line_2, city, state, zip, status)
          .then(request => this.createSuccess(request))
          .catch((request) => this.createFail(request));
      },
````

### Create Buttons 'Cancel' and 'Back'
#### Component
##### Layout
````
<b-button type="reset"
          variant="info"
          v-on:click="closeForm"
          style="margin-right: 10px">
  Close form
</b-button>
<b-button type="reset"
          variant="danger">
  Cancel
</b-button>
````
##### Script (we use emit)
````
methods: {
      closeForm() {
        this.$emit('add-file-block', false);
      },
````
#### Parent Page
##### Layout
````
<new-file :file="file" v-on:add-file-block="closeNewFileForm"></new-file>
````
Add ````v-on:add-file-block="closeNewFileForm"````
````closeNewFileForm```` - is function
````    
methods: {
  ...,
  closeNewFileForm() {
    this.display = 'none';
  },
````   

#### Check 

### Add another fields
````
<b-form-group
    label="Owner User ID *"
    label-for="owner_user_id"
    :label-cols="3"
    class="label-bold"
  >
    <b-form-input
      plaintext
      id="owner_user_id"
      v-model="$v.file.owner_user_id.$model"
      type="text"
      :class="status($v.file.owner_user_id)">

    </b-form-input>
  </b-form-group>

  <b-form-group
    label="File input"
    label-for="fileInput"
    :label-cols="3"
  >
    <b-form-file id="fileInput" :plain="true"></b-form-file>
  </b-form-group>
````
### Pass value from the Parent page to the component
We use props.
#### Simple case. A small number of passing values
#####Parent page
###### Layout
````
<new-file v-on:add-file-block="closeNewFileForm" :owner_user_id="owner_user_id"></new-file>
````
Add ````:owner_user_id="owner_user_id"````. ````owner_user_id```` is passing value.
###### Script
Now we pass static value:
````
data() {
      return {
        ...,
        owner_user_id: 16,
````
##### Component
###### Script
````
export default {
    name: "NewFile",
    props: ['owner_user_id'],
````
###### Layout
````
<b-form-group
    label="Owner User ID *"
    label-for="owner_user_id"
    :label-cols="3"
    class="label-bold"
  >
    <b-form-input
      plaintext
      id="owner_user_id"
      v-model="$v.owner_user_id.$model"
      type="text"
      :class="status($v.owner_user_id)">

    </b-form-input>
  </b-form-group>
````
##### Validation rules
###### File of validation rules
```` 
import {required, integer, alpha} from 'vuelidate/lib/validators'
import {alphaSpaceDotHyphen} from '../../shared/validation-rules'

export const validations = {
  owner_user_id: {
      required,
      integer
  }
};
```` 
###### Reaction on errors
````
methods: {
  ...,
  checkForm: function (e) {
    ...,
    // owner_user_id
    if (!this.$v.owner_user_id.required) {
      this.errors.push('Owner-User ID is required.');
    }

    if (!this.$v.owner_user_id.integer) {
      this.errors.push('Owner-User ID must be integer required.');
    }
````
##### Check

#### Complex case. A big number of passing values
##### Parent page
###### Layout
````
<new-file v-on:add-file-block="closeNewFileForm" :owner="owner"></new-file>
````
Add ````:owner"owner"````. ````owner```` is passing value.
###### Script
Now we pass static value:
````
data() {
      return {
        ...,
        owner: {
            owner_user_id: 16,
            owner_object_type: customer
        }
````
##### Component
###### Script
````
export default {
    name: "NewFile",
    props: ['owner'],
````

###### Layout
````
<b-form-group
  label="Owner User ID *"
  label-for="owner_user_id"
  :label-cols="3"
  class="label-bold"
>
  <b-form-input
    plaintext
    id="owner_user_id"
    v-model="$v.owner.owner_user_id.$model"
    type="text"
    :class="status($v.owner.owner_user_id)">

  </b-form-input>
</b-form-group>
````
##### Validation rules
###### File of validation rules
```` 
import {required, integer, alpha} from 'vuelidate/lib/validators'
import {alphaSpaceDotHyphen} from '../../shared/validation-rules'

export const validations = {
  owner: {
    owner_user_id: {
        required,
        integer
  }
};
```` 
###### Reaction on errors
````
methods: {
  ...,
  checkForm: function (e) {
    ...,
    // owner_user_id
    if (!this.$v.owner.owner_user_id.required) {
      this.errors.push('Owner-User ID is required.');
    }

    if (!this.$v.owner.owner_user_id.integer) {
      this.errors.push('Owner-User ID must be integer required.');
    }

    ...
````
##### Check

#### Add other values to the props
Don't forget delete from data of component when move to props.
