# Create Directory Structure
[Directory Structure](https://vuepress.vuejs.org/guide/directory-structure.html#default-page-routing)
````
.
├── docs
│   ├── .vuepress (Optional)
│   │   ├── components (Optional)
│   │   ├── theme (Optional)
│   │   │   └── Layout.vue
│   │   ├── public (Optional)
│   │   ├── styles (Optional)
│   │   │   ├── index.styl
│   │   │   └── palette.styl
│   │   ├── templates (Optional, Danger Zone)
│   │   │   ├── dev.html
│   │   │   └── ssr.html
│   │   ├── config.js (Optional)
│   │   └── enhanceApp.js (Optional)
│   │ 
│   ├── README.md
│   ├── guide
│   │   └── README.md
│   └── config.md
│ 
└── package.json

````
## Routing
| Relative Path    | Page Routing |
| ----------       | --------     |
| /README.md       | /            |
| /guide/README.md | /guide/      |
| /config.md       | /config.html |
