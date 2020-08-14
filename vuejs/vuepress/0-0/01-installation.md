# Installation
0.Link
https://medium.com/devschacht/%D0%BE%D1%82-%D0%BD%D1%83%D0%BB%D1%8F-%D0%B4%D0%BE-%D0%B4%D0%B5%D0%BF%D0%BB%D0%BE%D1%8F-%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D0%B8%D0%B8-%D1%81-%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E-vue-%D0%B8-vuepress-cf6bde7c9a1f

0.1. Check Node, npm
````
node -v && npm -v
````
1.Create dir.
````
cd ~
cd Documents/Projects
mkdir scotch-vuepress && cd $_
````
2.Installation
Make permissions
````
cd ~/Documents
sudo chown -R $USER:$USER Projects
sudo chmod -R 755 Projects
````
Install project.json
````
npm init -y
````
Install local vue-press
````
npm install -D vuepress
````
3.Create initial structure
````
.
├── docs
│   ├── .vuepress
│   │   ├── components
│   │   │   └── Posts.vue
│   │   ├── config.js
│   │   └── public
│   │       ├── image.jpg
│   │       ├── image-1.jpg
│   │       └── image-2.jpg
│   ├── README.md
│   ├── interviews
│   │   ├── README.md
│   │   ├── post-1.md
│   │   ├── post-2.md
│   │   ├── post-3.md
│   │   └── post-4.md
│   └── second project
│       ├── README.md
│       ├── post-1.md
│       ├── post-2.md
│       ├── post-3.md
│       └── post-4.md
├── package-lock.json
└── package.json
````
````
mkdir docs && cd $_
````
4.Create PHPSTORM project
````
mkdir .vuepress
mkdir counter
mkdir guide
````
create in additional dirs (counte, guide) README.md
````
touch README.md
````
````
cd .vuepress
mkdir components && cd $_
touch counter.vue
touch my-header.vue
````
my-header.vue:
````
<template>
  <div>
    <h1>This Header is actually a Vue Template</h1>
  </div>
</template>
<script></script>
<style scoped></style>
````
counter.vue:
````
<template>
  <div class="counter">
    <h1 class="counter__title">{{ number }}</h1>
    <button class="counter__button" type="button" @click="increment()">increment</button>
    <button class="counter__button" type="button" @click="decrement()">decrement</button>
  </div>
</template>
<script>
  export default {
    data() {
      return{
        number: 0,
      }
    },
    methods:{
      increment() {
        if (this.number >= 0) {
          this.number += 1
        }
      },
      decrement() {
        if (this.number > 0) {
          this.number -= 1
        }
      }
    }
  }
</script>
<style scoped>
.counter {
    display: inline-block;
    margin-left: 30%;
  }
.counter__title {
    text-align: center;
  }
.counter__button {
    display: inline-block;
    padding: 20px;
    margin: 10px;
    font-weight: 700;
    border-radius: 5px;
    box-shadow: 0px 0px 5px 0px rgb(11, 11, 114);
    text-transform: capitalize;
  }
</style>
````



5.Create bash alias
````
sudo nano ~/.bashrc
. ~/.bashrc
````
6.Edit package.json
````
{
  "name": "scotch-vuepress",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  },
  "keywords": [],
  "author": "",
  "license": "MIT",
  "devDependencies": {
    "vuepress": "^0.5.0"
  }
}
````
6.To build
For local vue-press
````
npx vuepress dev docs
````
To search port:
````
netstat -nlp | grep :808*
````
To kill
````
kill -9 27486
````



