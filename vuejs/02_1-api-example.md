# API
## create httpClient
````
import axios from 'axios'

const httpClient = axios.create({
  baseURL: process.env.VUE_APP_API_URL,
  timeout: 5000
});

const getAuthToken = () => localStorage.token;

const authInterceptor = (config) => {
  config.headers['Accept'] = 'application/json';
  config.headers['Authorization'] = 'Bearer ' + getAuthToken();
  return config;
};

httpClient.interceptors.request.use(authInterceptor);

export default httpClient;
````
## create endpoint
````
import httpClient from './httpClient';
import store from "../store";

const END_POINT = '/customers/';


const getAllComments = (customerId) => httpClient.get(END_POINT + customerId + "/comments");
const createComment = (customer_id, author_id, parent_id, comment, level) => httpClient.post(END_POINT + customer_id + "/comments", {customer_id, author_id, parent_id, comment, level});
const updateComment = (customer_id, comment_id, author_id, parent_id, comment, level) => httpClient.put(END_POINT + customer_id + "/comments/"  + comment_id, {customer_id, author_id, parent_id, comment, level});
const deleteComment = (customerId, commentId) => httpClient.delete(END_POINT + customerId + "/comments/" + commentId);

export {
  getAllComments,
  createComment,
  updateComment,
  deleteComment
}
````
## import endpoint to .vue
````
import {addDetails} from "../api/addDetails";
````
## using
````
create() {
    let user_id = store.state.userDetails.userId;
    let prefix = this.prefix;
    let first_name = this.first_name;
    let last_name = this.last_name;
    let suffix = this.suffix;
    let work_title = this.work_title;
    let work_department = this.work_department;
    let work_role = this.work_role;
    let phone_home = this.phone_home;
    let phone_work = this.phone_home;
    let phone_extension = this.phone_extension;
    let phone_mob = this.phone_mob;
    let phone_fax = this.phone_fax;
    let email_work = this.email_work;
    let email_personal = this.email_personal;
    let line_1 = this.line_1;
    let line_2 = this.line_2;
    let city = this.city;
    let state = this.stateAddress;
    let zip = this.zip;
    let status = this.statusDetails;

    addDetails(user_id, prefix, first_name, last_name, suffix, work_title, work_department, work_role, phone_home, phone_work, phone_extension, phone_mob, phone_fax, email_work, email_personal, line_1, line_2, city, state, zip, status)
      .then(request => this.createSuccess(request))
      .catch((request) => this.createFail(request));
  },
  createSuccess(req) {
    this.errors = false;
    this.error = false;
    this.flash('New UserDetails are created.', 'success');
    this.$router.replace(this.$route.query.redirect || '/admin/customers/' + this.$route.params.id + '/show');
  },

  createFail(req) {
    this.errors = false;
    this.error = 'New UserDetails creating failed! ' + req;
    console.log(req);
  }
````
