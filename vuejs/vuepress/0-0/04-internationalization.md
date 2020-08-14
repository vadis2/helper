# Multi Languages
1.Create dirs
````
docs
├─ README.md
├─ foo.md
├─ nested
│  └─ README.md
└─ ua
   ├─ README.md
   ├─ foo.md
   └─ nested
      └─ README.md
````
2.Create config.js
````
module.exports = {
    locales: {
        '/': {
            lang: 'en-US',
            title: 'Vadis Blog',
            description: "A demo documentation using VuePress",
            themeConfig: {
                nav: [
                    {text: 'COUNTER', link: '/counter/'},
                    {text: 'GUIDE', link: '/guide/'},
                    {text: 'ABOUT', link: '/guide/'},
                    // { text: 'INTERVIEWS', link: '/interviews/' },
                    {text: 'CONTACTS', link: '/guide/'},
                ],
                sidebar: [
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
            }
        },
        '/ru/': {
            lang: 'ru-RU',
            title: 'Vadis Blog Ru',
            description: "A demo documentation using VuePress ru",
            themeConfig: {
                nav: [
                    {text: 'COUNTER', link: '/counter/'},
                    {text: 'GUIDE', link: '/guide/'},
                    {text: 'ABOUT', link: '/guide/'},
                    // { text: 'INTERVIEWS', link: '/interviews/' },
                    {text: 'CONTACTS', link: '/guide/'},
                ],
                sidebar: [
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
            }
        }    
    }
}
````
