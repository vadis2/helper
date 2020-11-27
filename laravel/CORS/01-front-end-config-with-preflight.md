# Config
## To get env variables install:
````
npm install @nuxtjs/dotenv
````
## .env
````
ORIGIN=http://localhost:4002

or

ORIGIN=http://angularjs.pp.ua
````
## httpClient.js
Use Cookies or localStorage to get token.
+ "access_token" in the cookies is renamed in "token" for store
Set required headers.
````
import Cookies from 'js-cookie';
import axios from 'axios'

const httpClient = axios.create({
  baseURL: process.env.BASE_URL,
  timeout: 5000, // indicates, 1000ms ie. 1 second
});

// const getAuthToken = () => localStorage.token;
const getAuthToken = () => Cookies.get('token');

const authInterceptor = (config) => {
  config.headers['Origin'] = process.env.ORIGIN;
  config.headers['Accept'] = 'application/json';
  config.headers['Authorization'] = 'Bearer ' + getAuthToken();
  
  return config;
};

httpClient.interceptors.request.use(authInterceptor);

export default httpClient;
````

## API endpoints
````
import httpClient from './../httpClient';

const END_POINT = process.env.BASE_URL;

const register = (dataForm) => httpClient.post(END_POINT + '/auth/register', dataForm);
const login = (dataForm) => httpClient.post(END_POINT + '/auth/login', dataForm);
const me = () => httpClient.get(END_POINT + '/users/me');
const logout = () => httpClient.post(END_POINT + '/users/logout');

export {
    register,
    login,
    me,
    logout
}
````

