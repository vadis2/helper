## Vuelidate. Manual
### documentation
https://vuelidate.netlify.com/#sub-basic-usage
### Rules
https://vuelidate.netlify.com/#sub-builtin-validators
### Example
https://vuejsdevelopers.com/2018/08/27/vue-js-form-handling-vuelidate/
### Live
https://jsfiddle.net/Vadis/dLka6x8w/1/
### Installation
1. From the root:
````
npm install vuelidate --save
````
2.Main.js:
````
import Vue from 'vue'
import Vuelidate from 'vuelidate'
Vue.use(Vuelidate)
````
3.Form:
````
<b-form-group
  description="Enter, please Name of the Controller"
  label="Name"
  label-for="name"
  :label-cols="3"
>
  <b-form-input
    id="name"
    v-model="$v.name.$model"
    :class="status($v.name)"
    type="text"
    placeholder="ControllerName">

  </b-form-input>
</b-form-group>
````
4.Script:
````
const API_URL = process.env.VUE_APP_API_URL;

import { required, alpha, minLength } from 'vuelidate/lib/validators'

export default {
    name: 'RoleCreate',
    data() {
        return {
            name: '',
            errors: [],
            myError: false
        }
    },
    validations: {
      name: {
          required,
          alpha,
          minLength: minLength(5)
      }
    },
    methods: {
        status(validation) {
            return {
                error: validation.$error,
                dirty: validation.$dirty
            }
        },
        checkForm: function (e) {
            // validation
            this.errors = [];

            if (!this.name) {
                this.errors.push('Controller Name is required.');
            }

            // if (!this.errors.length) {
            //     this.create();
            //     return true;
            // }
            if (!this.errors.length && !this.$v.name.$error) {
                this.create();
                return true;
            }

            e.preventDefault();
        },
        create() {
            let headers = {
                headers: {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ' + localStorage.token
                }
            };
            console.log(headers);
            let dataPost = {
                name: this.name,
                description: this.description
            };
            this.$http.post('/controllers', dataPost, headers)
                .then(request => this.controllerCreatingSuccessful(request))
                .catch((request) => this.controllerCreatingFailed(request));
        },

        controllerCreatingSuccessful(req) {
            this.errors = false;
            this.error = false;
            this.flash('New Controller is created.', 'success');

            this.$router.replace(this.$route.query.redirect || '/controllers/index')
        },

        controllerCreatingFailed(req) {
            this.errors = false;
            this.myError = 'Controller Creating failed! ' + req;
            console.log(req);
        }
    }
}
````
5.Style:
````
.dirty {
    border-color: #5A5;
    background: #EFE;
}

.dirty:focus {
    outline-color: #8E8;
}

.error {
    border-color: red;
    background: #FDD;
}

.error:focus {
    outline-color: #F99;
}
````
