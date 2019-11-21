# Axios
1. Add:
````
npm install --save axios vue-axios
````
2. Create dir:
````
src/backend
└── vue-axios
    ├── axios.js
    └── index.js
````
3. Add to src/main.js:
````
// ... other imports ...
import axios from './backend/vue-axios'

// ...

new Vue({
  el: '#app',
  router,
  axios,
  // ...
})
````
4. Check sign-in:
http://localhost:8082/#/auth/sign-in

test1@wny2.com

12345678

