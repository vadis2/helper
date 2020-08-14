# Navbar
[Navbar](https://vuepress.vuejs.org/theme/default-theme-config.html#navbar)

````
npm install @vuepress/theme-default
````
## Navbar Logo
````
// .vuepress/config.js
module.exports = {
  themeConfig: {
    logo: '/assets/img/logo.png',
    nav: [
          { text: 'Home', link: '/' },
          { text: 'Guide', link: '/guide/' },
          { text: 'External', link: 'https://google.com' }
        ]
  }
}
````
if it is needed:
````
npm run docs:dev
````
Logo must be placed in public folder.

## Routing
| Relative Path    | Page Routing |
| ----------       | --------     |
| /README.md       | /            |
| /guide/README.md | /guide/      |
| /config.md       | /config.html |
