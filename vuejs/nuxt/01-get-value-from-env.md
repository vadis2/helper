# Get value from .env
## Link
[What are .env files and how to use them in Nuxt](https://levelup.gitconnected.com/what-are-env-files-and-how-to-use-them-in-nuxt-7f194f083e3d)
## Installation
````
npm install @nuxtjs/dotenv
````
Add in ``nuxt.config.js``:
````
buildModules: [
    '@nuxtjs/dotenv'
],
````
## Using
### .env
``TEST_VARIABLE=Hello world``
### Code
``console.log(process.env.TEST_VARIABLE)``

