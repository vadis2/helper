# How to use store in a plugin
## plugin logout.js
````
import {logout} from "@/middleware/api/endpoints/users";

export default (context, inject) => {
    const handleLogout = () => {
        logout()
            .then(() => logoutSuccessful())
            .catch((request) => logoutFailed(request));
        
        const logoutSuccessful = () => {
            console.log("In logoutSuccessful()")
            context.app.store.dispatch('auth/setAuthStatus', false);
            cancelUserInCookies();
        };
        
        const cancelUserInCookies = () => {
            console.log("In cancelUserInCookies")
            const payload = {
                name: '',
                role: ''
            }
            context.app.store.dispatch('user/setUser', payload);
            this.$router.push('/account/login');
        };
        
        const logoutFailed = (request) => {
            console.log(request);
        }
    }
    
    // Inject $hello(msg) in Vue, context and store.
    inject('handleLogout', handleLogout)
    
    // For Nuxt <= 2.12, also add 👇
    context.$handleLogout = handleLogout
}

````
## nuxt.config.js
````
plugins: [
        { src: '~/plugins/logout' }
    ],
````
## component
````
methods: {
    this.$handleLogout('methods');
}
````

