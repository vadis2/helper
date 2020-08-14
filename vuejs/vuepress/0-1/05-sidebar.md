# Sidebar
[Sidebar](https://vuepress.vuejs.org/theme/default-theme-config.html#sidebar)
## Structure
Sidebars are bonded to navbar items.
  
## Navbar Logo
````
nav: [
        { text: 'Home', link: '/' },
        { text: 'Guide', link: '/guide/' }, // slashes from bth sides, index == README.md
        { text: 'External', link: 'https://google.com' }
    ],
    sidebar: {
        '/guide': [
            {
                title: 'Counter',
                collapsable: false,
                children: [
                    '/counter/counter-app'
                ]
            },
            {
                title: 'API Guide',
                collapsable: true,
                children: [
                    '/guide/guide',
                    '/guide/api'
                ]
            },
            {
                title: 'Check List Of Web Success',
                collapsable: true,
                children: [
                    '/success/001-intro',
                    '/success/api',
                    '/success/guide'
                ]
            }
        ]
    }}
````
Empty items are ignored.
````
npm run docs:dev
````

## Routing
| Relative Path    | Page Routing |
| ----------       | --------     |
| /README.md       | /            |
| /guide/README.md | /guide/      |
| /config.md       | /config.html |
