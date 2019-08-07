# How to prepare a new route
Do it from existing component.

## src/router/index.js
````
// Views - Books
const Books = () => import('@/views/wny/books/index/Books')

{
  path: 'demo',
  redirect: '/demo/books',
  name: 'Book',
  component: {
    render(c) {
      return c('router-view')
    }
  },
  children: [
    {
      path: 'books',
      name: 'Book',
      component: Books
    }
  ]
},
````
